PUBLISH_BRANCH = gh-pages
DEPLOY_SERVER = root@egle
DEPLOY_DIR = /var/www/gedmin.as

output_dir = website/_site

.PHONY: build
build:                  ##: build a preview
	uv run build -q

.PHONY: preview
preview: build          ##: build a preview and open it in a browser
	xdg-open $(output_dir)/index.html

.PHONY: watch
watch:                  ##: watch for changes and rebuild the preview
	$(MAKE) build WEBSITE_TARGET=production
	uv run live

.PHONY: checklinks
checklinks: build       ##: check for broken links
	uv run linkchecker -f linkcheckerrc --file-output=html $(output_dir)

.PHONY: diff
diff: gh-temp           ##: compare built files against current version
	-git diff origin/gh-pages gh-temp
	git branch -D gh-temp

.PHONY: diffstat
diffstat: gh-temp       ##: summarize the diff
	-git diff --stat origin/gh-pages gh-temp
	git branch -D gh-temp

.PHONY: gh-temp
gh-temp:
	$(MAKE) build WEBSITE_TARGET=production
	ghp-import -m "Preview" -b gh-temp $(output_dir)

.PHONY: publish
publish:                ##: build and push changes to the live site
	$(MAKE) build WEBSITE_TARGET=production
	uv run ghp-import -b $(PUBLISH_BRANCH) -n -m "Update site" $(output_dir)
	git push --all
	ssh $(DEPLOY_SERVER) 'cd $(DEPLOY_DIR) && git pull'

# web key directory
GPG_ID = 8121AD32F00A8094748A6CD09157445DE7A6D78F
EMAIL = marius@gedmin.as

.PHONY: wkd
wkd:                            ##: (re)generate the web key directory
	rm -rf openpgpkey
	mkdir openpgpkey
	echo $(GPG_ID) $(EMAIL) | /usr/lib/gnupg/gpg-wks-client -v --install-key
	mkdir -p website/.well-known/openpgpkey
	touch website/.well-known/openpgpkey/policy
	rm -rf website/.well-known/openpgpkey/hu
	mv openpgpkey/gedmin.as/hu website/.well-known/openpgpkey/
	rm -rf openpgpkey

.PHONY: clean
clean:                  ##: clean generated content and caches
	rm -rf $(output_dir) __pycache__/ *.egg-info/ linkchecker-out.html

.PHONY: realclean
realclean: clean        ##: clean everything
	rm -rf .venv/

include help.mk
HELP_WIDTH = 16
