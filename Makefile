.DEFAULT: null
.PHONY: null
null:
	@echo No default make target

.PHONY: all
all: build

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
	git clean -fd


.PHONY: build
build: ${VENV}
	rm -rf filament print printer
	${VENV}/bin/python unbundle.py Slic3r_config_bundle.ini
	git add filament print printer
	git commit -am "Build: `date`"
	git push origin HEAD:master

