PY_PLATFORM=$(shell python -c 'import distutils.util;print distutils.util.get_platform()')
PY_VERSION=$(shell python -c 'import sys;print "%i.%i" % sys.version_info[:2]')
LIB=build/lib.$(PY_PLATFORM)-$(PY_VERSION)
PYTHON=PYTHONPATH=$(LIB) python

.PHONY: build test docs

build:
	python setup.py build

test: build
	$(PYTHON) $(LIB)/jo/__init__.py

README.rst:
	$(PYTHON) -c 'import jo;print jo.__doc__' > README.rst

docs: README.rst
