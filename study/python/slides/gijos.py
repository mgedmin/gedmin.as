#!/usr/bin/env python

import time
import threading

class MyThread(threading.Thread):

    def __init__(self, what_to_print, interval):
        threading.Thread.__init__(self)
        self.what_to_print = what_to_print
        self.interval = interval

    def run(self):
        total_time = 0
        for i in range(10):
            print self.what_to_print
            time.sleep(self.interval)
            total_time += self.interval
        self.answer = total_time


if __name__ == '__main__':
    a_s = MyThread('A', 0.1)
    b_s = MyThread('B', 0.2)
    c_s = MyThread('C', 0.3)
    a_s.start()
    b_s.start()
    c_s.start()
    a_s.join()
    b_s.join()
    c_s.join()
    print "Printed 10 A's in %.1s seconds" % a_s.answer
    print "Printed 10 B's in %.1s seconds" % b_s.answer
    print "Printed 10 C's in %.1s seconds" % c_s.answer

