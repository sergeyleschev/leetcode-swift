class Solution {

    // Solution by Sergey Leschev

    // 231. Power of Two
    // Given an integer n, return true if it is a power of two. Otherwise, return false.
    // An integer n is a power of two, if there exists an integer x such that n == 2x.

    // Determines if the given integer is a power of two.

    // - Parameter n: The integer.
    // - Returns: True if the given integer is a power of two, otherwise returns false.

    // Example 1:
    // Input: n = 1
    // Output: true
    // Explanation: 20 = 1

    // Example 2:
    // Input: n = 16
    // Output: true
    // Explanation: 24 = 16

    // Example 3:
    // Input: n = 3
    // Output: false

    // Example 4:
    // Input: n = 4
    // Output: true

    // Example 5:
    // Input: n = 5
    // Output: false

    // Constraints:
    // -2^31 <= n <= 2^31 - 1

    // Follow up: Could you solve it without loops/recursion?

    // - Complexity:
    //   - time: O(1), only constant time is used.
    //   - space: O(1), only constant space is used.

    func isPowerOfTwo(_ n: Int) -> Bool { n > 0 && (n & (n - 1)) == 0 }

}
