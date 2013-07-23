# -*- coding: utf-8 -*-
#

try:
    import readline
except ImportError:
    pass

from datetime import date


def parsink_data(s, cache={}):
    """parsink_data('2006-09-24') == date(2006, 9, 24)"""
    if s in cache:
        return cache[s]
    try:
        y, m, d = s.split('-')
        cache[s] = date(int(y), int(m), int(d))
        return cache[s]
    except ValueError:
        return None


def daryk_gudrius_darbus(parameras=[]):
    parametras.append('a')
    ilgiai = []
    f = file('manfailas.txt')
    try:
        for line in f:
            parsink_data(line)
            ilgiai.append(len(line))
        print "vidurkis: %d" % (sum(ilgiai) / len(ilgiai))
    finally:
        print "uždarau failą"
        f.close()


def main():
    try:
        daryk_gudrius_darbus()
    except IOError, e:
        print "Nepavyko perskaityti failo:", e
    except ZeroDivisionError, e:
        print "Kazkas negerai su dalyba:", e
    except Exception:
        print "Kazkas visiškai netikėto:"

if __name__ == '__main__':
    main()
