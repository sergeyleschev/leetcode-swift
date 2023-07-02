class Solution {

    // Solution by Sergey Leschev

    // 263. Ugly Number
    // An ugly number is a positive integer whose prime factors are limited to 2, 3, and 5.
    // Given an integer n, return true if n is an ugly number.

    // Example 1:
    // Input: n = 6
    // Output: true
    // Explanation: 6 = 2 × 3

    // Example 2:
    // Input: n = 8
    // Output: true
    // Explanation: 8 = 2 × 2 × 2

    // Example 3:
    // Input: n = 14
    // Output: false
    // Explanation: 14 is not ugly since it includes the prime factor 7.

    // Example 4:
    // Input: n = 1
    // Output: true
    // Explanation: 1 has no prime factors, therefore all of its prime factors are limited to 2, 3, and 5.

    // Constraints:
    // -2^31 <= n <= 2^31 - 1

    func isUgly(_ num: Int) -> Bool {
        guard num > 0 else { return false }
        var loopNum = num

        while loopNum != 1 {
            if loopNum % 2 == 0 {
                loopNum /= 2
            } else if loopNum % 3 == 0 {
                loopNum /= 3
            } else if loopNum % 5 == 0 {
                loopNum /= 5
            } else {
                return false
            }
        }
        return true
    }

}
