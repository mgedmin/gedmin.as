import unittest
import doctest


def points(fn, xmin, xmax, xstep):
    result = []
    x = float(xmin)
    while x <= xmax:
        try:
            y = eval(fn, {'x': x})
        except ZeroDivisionError:
            y = None
        result.append((x, y))
        x += xstep
    return result


class TestPoints(unittest.TestCase):

    def test_ranges(self):
        self.compare(points('x', -1, 3, 1),
                          [(-1, -1), (0, 0), (1, 1),  (2, 2), (3, 3)])
        self.compare(points('x', -2, 2, 2),
                          [(-2, -2), (0, 0), (2, 2)])

    def test_functions(self):
        self.compare(points('x**2', -2, 2, 2),
                          [(-2, 4), (0, 0), (2, 4)])

    def test_discontinuities(self):
        self.compare(points('1/x', -2, 2, 2),
                          [(-2, -0.5), (0, None), (2, 0.5)])

    def test_float_division(self):
        self.compare(points('1/x', 1, 2, 0.5),
                          [(1, 1), (1.5, 2/3.), (2, 0.5)])

    def compare(self, result, expected):
        """Compare two sets of points, up to 2 decimal places of accuracy

            >>> tp = TestPoints('test_ranges')
            >>> tp.compare([(1, 2), (2/3, None)], [(1, 2.0), (.66, None)])
            >>> tp.compare([(1, 2), (2/3, None)], [(1, 3), (2, 4)])
            Traceback (most recent call last):
              ...
            AssertionError: ['(1.00, 2.00)', '(0.00, None)'] != ['(1.00, 2.00)', '(0.66, None)']

        """
        def format(xy):
            x, y = xy
            if y is None:
                return '(%.2f, None)' % x
            else:
                return '(%.2f, %.2f)' % xy
        result = [format(xy) for xy in result]
        expected = [format(xy) for xy in expected]
        self.assertEquals(result, expected)


if __name__ == '__main__':
    suite = unittest.TestSuite()
    suite.addTest(unittest.makeSuite(TestPoints))
    suite.addTest(doctest.DocTestSuite())
    suite.addTest(doctest.DocFileSuite('points.txt'))
    runner = unittest.TextTestRunner()
    runner.run(suite)
