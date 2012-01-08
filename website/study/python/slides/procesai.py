#!/usr/bin/python

import os


def main1():
    os.system('ls')

def main2():
    f = os.popen('ls')
    for line in f:
        line = line.rstrip()
        if len(line) % 2 == 0:
            print line
        else:
            print line[::-1]

def main3():
    f = os.popen('rot13', 'w')
    print >> f, "Labas rytas"
    f.close()


if __name__ == '__main__':
    main3()
