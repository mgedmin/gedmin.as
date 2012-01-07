all: env/bin/blogofile

env/bin/pip:
	virtualenv env

env/bin/blogofile: env/bin/pip
	env/bin/pip install blogofile
