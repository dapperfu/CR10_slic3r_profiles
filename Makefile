.DEFAULT: all
.PHONY: all
all: print

.PHONY: null
null:
	@echo No default make target

# Python targets
VENV = .venv

.PHONY: venv
venv: ${VENV}

${VENV}:
	python3 -mvenv ${@}

.PHONY: pip
pip: ${VENV}
	${VENV}/bin/pip install -U pip setuptools wheel
	${VENV}/bin/pip install -U -r requirements.txt

.PHONY: bootstrap
bootstrap:
	sudo apt-get install python3 python3-venv slic3r

.PHONY: clean
clean:
	git clean -xfd


print: pip
	${VENV}/bin/python unbundle.py Slic3r_config_bundle.ini
