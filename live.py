from livereload import Server, shell


def ignore(fn):
    return '_site/' in fn


def main():
    server = Server()
    server.watcher.watch(
        'website',
        shell('make build WEBSITE_TARGET=production'),
        ignore=ignore)
    server.serve(root='website/_site', open_url_delay=True, debug=False)
