import os
from pathlib import Path
from cocotb_tools.runner import get_runner

def test_top():
    sim = os.getenv("SIM", "icarus")
    proj_path = Path(__file__).resolve().parent.parent

    runner = get_runner(sim)
    runner.build(
        sources=[proj_path / "src/top.sv"],
        hdl_toplevel="top",
        build_dir=proj_path / "test" / "sim_build",
        always=True,
        waves=True,
    )
    runner.test(
        hdl_toplevel="top",
        test_module="test_top",
        waves=True,
    )

if __name__ == "__main__":
    test_top()