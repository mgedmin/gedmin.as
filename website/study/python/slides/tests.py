# test.py
import unittest
import os
import tempfile
import shutil
import glob
import difflib
from StringIO import StringIO

from eqns import solve, readInput, writeOutput


class TestSolve(unittest.TestCase):

    def test_no_solutions(self):
        # x**2 + 4 = 0
        self.assertEquals(
              solve(1, 0, 4), [42])

    def test_two_solutions(self):
        # (x - 3)(x + 2) = 0
        # x**2 - x - 6 = 0
        self.assertEquals(
              solve(1, -1, -6),
              [-2, 3])

    def test_one_solution(self):
        # (x - 5)**2 = 0
        # x**2 - 10x + 25 = 0
        self.assertEquals(
              solve(1, -10, 25),
              [5])


class TestInput(unittest.TestCase):
    sampleinput = [
      '3, 4, 5\n',
      '1, -3, 22\n',
      '0.5, -.16, 42.3\n'
    ]

    def test_input(self):
        self.assertEquals(
            readInput(self.sampleinput),
            [(3, 4, 5),
             (1, -3, 22),
             (.5, -0.16, 42.3)])


class TestOutput(unittest.TestCase):
    samplesolutions = [
        [-3.0, 4.5],
        [],
        [17.2],
    ]

    def test_output(self):
        f = StringIO()
        writeOutput(f, self.samplesolutions)
        self.assertEquals(f.getvalue(),
                          "-3.0, 4.5\n"
                          "no solutions\n"
                          "17.2\n")


class TestEverything(unittest.TestCase):

    def setUp(self):
        self.tempdir = tempfile.mkdtemp()
        self.outfilename = os.path.join(self.tempdir,
                                        'sample.out')

    def tearDown(self):
        shutil.rmtree(self.tempdir)

    def test(self):
        for testfile in glob.glob('test*.in'):
            outfile = testfile.replace('.in', '.out')
            os.system("python eqns.py %s %s"
                      % (testfile, self.outfilename))
            input = file(testfile).readlines()
            result = file(self.outfilename).readlines()
            expected = file(outfile).readlines()
            self.compareOutput(input, result, expected)

##  def compareOutput(self, input, result, expected):
##      self.assertEqual(result, expected,
##                       'diff:\n' +
##                       self.diff(result, expected))

##  def diff(self, result, expected):
##      return ''.join(difflib.ndiff(expected, result))

    def compareOutput(self, input, result, expected):
        for i_line, r_line, e_line in zip(input, result,
                                          expected):
            if r_line != e_line:
                self.fail("for this input:\n"
                          "    %s\n"
                          "expected:\n"
                          "    %s\n"
                          "got:\n"
                          "    %s\n"
                          % (i_line, e_line, r_line))


if __name__ == '__main__':
    unittest.main()
