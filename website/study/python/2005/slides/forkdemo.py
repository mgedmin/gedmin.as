#!/usr/bin/python
# -*- coding: UTF-8 -*-
import os
import time
import sys

pid = os.fork()
if pid == 0:
    print "I'm the child!"
    for i in range(5):
        time.sleep(0.5)
        print "child: %s" % i
    sys.exit(0)
else:
    print "I'm the parent!"
    for i in range(5):
        time.sleep(0.5)
        print "parent: %s" % i

print "Both"
for i in range(3):
    time.sleep(0.5)
    print "both: %s" % i
