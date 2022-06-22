.PHONY: docs venv requirements

docs:
	rm -rf docs/*
	docker run \
		--rm \
		-v ${PWD}:/k8std \
		jsonnetlibs/docsonnet:master \
		-o /k8std/docs \
		/k8std/main.libsonnet

venv:
	python3 -m venv .venv

requirements:
	pip3 --require-virtualenv install -r requirements.txt
