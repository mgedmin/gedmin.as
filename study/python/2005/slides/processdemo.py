#!/usr/bin/python
# -*- coding: UTF-8 -*-
import sys

print "Aš esu procesas!"
print "Mano argumentai: %s" % ' '.join('[%s]' % a for a in sys.argv)
sys.exit(42)
