import unittest
import doctest

if __name__ == '__main__':
    optionflags = (doctest.REPORT_NDIFF
                   | doctest.ELLIPSIS
                   | doctest.REPORT_ONLY_FIRST_FAILURE)

    tests = unittest.TestSuite([
        doctest.DocFileSuite('README.txt', optionflags=optionflags),
        doctest.DocTestSuite('doctestsample', optionflags=optionflags),
    ])
    unittest.TextTestRunner().run(tests)
