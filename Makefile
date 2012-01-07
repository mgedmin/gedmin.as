.PHONY: build
build: env/bin/blogofile
	env/bin/blogofile -s website build

.PHONY: run
run: build
	env/bin/blogofile -s website serve

env/bin/blogofile: env/bin/pip
	env/bin/pip install blogofile

env/bin/pip:
	virtualenv env

