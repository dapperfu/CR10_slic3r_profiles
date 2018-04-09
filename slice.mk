# slic3r config
FILAMENT ?= H230-B70
PRINT ?= fine5
PRINTER ?= CR10
NOZZLE ?= 0.4
PRINT_CENTER ?= 150,150

# Find STL files if not already specified.
STL ?= $(shell find . -name "*.stl" | sort)

## Output Configuration:
# Directory structure for the output gcode.
GCODE_PATH:=build/${PRINTER}-${NOZZLE}-${FILAMENT}
# Add suffix to base .stl
GCODE_NAME:=-${PRINT}
# Build gcode file path.
GCODE:=$(patsubst %.stl, \
	${GCODE_PATH}/%${GCODE_NAME}.gcode, \
	${STL:./%=%})

# Determine the number of threads to use.
THREADS?=$(shell grep -c ^processor /proc/cpuinfo)

# G-Code targets.
.PHONY: gcode
gcode: ${GCODE}

# Slice the STL files into G-code
${GCODE_PATH}/%${GCODE_NAME}.gcode: %.stl
	@mkdir -p ${dir ${@}}
	@echo Slicing: ${<}
	@slic3r --print-center=${PRINT_CENTER} \
	  --nozzle-diameter=${NOZZLE} \
	  --threads=${THREADS} \
	  --load=slic3r_profiles/filament/${FILAMENT} \
	  --load=slic3r_profiles/print/${PRINT} \
	  --load=slic3r_profiles/printer/${PRINTER} \
	  --output=${@} \
	  ${<}
