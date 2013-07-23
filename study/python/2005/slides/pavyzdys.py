# -*- coding: UTF-8 -*-
import time
import threading
import random

class MyThread(threading.Thread):

    def __init__(self, vardas):
        threading.Thread.__init__(self)
        self.setName(vardas)
        self.vardas = vardas

    def run(self):
        m = random.randrange(3, 7)
        suma = 0
        for n in range(m):
            suma += n
            time.sleep(1)
            print "Gija %s: %s" % (self.vardas, n)
        self.suma = suma


threads = []
for vardas in ['A', 'B', 'C']:
    t = MyThread(vardas)
    t.start()
    threads.append(t)

print "Waiting for all threads to finish working..."
for t in threads:
    t.join()
    suma = t.suma
    print "Gijos %s suma: %s" % (t.vardas, suma)
print "All done!"
