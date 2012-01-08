#!/usr/bin/env python
import Queue
import threading
import random
import time

accounts = {'jonas': 100, 'petras': 200, 'maryte': 300}

class Secretary(threading.Thread):

    def __init__(self):
        threading.Thread.__init__(self)
        self.jobs = Queue.Queue()

    def addJob(self, who, whom, amount):
        self.jobs.put((who, whom, amount))

    def goHome(self):
        self.addJob(None, None, None)

    def run(self):
        while True:
            who, whom, amount = self.jobs.get()
            if who is None:
                break
            if amount > accounts[who]:
                print "%s doesn't have $%s" % (who, amount)
            else:
                print "%s -> %s ($%s)" % (who, whom, amount)
                accounts[whom] = accounts[whom] + amount
                accounts[who] = accounts[who] - amount


class Clerk(threading.Thread):

    def __init__(self, secretary):
        threading.Thread.__init__(self)
        self.secretary = secretary

    def run(self):
        for i in range(10):
            who, whom = random.sample(accounts.keys(), 2)
            if accounts[who] > 0:
                amount = random.randrange(accounts[who])
                self.secretary.addJob(who, whom, amount)


def main():
    secretary = Secretary()
    secretary.start()
    clerks = []
    for i in range(50):
        clerk = Clerk(secretary)
        clerk.start()
        clerks.append(clerk)
    for clerk in clerks:
        clerk.join()
    secretary.goHome()
    secretary.join()
    total = 0
    for name in sorted(accounts):
        print name, accounts[name]
        total += accounts[name]
    print "total:", total

if __name__ == '__main__':
    main()
