class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 600. Non-negative Integers without Consecutive Ones
    // Given a positive integer n, return the number of the integers in the range [0, n] whose binary representations do not contain consecutive ones.

    // Example 1:
    // Input: n = 5
    // Output: 5
    // Explanation:
    // Here are the non-negative integers <= 5 with their corresponding binary representations:
    // 0 : 0
    // 1 : 1
    // 2 : 10
    // 3 : 11
    // 4 : 100
    // 5 : 101
    // Among them, only integer 3 disobeys the rule (two consecutive ones) and the other 5 satisfy the rule. 

    // Example 2:
    // Input: n = 1
    // Output: 2

    // Example 3:
    // Input: n = 2
    // Output: 3

    // Constraints:
    // 1 <= n <= 10^9

    func findIntegers(_ n: Int) -> Int {
        var f = Array(repeating: 0, count: 32)
        var sum = 0
        var preBit = 0

        f[0] = 1
        f[1] = 2
        for i in 2..<32 { f[i] = f[i - 1] + f[i - 2] }
        var i = 30

        while i >= 0 {
            if n & (1<<i) != 0 {
                sum += f[i]
                if preBit == 1 { sum -= 1; break }
                preBit = 1
            } else { preBit = 0 }
            i -= 1
        }

        return sum + 1
    }

}