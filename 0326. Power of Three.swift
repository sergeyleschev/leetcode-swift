class Solution {

    // 326. Power of Three
    // Given an integer n, return true if it is a power of three. Otherwise, return false.
    // An integer n is a power of three, if there exists an integer x such that n == 3x.

    // Example 1:
    // Input: n = 27
    // Output: true

    // Example 2:
    // Input: n = 0
    // Output: false

    // Example 3:
    // Input: n = 9
    // Output: true

    // Example 4:
    // Input: n = 45
    // Output: false

    // Constraints:
    // -2^31 <= n <= 2^31 - 1

    // Follow up: Could you solve it without loops/recursion?

    func isPowerOfThree(_ n: Int) -> Bool {
        return n > 0 && (1162261467 % n == 0)
    }
    
}