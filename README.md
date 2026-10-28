# 7-bit current-mode SAR ADC (sky130A)

Schematics in xschem, simulation in ngspice, sizing from pygmid gm/Id lookup tables, and analysis in Jupyter notebooks. See [ARCHITECTURE.md](ARCHITECTURE.md) for the signal chain, design equations and current results.

## Layout

| Path | Contents |
| --- | --- |
| `sch/sarlib/specs.py` | Single source of truth for every design input and pass/fail limit |
| `sch/sarlib/gmid.py` | Lookup tables and gm/Id device sizing |
| `sch/sarlib/analysis.py` | ngspice output readers and the pass/fail report |
| `sch/adc/` | Top-level ADC testbench and analysis |
| `sch/vi_converter/` | V-to-I converter: sizing, bench |
| `sch/cascode/` | Regulated cascodes and their OTAs: sizing, benches C and D |
| `sch/summing_stage/` | Summing stage (bench E) and clamp cell (bench F) |
| `sch/comparator/` | Comparator: sizing, bench G |
| `sch/ladder/` | M2M ladder and its unit-device sizing |
| `sch/gmid/` | Techsweep testbenches, table conversion and gm/Id plots |
| `sch/cosim/` | SAR-controller symbols and binaries for mixed-signal simulation |
| `rtl/` | SAR controller RTL and cocotb tests |
| `sch/archive/` | Superseded schematics, notebooks and scripts |

## Setup

```sh
cd sch
python -m venv .venv && . .venv/bin/activate
pip install -e . jupyter
```

The sizing notebooks need the lookup tables `sch/gmid/{nfet_01v8,pfet_01v8,pfet_01v8_lvt}.mat`. They are not tracked. To regenerate them, simulate `gmid/gmid_*.sch` and convert the output with `gmid/techsweep_txt_to_mat.ipynb`.

## Flow

1. Edit inputs in `sarlib/specs.py`.
2. Run the block's sizing notebook and copy the device sizes into its schematic.
3. Simulate the block's testbench in xschem (`xschem` from `sch/`, which picks up `sch/xschemrc`). Outputs land in `<block>/simulation/<testbench>.sch/`.
4. Run the block's analysis notebook. It ends in a pass/fail table against the limits in `specs.py`.
