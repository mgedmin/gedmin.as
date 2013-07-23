#!/usr/bin/env python

import time
import threading

def print_As():
    for i in range(10):
        print "A"
        time.sleep(0.2)


def print_Bs():
    for i in range(10):
        print "B"
        time.sleep(0.3)

if __name__ == '__main__':
    threading.Thread(target=print_As).start()
    threading.Thread(target=print_Bs).start()

