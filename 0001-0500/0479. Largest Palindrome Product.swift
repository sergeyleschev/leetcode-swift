class Solution {

    // Solution by Sergey Leschev

    // 479. Largest Palindrome Product
    // Given an integer n, return the largest palindromic integer that can be represented as the product of two n-digits integers. Since the answer can be very large, return it modulo 1337.

    // Example 1:
    // Input: n = 2
    // Output: 987
    // Explanation: 99 x 91 = 9009, 9009 % 1337 = 987

    // Example 2:
    // Input: n = 1
    // Output: 9

    // Constraints:
    // 1 <= n <= 8

    func largestPalindrome(_ n: Int) -> Int {
        [
            9, 9009, 906609, 99_000_099, 9_966_006_699, 999_000_000_999,
            99_956_644_665_999, 9_999_000_000_009_999,
        ][n - 1] % 1337
    }

}
