import unittest

class TestBar(unittest.TestCase):

    def test_bar(self):
        pass


def test_suite():
    return unittest.makeSuite(TestBar)
