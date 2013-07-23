.PHONY: build
build: bin/blogofile
	bin/blogofile build -s website

.PHONY: vbuild
vbuild: bin/blogofile
	bin/blogofile build -s website -v

.PHONY: run
run: build
	bin/blogofile serve -s website

.PHONY: push
push: build
	git push
	ssh fridge 'cd src/gedmin.as && git pull && make build'

bin/blogofile: bin/pip
	bin/pip install blogofile
	touch -c $@

bin/pip:
	virtualenv .

