#!/usr/bin/env python
"""
Solve quadratic equations.
"""

import sys
import csv
from math import sqrt


def readInput(f):
    """Read input from a file object.

    Each line is of the form
      a, b, c

    Returns a list of (a, b, c) tuples.
    """
    results = []
    for a, b, c in csv.reader(f):
        results.append((float(a), float(b), float(c)))
    return results


def solve(a, b, c):
    """Solve ax**2 + bx + c = 0.

    Returns a list of solutions.
    """
    d = b ** 2 - 4 * a * c
    if d < 0: return []
    x1 = (-b - sqrt(d)) / (2 * a)
    if d == 0: return [x1]
    x2 = (-b + sqrt(d)) / (2 * a)
    return [x1, x2]


def writeOutput(f, solutions):
    """Write solutions to a file object.

    solutions is a list of lists
    """
    for solution in solutions:
        if solution:
            print >> f, ', '.join([str(x) for x in solution])
        else:
            print >> f, 'no solutions'


def main():
    input_file = sys.argv[1]
    output_file = sys.argv[2]
    eqns = readInput(file(input_file))
    results = []
    for a, b, c in eqns:
        results.append(solve(a, b, c))
    writeOutput(file(output_file, 'w'), results)


if __name__ == '__main__':
    main()
