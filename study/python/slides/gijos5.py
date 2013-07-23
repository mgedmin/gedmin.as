#!/usr/bin/env python

import time
import threading
import random

class MyThread(threading.Thread):

    def __init__(self, what_to_print, interval, count=10):
        threading.Thread.__init__(self)
        self.what_to_print = what_to_print
        self.interval = interval
        self.count = count
        self.setName("MyThread-%s" % what_to_print)

    def run(self):
        for i in range(self.count):
            print self.what_to_print
            time.sleep(self.interval)
            x = 1 / random.randrange(0, 5)


if __name__ == '__main__':
    unimportant_thread = MyThread('x', 0.05, count=1000)
    unimportant_thread.setDaemon(True)
    unimportant_thread.start()
    MyThread('A', 0.1).start()
    MyThread('B', 0.2).start()
    MyThread('C', 0.3).start()

