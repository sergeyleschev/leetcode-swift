# Solution @ Sergey Leschev, Belarusian State University

# 1116. Print Zero Even Odd
# Suppose you are given the following code:

# class ZeroEvenOdd {
#   public ZeroEvenOdd(int n) { ... }      // constructor
#   public void zero(printNumber) { ... }  // only output 0's
#   public void even(printNumber) { ... }  // only output even numbers
#   public void odd(printNumber) { ... }   // only output odd numbers
# }
# The same instance of ZeroEvenOdd will be passed to three different threads:

# Thread A will call zero() which should only output 0's.
# Thread B will call even() which should only ouput even numbers.
# Thread C will call odd() which should only output odd numbers.
# Each of the threads is given a printNumber method to output an integer. Modify the given program to output the series 010203040506... where the length of the series must be 2n.

# Example 1:
# Input: n = 2
# Output: "0102"
# Explanation: There are three threads being fired asynchronously. One of them calls zero(), the other calls even(), and the last one calls odd(). "0102" is the correct output.

# Example 2:
# Input: n = 5
# Output: "0102030405"

from threading import Semaphore, Condition


class ZeroEvenOdd:
    def __init__(self, n):
        self.n = n
        self.sem = 0
        self.c = Condition()
        
	# printNumber(x) outputs "x", where x is an integer.
    def zero(self, printNumber: 'Callable[[int], None]') -> None:
        for i in range(self.n):
            with self.c:
                while self.sem:
                    self.c.wait()
                printNumber(0)
                self.sem = 2 if i % 2 else 1
                self.c.notify_all()
        
    def even(self, printNumber: 'Callable[[int], None]') -> None:
        for i in range(2, self.n + 1, 2):
            with self.c:
                while self.sem - 2:
                    self.c.wait()
                printNumber(i)
                self.sem = 0
                self.c.notify_all()
        
    def odd(self, printNumber: 'Callable[[int], None]') -> None:
        for i in range(1, self.n + 1, 2):
            with self.c:
                while self.sem - 1:
                    self.c.wait()
                printNumber(i)
                self.sem = 0
                self.c.notify_all()