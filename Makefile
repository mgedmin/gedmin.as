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

.PHONY: diff
diff: bin/ghp-import build
	ghp-import -m "Preview" -b gh-temp website/_site/
	-git diff -p --stat origin/gh-pages gh-temp
	git branch -D gh-temp

.PHONY: publish
publish: bin/ghp-import build
	bin/ghp-import -n -m "Update site" website/_site/
	git push --all
	ssh fridge 'cd gedmin.as && git pull'

# web key directory
GPG_ID = 8121AD32F00A8094748A6CD09157445DE7A6D78F
EMAIL = marius@gedmin.as

.PHONY: wkd
wkd:
	rm -rf openpgpkey
	mkdir openpgpkey
	echo $(GPG_ID) $(EMAIL) | /usr/lib/gnupg/gpg-wks-client -v --install-key
	mkdir -p website/.well-known/openpgpkey
	touch website/.well-known/openpgpkey/policy
	rm -rf website/.well-known/openpgpkey/hu
	mv openpgpkey/gedmin.as/hu website/.well-known/openpgpkey/
	rm -rf openpgpkey

website/_site:
	$(make) build

bin/blogofile: bin/pip
	bin/pip install blogofile==0.7.1
	touch -c $@

bin/ghp-import: bin/pip
	bin/pip install ghp-import
	touch -c $@

bin/pip:
	virtualenv -p python2.7 .

