.PHONY: build
build: bin/blogofile
	bin/blogofile build -s website

.PHONY: vbuild
vbuild: bin/blogofile
	bin/blogofile build -s website -v

.PHONY: run
run: build
	bin/blogofile serve -s website

.PHONY: preview
preview: website/_site/
	xdg-open website/_site/index.html

.PHONY: publish
publish: bin/ghp-import build
	bin/ghp-import -m "Update site" website/_site/
	git push --all
	ssh fridge 'cd gedmin.as && git pull'

website/_site:
	$(make) build

bin/blogofile: bin/pip
	bin/pip install blogofile==0.7.1
	touch -c $@

bin/ghp-import: bin/pip
	bin/pip install ghp-import
	touch -c $@

bin/pip:
	virtualenv .

