# -*- coding: UTF-8 -*-
import random
import threading
import Queue
import time

work_queue = Queue.Queue()

def worker():
    while True:
        job = work_queue.get()
        if job is None:
            print "Einu namo."
            work_queue.put(None)
            return
        print "Darau darbą %s" % job
        time.sleep(random.uniform(1.0, 5.0))
        print "Baigiau darbą %s" % job

for n in range(3):
    threading.Thread(target=worker).start()

work_queue.put('matanalizė')
work_queue.put('algebra')
work_queue.put('pygtk pavyzdys')
work_queue.put('pakloti lovą')
work_queue.put(None)
