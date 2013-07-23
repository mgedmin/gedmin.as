#!/usr/bin/env python
import threading
import random
import time

accounts = {'jonas': 100, 'petras': 200, 'maryte': 300}
accounts_lock = threading.Lock()

class Clerk(threading.Thread):

    def run(self):
        for i in range(10):
            who, whom = random.sample(accounts.keys(), 2)
            accounts_lock.acquire()
            amount = random.randrange(accounts[who])
            print "%s -> %s ($%s)" % (who, whom, amount)
            accounts[whom] = accounts[whom] + amount
            accounts[who] = accounts[who] - amount
            accounts_lock.release()

def main():
    clerks = []
    for i in range(50):
        clerk = Clerk()
        clerk.start()
        clerks.append(clerk)
    for clerk in clerks:
        clerk.join()
    total = 0
    for name in sorted(accounts):
        print name, accounts[name]
        total += accounts[name]
    print "total:", total

if __name__ == '__main__':
    main()
