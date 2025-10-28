.venv:
	python3.10 -m venv .venv

.PHONY: setup
setup: .venv
	. .venv/bin/activate && python -m pip install -r requirements.txt
	. .venv/bin/activate && pip install wheel setuptools

.PHONY: release
release: setup
	rm -rf build
	mkdir build
	rm -rf wheel
	mkdir wheel
	. .venv/bin/activate && python setup.py bdist_wheel -d build
	. .venv/bin/activate && python -m twine upload build/*.whl --repository mpsiemlib-axelpro
