#!/usr/bin/env python
import os
import sys
import pickle


class Uzduotis(object):

    def __init__(self, skaiciai):
        self.skaiciai = skaiciai


class Atsakymas(object):

    def __init__(self, ats):
        self.ats = ats


def skaiciuok(u):
    return Atsakymas(sum(u.skaiciai))


def parent():
    skaiciai = []
    uzduotys = []
    for line in file('input.txt'):
        if not line.strip():
            continue
        skaiciai.append(int(line.strip()))
        if len(skaiciai) > 10:
            uzduotys.append(Uzduotis(skaiciai))
            skaiciai = []
    if skaiciai:
        uzduotys.append(Uzduotis(skaiciai))

    for n, uzd in enumerate(uzduotys):
        inputfile = "task%d.in" % n
        f = file(inputfile, 'w')
        pickle.dump(uzd, f)
        f.close()
        os.system("python procesai3.py %s &" % inputfile)

    atsakymai = []
    for n in range(len(uzduotys)):
        while True:
            try:
                f = file("task%d.out" % n)
            except IOError:
                pass
            else:
                break
        ats = pickle.load(f)
        f.close()
        atsakymai.append(ats)

    print "Atsakymas:", sum(a.ats for a in atsakymai)


def child(task):
    f = file(task)
    uzd = pickle.load(f)
    f.close()
    ats = skaiciuok(uzd)
    f = file(task + ".tmp", "w")
    pickle.dump(ats, f)
    f.close()
    os.rename(task + ".tmp", task.replace(".in", ".out"))


if __name__ == '__main__':
    if len(sys.argv) > 1:
        child(sys.argv[1])
    else:
        parent()

