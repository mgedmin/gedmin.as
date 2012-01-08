.PHONY: build
build: env/bin/blogofile
	env/bin/blogofile -s website build

.PHONY: vbuild
vbuild: env/bin/blogofile
	env/bin/blogofile -s website -v build

.PHONY: run
run: build
	env/bin/blogofile -s website serve

.PHONY: push
push: build
	git push
	ssh fridge 'cd src/gedmin.as && git pull && make build'

env/bin/blogofile: env/bin/pip
	env/bin/pip install blogofile

env/bin/pip:
	virtualenv env

