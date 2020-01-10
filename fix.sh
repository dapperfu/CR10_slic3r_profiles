#!/bin/sh
LINE_LENGTH=80
PY_VER=py37

pyupgrade --py37-plus --exit-zero-even-if-changed "$1"
reorder-python-imports --${PY_VER}-plus --exit-zero-even-if-changed "$1"
black --target-version ${PY_VER} --line-length=${LINE_LENGTH} "$1"
