# 7-bit current-mode SAR ADC (sky130A)

Schematics in xschem, simulation in ngspice, sizing from pygmid gm/Id lookup tables, and analysis in Jupyter notebooks. See [ARCHITECTURE.md](ARCHITECTURE.md) for the signal chain, design equations and current results.

## Layout

| Path | Contents |
| --- | --- |
| `sch/sarlib/specs.py` | Requirements, operating conditions, cross-block measured values and pass/fail limits |
| `sch/sarlib/gmid.py` | Lookup tables, gm/Id device sizing and hand-estimate process constants |
| `sch/sarlib/analysis.py` | ngspice output readers and the pass/fail report |
| `sch/adc/` | Top-level ADC testbench and analysis |
| `sch/vi_converter/` | V-to-I converter: sizing and analysis |
| `sch/cascode/` | Regulated cascodes and their OTAs: sizing, NMOS cascode and OTA analyses |
| `sch/summing_stage/` | Summing stage and clamp-cell analyses |
| `sch/comparator/` | Comparator: sizing and analysis |
| `sch/ladder/` | M2M ladder: unit-device sizing and analysis |
| `sch/gmid/` | Techsweep testbenches, table conversion and gm/Id plots |
| `sch/cosim/` | SAR-controller symbols and binaries for mixed-signal simulation |
| `rtl/` | SAR controller RTL and cocotb tests |
| `sch/archive/` | Superseded schematics, notebooks and scripts |

## Setup

This project is intended to be run inside of the [iic-osic-tools](https://github.com/iic-jku/iic-osic-tools) docker container. Several filepaths might have to be changed for a local build.

```sh
sak-pdk sky130A
cd sch
python -m venv .venv && . .venv/bin/activate
pip install -e . jupyter
```

The sizing notebooks need the lookup tables `sch/gmid/{nfet_01v8,pfet_01v8,pfet_01v8_lvt}.mat`. They are not tracked. To regenerate them, simulate `gmid/gmid_*.sch` and convert the output with `gmid/techsweep_txt_to_mat.ipynb`.

## Flow

1. Requirements and limits are in `sarlib/specs.py`; device sizing choices are at the top of each sizing notebook.
2. Run the block's sizing notebook and copy the device sizes into its schematic.
3. Simulate the block's testbench in xschem (`xschem` from `sch/`, which picks up `sch/xschemrc`). Outputs land in `<block>/simulation/<testbench>.sch/`.
4. Run the block's analysis notebook. It ends in a pass/fail table against the limits in `specs.py`.

## Disclosure

This project was created with assistance from AI tools. Specifically, the analysis scripts and the gm/id sizing functions were generated using an LLM. I have reviewed and edited this work and have retained records of my generative AI use. For more information on the extent and nature of AI usage, please contact me.
