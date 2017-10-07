.DEFAULT: null
.PHONY: null
null:
	@echo No default make target

# Python targets
VENV = .venv

.PHONY: venv
venv: ${VENV}

${VENV}:
	python3 -mvenv ${@}

.PHONY: dev
dev:
	pip install -U pip setuptools wheel
	pip install -U -r requirements.txt

.PHONY: bootstrap
bootstrap:
	sudo apt-get install python3 python3-venv slic3r

.PHONY: clean
clean:
	rm -rf ${VENV}
