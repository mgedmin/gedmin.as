.PHONY: build
build: env/bin/blogofile
	env/bin/blogofile build -s website

.PHONY: vbuild
vbuild: env/bin/blogofile
	env/bin/blogofile build -s website -v

.PHONY: run
run: build
	env/bin/blogofile serve -s website

.PHONY: push
push: build
	git push
	ssh fridge 'cd src/gedmin.as && git pull && make build'

env/bin/blogofile: env/bin/pip
	env/bin/pip install blogofile
	touch -c $@

env/bin/pip:
	virtualenv env

