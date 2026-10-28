# ============================================================
# iCEBreaker FPGA build via iic-osic-tools container
# ============================================================

# --- Container / mount setup (confirmed via `docker inspect`) ---
CONTAINER          := iic-osic-tools_xserver_uid_1000
DESIGNS_DIR        := /home/dt/eda/designs/sar_adc
CONTAINER_DESIGNS  := /foss/designs
IIC_OSIC_DIR := /home/dt/iic-osic-tools


PROJECT_DIR := $(CURDIR)

# Path of this project relative to DESIGNS_DIR, if it's actually under it.
REL_PATH := $(patsubst $(DESIGNS_DIR)/%,%,$(PROJECT_DIR))

CONTAINER_PROJDIR := $(CONTAINER_DESIGNS)/$(REL_PATH)

# --- Design settings ---
TOP     := top
SRC     := src/top.sv
PCF     := iceBlinkPico.pcf
DEVICE  := --up5k
PACKAGE := sg48

JSON := $(TOP).json
ASC  := $(TOP).asc
BIN  := $(TOP).bin

.PHONY: all check-mount check-container synth pnr pack prog flash \
        clean recreate-container

all: check-mount synth pnr pack

# --- Verify this project actually lives under the mounted tree ---
# (the container can only see paths under DESIGNS_DIR; anything else
#  needs recreate-container with a wider mount, or moving the project)
check-mount:
	@case "$(PROJECT_DIR)" in \
		$(DESIGNS_DIR)/*) : ;; \
		*) echo "Error: $(PROJECT_DIR) is not under $(DESIGNS_DIR)." >&2; \
		   echo "Either move this project under $(DESIGNS_DIR), or widen the" >&2; \
		   echo "container's mount and update DESIGNS_DIR (see 'make recreate-container')." >&2; \
		   exit 1 ;; \
	esac

check-container:
	@docker ps --format '{{.Names}}' | grep -qx "$(CONTAINER)" || \
		{ echo "Error: container $(CONTAINER) is not running. Start it with ./start_x.sh" >&2; exit 1; }

# --- Build steps (run inside the container) ---
synth: check-mount check-container
	docker exec -w "$(CONTAINER_PROJDIR)" $(CONTAINER) \
		bash -lc "yosys -p 'synth_ice40 -top $(TOP) -json $(JSON)' $(SRC)"

pnr: synth
	docker exec -w "$(CONTAINER_PROJDIR)" $(CONTAINER) \
		bash -lc "nextpnr-ice40 $(DEVICE) --package $(PACKAGE) --json $(JSON) --pcf $(PCF) --asc $(ASC)"

pack: pnr
	docker exec -w "$(CONTAINER_PROJDIR)" $(CONTAINER) \
		bash -lc "icepack $(ASC) $(BIN)"

stat: check-mount check-container
	docker exec -w "$(CONTAINER_PROJDIR)" $(CONTAINER) \
		bash -lc "yosys -p 'synth_ice40 -top $(TOP) -json $(JSON); stat' $(SRC)"

.PHONY: stat

# --- Flash step: runs natively on the HOST, not in the container ---
# Requires icestorm's iceprog installed on the host (needs USB access to the board)
prog flash: pack
	iceprog $(PROJECT_DIR)/$(BIN)

# --- Cleanup ---
clean:
	rm -f -r $(JSON) $(ASC) $(BIN) test/sim_build/


recreate-container:
	@echo "This will remove and recreate $(CONTAINER), remounting $(DESIGNS_DIR)."
	@echo "Any other session using this container will be disconnected."
	@read -p "Continue? [y/N] " ans; [ "$$ans" = "y" ] || exit 1
	docker rm -f $(CONTAINER) || true
	cd $(IIC_OSIC_DIR) && DESIGNS=$(DESIGNS_DIR) ./start_x.sh

SIM ?= icarus

.PHONY: cocotb-test

cocotb-test: check-mount check-container
	docker exec -w "$(CONTAINER_PROJDIR)/test" -e SIM=$(SIM) $(CONTAINER) \
		bash -lc "python3 test_runner.py"

.PHONY: waves

waves:
	docker exec -w "$(CONTAINER_PROJDIR)/test" $(CONTAINER) \
		bash -lc 'gtkwave $$(find sim_build \( -name "*.fst" -o -name "*.vcd" \) | head -n1)'