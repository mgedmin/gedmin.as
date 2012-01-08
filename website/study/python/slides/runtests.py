import unittest
import glob

suite = unittest.TestSuite()
for testfile in glob.glob('test_*.py'):
    module = __import__(testfile.replace('.py', ''))
    suite.addTest(module.test_suite())

unittest.TextTestRunner(verbosity=2).run(suite)
