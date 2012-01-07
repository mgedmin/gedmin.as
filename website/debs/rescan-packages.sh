#!/bin/sh
set -x
cd `dirname $0`/..
dpkg-scanpackages debs /dev/null | gzip > debs/Packages.gz
dpkg-scansources debs /dev/null | gzip > debs/Sources.gz
