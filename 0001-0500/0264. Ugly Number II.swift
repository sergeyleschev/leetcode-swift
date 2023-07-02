class Solution {

    // Solution by Sergey Leschev

    // 264. Ugly Number II
    // An ugly number is a positive integer whose prime factors are limited to 2, 3, and 5.
    // Given an integer n, return the nth ugly number.

    // Finds the n-th ugly number.
    // - Parameter n: The integer.
    // - Returns: N-th ugly number.

    // Example 1:
    // Input: n = 10
    // Output: 12
    // Explanation: [1, 2, 3, 4, 5, 6, 8, 9, 10, 12] is the sequence of the first 10 ugly numbers.

    // Example 2:
    // Input: n = 1
    // Output: 1
    // Explanation: 1 has no prime factors, therefore all of its prime factors are limited to 2, 3, and 5.

    // Constraints:
    // 1 <= n <= 1690

    // - Complexity:
    //   - time: O(n), where n is given n.
    //   - space: O(n), where n is given n.

    func nthUglyNumber(_ n: Int) -> Int {
        guard n > 0 else { return -1 }
        var ans = [Int](repeating: 0, count: n)
        var i2 = 0
        var i3 = 0
        var i5 = 0

        ans[0] = 1
        for i in 1..<n {
            ans[i] = min(ans[i2] * 2, ans[i3] * 3, ans[i5] * 5)

            if ans[i] == ans[i2] * 2 { i2 += 1 }
            if ans[i] == ans[i3] * 3 { i3 += 1 }
            if ans[i] == ans[i5] * 5 { i5 += 1 }
        }

        return ans[n - 1]
    }

}
