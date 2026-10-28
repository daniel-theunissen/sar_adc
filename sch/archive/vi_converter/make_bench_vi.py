#!/usr/bin/env python3
"""Writes the V-to-I converter bench (paper's Fig. 16): vi_converter_bench.spice and vi_converter_loop.spice.

usage:  python3 make_bench_vi.py [--vcm 0.5] [--vfs 1.0] [--vref2 1.55] [--corner tt] [--temp 27]
                                 [--params "wt1=6 lt1=0.5 ..."] [--cdac 0]  [--out vi_converter_bench.spice]
Run `ngspice -b vi_converter_bench.spice` and `ngspice -b vi_converter_loop.spice` in a folder that also holds vi_converter.spice (or vi_converter_fc.spice with --ota fc),
one folder per corner. bench_vi_analysis.ipynb reads the files they write. `--params` is the line vi_converter_sizing.ipynb prints."""
import argparse, math

VDD = 1.8
LIB = '/foss/pdks/sky130A/libs.tech/combined/sky130.lib.spice'
N_FFT_PERIODS = 29                 # coherent sine: 29 periods in the window
T_WIN_US = 256.0                   # -> f_sig = 29 / 256 us = 113.28 kHz (the guide's f_s / N_FFT recipe at 1 MS/s)
SINE_DBFS = -0.5

ap = argparse.ArgumentParser()
ap.add_argument('--vcm', type=float, default=0.5)
ap.add_argument('--vfs', type=float, default=1.0)
ap.add_argument('--vref2', type=float, default=1.55)
ap.add_argument('--corner', default='tt')
ap.add_argument('--temp', type=float, default=27.0)
ap.add_argument('--iref', type=float, default=None, help='accepted for the line the sizing notebook prints; the sink current is set by isk / ws / rsk in --params')
ap.add_argument('--params', default='')
ap.add_argument('--ota', choices=['5t', 'fc'], default='5t', help="'5t': vi_converter.spice (PMOS-input 5T OTA); 'fc': vi_converter_fc.spice (PMOS-input folded cascode)")
ap.add_argument('--pair-model', choices=['std', 'lvt'], default='lvt', help='fc only: model of the OTA input pair in the netlist (default lvt, as the netlist ships)')
ap.add_argument('--t-lvt', action='store_true', help='XT1 / XT2 are sky130_fd_pr__nfet_01v8_lvt in your netlist (only changes the names the operating-point prints look for)')
ap.add_argument('--vd-peak', type=float, default=None, help='differential peak (V) of the range you actually drive; default vfs / 2. Sets the sine, step, end-of-range and common-mode-sweep amplitudes. Use it when the drive is smaller than the circuit full scale (R x I_FS)')
ap.add_argument('--out', default='vi_converter_bench.spice')
ap.add_argument('--loop-out', default='vi_converter_loop.spice')
a = ap.parse_args()
vfs, vcm, vref2 = a.vfs, a.vcm, a.vref2
half = vfs / 2
vdp = half if a.vd_peak is None else a.vd_peak     # differential peak actually driven
amp = vdp * 10 ** (SINE_DBFS / 20)
fsig = N_FFT_PERIODS / (T_WIN_US * 1e-6)

MODEL = {'n': 'nfet_01v8', 'p': 'pfet_01v8', 'nlvt': 'nfet_01v8_lvt', 'plvt': 'pfet_01v8_lvt'}
tm = 'nlvt' if a.t_lvt else 'n'
FC = a.ota == 'fc'
S1 = 's1' if FC else 'xc.s1'          # in the fc netlist s1 is a pin of the converter
INC = 'vi_converter_fc.spice' if a.ota == 'fc' else 'vi_converter.spice'
DEVS = [('xc.xt1', tm), ('xc.xt2', tm), ('xc.xs1', 'n'), ('xc.xs2', 'n'), ('xc.xmsk', 'n')]
if a.ota == 'fc':
    pm = 'plvt' if a.pair_model == 'lvt' else 'p'
    for o in ('xa1', 'xa2'):
        DEVS += [(f'xc.{o}.xm0', 'p'), (f'xc.{o}.xm1', pm), (f'xc.{o}.xm2', pm), (f'xc.{o}.xm3', 'n'), (f'xc.{o}.xm4', 'n'),
                 (f'xc.{o}.xm5', 'n'), (f'xc.{o}.xm6', 'n'), (f'xc.{o}.xm7', 'p'), (f'xc.{o}.xm8', 'p'), (f'xc.{o}.xm9', 'p'), (f'xc.{o}.xm10', 'p')]
    OP_NODES = ('v(xc.vsk) v(xc.vbp1) v(xc.vbn1) v(xc.vbn2) v(xc.vbp2) v(xc.xa1.vx) v(xc.xa2.vx) v(xc.xa1.fa) v(xc.xa1.fb) '
                'v(xc.xa1.d) v(xc.xa1.m1) v(xc.xa1.m2) v(xc.xa2.fa) v(xc.xa2.fb) v(xc.xa2.d)')
    NODESET = (f'v(xc.vsk)=0.65 v(xc.vbp1)=0.7 v(xc.vbn1)=0.65 v(xc.vbn2)=0.8 v(xc.vbp2)=0.45 '
               + ' '.join(f'v(xc.{o}.vx)={vcm + 0.5:.2f} v(xc.{o}.fa)=0.25 v(xc.{o}.fb)=0.25 v(xc.{o}.d)=0.8 v(xc.{o}.m1)=1.6 v(xc.{o}.m2)=1.6' for o in ('xa1', 'xa2')))
else:
    DEVS += [('xc.xmbo', 'p')]
    for o in ('xa1', 'xa2'):
        DEVS += [(f'xc.{o}.xm1', 'p'), (f'xc.{o}.xm2', 'p'), (f'xc.{o}.xm3', 'n'), (f'xc.{o}.xm4', 'n'), (f'xc.{o}.xm5', 'p')]
    OP_NODES = 'v(xc.vsk) v(xc.vbo) v(xc.xa1.net1) v(xc.xa2.net1) v(xc.xa1.vx) v(xc.xa2.vx)'
    NODESET = 'v(xc.vsk)=0.65 v(xc.vbo)=0.9 v(xc.xa1.net1)=0.7 v(xc.xa2.net1)=0.7'

def op_block(log, dv):
    s = [f'  alter Vdc dc = {dv}', '  op', '  let idd = -i(VDD)', '  let io1 = i(Vo1)', '  let io2 = i(Vo2)',
         f'  print idd io1 io2 v(inp) v(inn) v({S1}) v(xc.s2) v(xc.g1) v(xc.g2) {OP_NODES} > {log}']
    for d, ty in DEVS:
        pre = f'@m.{d}.msky130_fd_pr__{MODEL[ty]}'
        s.append(f'  print {pre}[vds] {pre}[vdsat] {pre}[gm] {pre}[id] >> {log}')
    return '\n'.join(s)

COLS = 'io1 io2 vs1 vs2 vg1 vg2 vinp vinn idd'
def defs():
    return '\n'.join(['  let io1 = i(Vo1)', '  let io2 = i(Vo2)', f'  let vs1 = v({S1})', '  let vs2 = v(xc.s2)', '  let vg1 = v(xc.g1)', '  let vg2 = v(xc.g2)',
                      '  let vinp = v(inp)', '  let vinn = v(inn)', '  let idd = -i(VDD)'])

# pwl for the settling test: (time ns, differential volts)
STEPS = [(0, 0.0), (200, 0.0), (200.1, 0.8 * vdp), (1000, 0.8 * vdp), (1000.1, -0.8 * vdp), (1800, -0.8 * vdp), (1800.1, 0.0), (2600, 0.0)]
pwl = ' '.join(f'{t}n {v:.4f}' for t, v in STEPS)

def common(loop):
    lbrk, cbrk = ('1G', '1G') if loop else ('1p', '1f')
    if FC:
        INST = (f'* loop-break parts (the control block alters them to 1G / 1G for the .ac run)\nLb1 s1 fb1 1p\nCb1 tst fb1 1f\n'
                f'xc VDD 0 inp inn iop ion s1 fb1 vi_converter {a.params}')
    else:
        INST = f'xc VDD 0 inp inn iop ion tst vi_converter {a.params} lbrk={lbrk} cbrk={cbrk}'
    return f"""** V-to-I converter bench ({'loop gain' if loop else 'dc / op / transient'}), generated by make_bench_vi.py
.lib {LIB} {a.corner}
.temp {a.temp:g}
.include {INC}
.options reltol=1e-6

VDD VDD 0 {VDD}
* the regulated nodes i1 / i2 of the summing stage are held at V_ref2; the two zero-volt sources are ideal ammeters
Vref2 vref2 0 {vref2}
Vo1 vref2 iop 0
Vo2 vref2 ion 0
* inputs: V+ = Vcm + vd/2, V- = Vcm - vd/2.  vd = Vdc (swept in the dc runs) + sine or steps in the transient runs (selected by Vmode)
Vcm vcm 0 dc {vcm}
Vdc vdc 0 dc 0
Vmode mode 0 dc 0
Vst vst 0 dc 0 pwl({pwl})
Bd vd 0 V = v(vdc) + (1 - v(mode)) * {amp:.5f} * sin(2 * 3.14159265358979 * {fsig:.1f} * time) + v(mode) * v(vst)
Bp inp 0 V = v(vcm) + 0.5 * v(vd)
Bn inn 0 V = v(vcm) - 0.5 * v(vd)
Vtst tst 0 dc 0 ac {1 if (loop or FC) else 0}
{INST}
.nodeset v({S1})={vcm} v(xc.s2)={vcm} v(xc.g1)={vcm + 0.65} v(xc.g2)={vcm + 0.65} {NODESET}
"""

bench = common(False) + f"""
.control
  set wr_singlescale
  set wr_vecnames
  * 1. operating points: mid scale, and the two ends of the input range (T1 or T2 nearly off)
{op_block('op_mid.log', 0)}
{op_block('op_lo.log', -vdp * 0.98)}
{op_block('op_hi.log', vdp * 0.98)}
  alter Vdc dc = 0

  * 2. static transfer: vd from -(half + 0.05) to +(half + 0.05)
  dc Vdc {-(half + 0.05):.3f} {half + 0.05:.3f} 0.002
{defs()}
  wrdata dc_sweep.csv {COLS}

  * 3. input common-mode sweeps at three differential inputs
  alter Vdc dc = {-0.9 * vdp:.3f}
  dc Vcm 0.05 1.45 0.01
{defs()}
  wrdata cm_sweep_lo.csv {COLS}
  alter Vdc dc = 0
  dc Vcm 0.05 1.45 0.01
{defs()}
  wrdata cm_sweep_mid.csv {COLS}
  alter Vdc dc = {0.9 * vdp:.3f}
  dc Vcm 0.05 1.45 0.01
{defs()}
  wrdata cm_sweep_hi.csv {COLS}
  alter Vdc dc = 0

  * 4. voltage of the regulated nodes (where do T1 and T2 stay saturated?)
  dc Vref2 0.3 1.8 0.01
{defs()}
  wrdata out_sweep.csv {COLS}
  alter Vref2 dc = {vref2}

  * 5. transient with the coherent sine ({SINE_DBFS} dBFS, {fsig / 1e3:.2f} kHz, {N_FFT_PERIODS} periods in {T_WIN_US:g} us)
  alter Vmode dc = 0
  option reltol=1e-4
  tran 5n {T_WIN_US}u
  let vdiff = v(inp) - v(inn)
  let io1 = i(Vo1)
  let io2 = i(Vo2)
  wrdata tran_sine.csv vdiff io1 io2

  * 6. transient with large steps (settling): 0 -> +0.8 vd-peak -> -0.8 vd-peak -> 0
  alter Vmode dc = 1
  tran 0.1n 2.6u
  let vdiff = v(inp) - v(inn)
  let io1 = i(Vo1)
  let io2 = i(Vo2)
  let vg1 = v(xc.g1)
  let vs1 = v({S1})
  wrdata tran_step.csv vdiff io1 io2 vg1 vs1
.endc
.end
"""

loop = common(True) + f"""
.control
  set wr_singlescale
  set wr_vecnames
  * loop gain of side 1: the feedback into OTA 1 is broken at fb1 (1 GH), the test signal comes in through 1 GF at `tst`.
  * T(s) = - v(s1) / v(fb1); v(fb1) is the test signal itself. Three operating points: mid scale and the two ends.
  alter Vdc dc = 0
  op
  ac dec 40 1k 10G
  let lg = -v(xc.s1)
  wrdata ac_loop_mid.csv lg
  alter Vdc dc = {-0.9 * vdp:.3f}
  op
  ac dec 40 1k 10G
  let lg = -v(xc.s1)
  wrdata ac_loop_lo.csv lg
  alter Vdc dc = {0.9 * vdp:.3f}
  op
  ac dec 40 1k 10G
  let lg = -v(xc.s1)
  wrdata ac_loop_hi.csv lg
.endc
.end
"""
if FC:
    loop_ctl = f"""
  * 7. loop gain of side 1: open the feedback into OTA 1 (1 GH from s1 to fb1) and feed the test signal in through 1 GF at tst.
  *    T(s) = - v(s1) / v(fb1); v(fb1) is the test signal itself. Mid scale and the two ends of the range.
  alter Vdc dc = 0
  alter Lb1 = 1G
  alter Cb1 = 1G
  op
  ac dec 40 1k 10G
  let lg = -v(s1)
  wrdata ac_loop_mid.csv lg
  alter Vdc dc = {-0.9 * vdp:.3f}
  op
  ac dec 40 1k 10G
  let lg = -v(s1)
  wrdata ac_loop_lo.csv lg
  alter Vdc dc = {0.9 * vdp:.3f}
  op
  ac dec 40 1k 10G
  let lg = -v(s1)
  wrdata ac_loop_hi.csv lg
  alter Lb1 = 1p
  alter Cb1 = 1f
  alter Vdc dc = 0
"""
    bench = bench.replace('.endc\n.end', loop_ctl + '.endc\n.end')
open(a.out, 'w').write(bench)
if not FC:
    open(a.loop_out, 'w').write(loop)
print(f'wrote {a.out}' + ('' if FC else f' and {a.loop_out}') + f'  (vcm {vcm} V, vfs {vfs} V, corner {a.corner}, {a.temp:g} C)')
