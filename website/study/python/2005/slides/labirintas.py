#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Kelio paieška labirinte.
"""
import sys
import textwrap


labirintas = textwrap.dedent("""\
    ###################
       #     #     #  #
    #  ####  #  #     #
    #     #     ####  #
    #  #  ###   #  #  #
    #  #        #
    ###################
""")


class Labirintas:

    def __init__(self, labirintas):
        if hasattr(labirintas, 'splitlines'):
            labirintas = labirintas.splitlines()
        self.labirintas = [[c for c in row] for row in labirintas]
        self.w = len(self.labirintas[0])
        self.h = len(self.labirintas)
        for row in self.labirintas:
            while len(row) < self.w:
                row.append(' ')

    def rask_duris(self):
        durys = []
        for y in (0, self.h-1):
            for x in range(self.w):
                if self.labirintas[y][x] == ' ':
                    durys.append((x, y))
        for y in range(1, self.h-1):
            for x in (0, self.w-1):
                if self.labirintas[y][x] == ' ':
                    durys.append((x, y))
        return durys

    def rask_kelia(self, (x1, y1), (x2, y2)):
        class Radau:
            pass
        def eik(x, y):
            if not (0 <= x < self.w and 0 <= y < self.h):
                return
            if self.labirintas[y][x] != ' ':
                return
            self.labirintas[y][x] = '+'
            if (x, y) == (x2, y2):
                raise Radau
            eik(x-1, y)
            eik(x+1, y)
            eik(x, y-1)
            eik(x, y+1)
            self.labirintas[y][x] = '.'
        try:
            eik(x1, y1)
        except Radau:
            pass

    def spausdink(self):
        print '\n'.join(''.join(row) for row in self.labirintas)


def main():
    lab = Labirintas(labirintas)
    a, b = lab.rask_duris()
    lab.rask_kelia(a, b)
    lab.spausdink()


def silent_main():
    old_stdout = sys.stdout
    sys.stdout = open('/dev/null', 'w')
    main()
    sys.stdout = old_stdout


if __name__ == '__main__':
    main()

