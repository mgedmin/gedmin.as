#!/usr/bin/env python
import os
import time
import random
import sys

def main():
    vardas = raw_input("Koks tavo vardas? ")
    pid = os.fork()
    if pid == 0:
        print "Labas, %s!!!" % vardas
        time.sleep(random.uniform(1, 3))
        print "Iki!!!"
        sys.exit(random.randrange(256))
    else:
        print "Labas, %s." % vardas
        ## os.waitpid(pid, 0) # laukia
        while True:
            same_pid, status = os.waitpid(pid, os.WNOHANG)
            if same_pid == 0:
                print ".",
                sys.stdout.flush()
                time.sleep(0.1)
            else:
                break
        print "Iki."
        print "(statusas buvo %d)" % os.WEXITSTATUS(status)


if __name__ == '__main__':
    main()
