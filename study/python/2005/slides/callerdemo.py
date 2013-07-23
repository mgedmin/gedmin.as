#!/usr/bin/python
# -*- coding: UTF-8 -*-
import os

print "Aš esu kita programėlė"
pipe = os.popen("./processdemo.py 'a b' c d e", 'r')
data = pipe.read()
result = pipe.close()
print "Gavau %s" % os.WEXITSTATUS(result)
print "Programa išspausdino %r" % data
print "iki!"
