class Solution {

    // Solution @ Sergey Leschev

    // 342. Power of Four
    // Given an integer n, return true if it is a power of four. Otherwise, return false.
    // An integer n is a power of four, if there exists an integer x such that n == 4x.

    // Checks whether an integer is a power of 4.
    // - Parameter num: The integer.
    // - Returns: True if the integer is a power of 4, otherwise returns false.

    // Example 1:
    // Input: n = 16
    // Output: true

    // Example 2:
    // Input: n = 5
    // Output: false

    // Example 3:
    // Input: n = 1
    // Output: true

    // Constraints:
    // -2^31 <= n <= 2^31 - 1
     
    // Follow up: Could you solve it without loops/recursion?

    // - Complexity:
    //   - time: O(1), only constant time is used.
    //   - space: O(1), only constant space is used.

    func isPowerOfFour(_ num: Int) -> Bool {
        num > 0 && (log(Double(num)) / log(2.0)).truncatingRemainder(dividingBy: 2) == 0
    }

}