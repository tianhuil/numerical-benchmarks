SHELL := /bin/bash

# set variables
export NAME = numerical-benchmark
export PYTHON = python3
export PIP = pip3
export ROOT_DIR = $(shell pwd)

create:
	$$PYTHON -m venv env

create-install:
	$$PYTHON -m venv env
	source env/bin/activate \
		&& $$PIP install -r requirements.txt \
		&& ipython kernel install --user --name=$$NAME
install:
	source env/bin/activate && $$PIP install -r requirements.txt

# from https://stackoverflow.com/a/3452888/8930600
upgrade:
	source env/bin/activate && $$PIP list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U

ipython:
	source env/bin/activate && ipython --pdb

jupyter:
	source env/bin/activate && jupyter notebook

lint:
	source env/bin/activate && black src/
