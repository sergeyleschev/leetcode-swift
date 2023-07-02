class Solution {

    // Solution by Sergey Leschev

    // 1680. Concatenation of Consecutive Binary Numbers
    // Given an integer n, return the decimal value of the binary string formed by concatenating the binary representations of 1 to n in order, modulo 10^9 + 7.

    // - Parameter n: An integer.
    // - Returns: The decimal value of the binary string.

    // Example 1:
    // Input: n = 1
    // Output: 1
    // Explanation: "1" in binary corresponds to the decimal value 1.

    // Example 2:
    // Input: n = 3
    // Output: 27
    // Explanation: In binary, 1, 2, and 3 corresponds to "1", "10", and "11".
    // After concatenating them, we have "11011", which corresponds to the decimal value 27.

    // Example 3:
    // Input: n = 12
    // Output: 505379714
    // Explanation: The concatenation results in "1101110010111011110001001101010111100".
    // The decimal value of that is 118505380540.
    // After modulo 10^9 + 7, the result is 505379714.

    // Constraints:
    // 1 <= n <= 10^5

    // - Complexity:
    //   - time: O(n), where n is the given n.
    //   - space: O(1), only constant space is used.

    func concatenatedBinary(_ n: Int) -> Int {
        let mod = 1_000_000_007
        var length = 0
        var ans = 0

        for i in 1...n {
            if i & (i - 1) == 0 { length += 1 }
            ans = ((ans << length) | i) % mod
        }

        return ans
    }

}
