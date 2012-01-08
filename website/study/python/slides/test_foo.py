import unittest

class TestFoo(unittest.TestCase):

    def test_foo1(self):
        pass

    def test_foo2(self):
        pass

class TestFooMoreIntensively(unittest.TestCase):

    def test_foo1(self):
        pass

    def test_foo2(self):
        pass

def test_suite():
    return unittest.TestSuite([
        unittest.makeSuite(TestFoo),
        unittest.makeSuite(TestFooMoreIntensively),
                               ])
