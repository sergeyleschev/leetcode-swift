# Solution by Sergey Leschev

# 1117. Building H2O
# There are two kinds of threads, oxygen and hydrogen. Your goal is to group these threads to form water molecules. There is a barrier where each thread has to wait until a complete molecule can be formed. Hydrogen and oxygen threads will be given releaseHydrogen and releaseOxygen methods respectively, which will allow them to pass the barrier. These threads should pass the barrier in groups of three, and they must be able to immediately bond with each other to form a water molecule. You must guarantee that all the threads from one molecule bond before any other threads from the next molecule do.
# In other words:
# If an oxygen thread arrives at the barrier when no hydrogen threads are present, it has to wait for two hydrogen threads.
# If a hydrogen thread arrives at the barrier when no other threads are present, it has to wait for an oxygen thread and another hydrogen thread.
# We don’t have to worry about matching the threads up explicitly; that is, the threads do not necessarily know which other threads they are paired up with. The key is just that threads pass the barrier in complete sets; thus, if we examine the sequence of threads that bond and divide them into groups of three, each group should contain one oxygen and two hydrogen threads.
# Write synchronization code for oxygen and hydrogen molecules that enforces these constraints.

# Example 1:
# Input: "HOH"
# Output: "HHO"
# Explanation: "HOH" and "OHH" are also valid answers.

# Example 2:
# Input: "OOHHHH"
# Output: "HHOHHO"
# Explanation: "HOHHHO", "OHHHHO", "HHOHOH", "HOHHOH", "OHHHOH", "HHOOHH", "HOHOHH" and "OHHOHH" are also valid answers.

# Constraints:
# Total length of input string will be 3n, where 1 ≤ n ≤ 20.
# Total number of H will be 2n in the input string.
# Total number of O will be n in the input string.

import time
import random
from threading import Thread, Lock


class H2O:
    def __init__(self):
        self.h = 0
        self.o = 0
        self.h2o_thread = Thread(target=self.h2o, args=())
        self.h2o_thread.setDaemon(True)
        self.h2o_thread.start()
        self.h_lock = Lock()
        self.o_lock = Lock()
        self.hl = Lock()
        self.ol = Lock()
        pass

    def h2o(self):
        while True:
            if self.h >= 2 and self.o >= 1:
                self.h -= 2
                self.o -= 1
            time.sleep(0.01)

    def hydrogen(self, releaseHydrogen: 'Callable[[], None]'):
        self.h_lock.acquire()
        while self.h >= 2:
            time.sleep(0.01)
        releaseHydrogen()
        self.h += 1
        self.h_lock.release()


    def oxygen(self, releaseOxygen: 'Callable[[], None]'):
        self.o_lock.acquire()
        while self.o >= 1:
            time.sleep(0.01)
        releaseOxygen()
        self.o += 1
        self.o_lock.release()