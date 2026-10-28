import random

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, Timer
from cocotb.utils import get_sim_time

from sar_check import CYCLES_PER_CONV, check_trace, expected_code

CLK_NS = 10
COMP_SETTLE_NS = 5


class Env:
    vin = 0.0


async def comparator(dut, env):
    release_t = None
    while True:
        await Timer(1, "ns")
        t = get_sim_time("ns")
        if int(dut.phi2.value) == 0:
            if release_t is None:
                release_t = t
            if t - release_t >= COMP_SETTLE_NS:
                dut.cmp.value = int(env.vin > int(dut.sar_reg.value) / 128)
            else:
                dut.cmp.value = random.randint(0, 1)
        else:
            release_t = None
            dut.cmp.value = random.randint(0, 1)


async def recorder(dut, trace):
    while True:
        await RisingEdge(dut.clk)
        await Timer(1, "ns")
        trace.append(dict(phi1=int(dut.phi1.value), phi2=int(dut.phi2.value), sar=int(dut.sar_reg.value),
                          eoc=int(dut.eoc.value), d=int(dut.d_out.value), t=get_sim_time("ns")))


async def apply_reset(dut, cycles=5):
    dut.rst.value = 0
    for _ in range(cycles):
        await RisingEdge(dut.clk)
    await Timer(1, "ns")
    assert int(dut.phi1.value) == 0
    assert int(dut.phi2.value) == 1
    assert int(dut.sar_reg.value) == 0
    assert int(dut.d_out.value) == 0
    assert int(dut.eoc.value) == 0


async def wait_eoc(dut):
    while True:
        await RisingEdge(dut.clk)
        await Timer(1, "ns")
        if int(dut.eoc.value) == 1:
            return


@cocotb.test()
async def conversions(dut):
    env = Env()
    trace = []
    vins = [(k + 0.5) / 128 for k in range(128)] + [0.0, 0.9999] + [random.random() for _ in range(40)]

    dut.cmp.value = 0
    cocotb.start_soon(Clock(dut.clk, CLK_NS, "ns").start())
    await apply_reset(dut)
    cocotb.start_soon(comparator(dut, env))
    cocotb.start_soon(recorder(dut, trace))

    env.vin = random.random()
    dut.rst.value = 1
    await wait_eoc(dut)

    for v in vins:
        env.vin = v
        await wait_eoc(dut)

    errors = check_trace(trace, vins)
    for e in errors[:20]:
        dut._log.error(e)
    assert not errors, f'{len(errors)} errors, first: {errors[0]}'


@cocotb.test()
async def reset_midway(dut):
    env = Env()
    trace = []
    cocotb.start_soon(Clock(dut.clk, CLK_NS, "ns").start())
    dut.cmp.value = 0
    await apply_reset(dut)
    cocotb.start_soon(comparator(dut, env))

    env.vin = 0.37
    dut.rst.value = 1
    for _ in range(random.randint(150, 450)):
        await RisingEdge(dut.clk)
    await Timer(1, "ns")
    await apply_reset(dut, cycles=3)

    cocotb.start_soon(recorder(dut, trace))
    dut.rst.value = 1
    await wait_eoc(dut)
    await wait_eoc(dut)
    assert int(dut.d_out.value) == expected_code(0.37)
    assert trace[-1]['t'] - trace[-1 - CYCLES_PER_CONV]['t'] == CYCLES_PER_CONV * CLK_NS