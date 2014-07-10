PY_PLATFORM=$(shell python -c 'import distutils.util;print distutils.util.get_platform()')
PY_VERSION=$(shell python -c 'import sys;print "%i.%i" % sys.version_info[:2]')
LIB=build/lib.$(PY_PLATFORM)-$(PY_VERSION)
PYTHON=PYTHONPATH=$(LIB) python
FULLNAME=$(shell python setup.py --fullname)

.PHONY: build test docs sdist deb

build:
	python setup.py build

test: build docs
	$(PYTHON)2 $(LIB)/jo/__init__.py
	$(PYTHON)3 $(LIB)/jo/__init__.py
	$(PYTHON)2 -c 'import doctest;doctest.testfile("README.rst")'
	$(PYTHON)3 -c 'import doctest;doctest.testfile("README.rst")'

README.rst: jo/__init__.py
	$(PYTHON)3 -c 'import jo;print (jo.__doc__)' > README.rst

docs: README.rst

sdist: $(FULLNAME).tar.gz

$(FULLNAME).tar.gz: build
	python setup.py sdist

deb: $(FULLNAME).tar.gz
	cd dist; tar -xf $(FULLNAME).tar.gz; cd $(FULLNAME); debuild -i -uc -us
