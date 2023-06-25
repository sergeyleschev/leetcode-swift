class Solution {

    // Solution @ Sergey Leschev

    // 730. Count Different Palindromic Subsequences
    // Given a string s, return the number of different non-empty palindromic subsequences in s. Since the answer may be very large, return it modulo 109 + 7.
    // A subsequence of a string is obtained by deleting zero or more characters from the string.
    // A sequence is palindromic if it is equal to the sequence reversed.
    // Two sequences a1, a2, ... and b1, b2, ... are different if there is some i for which ai != bi.

    // Example 1:
    // Input: s = "bccb"
    // Output: 6
    // Explanation: The 6 different non-empty palindromic subsequences are 'b', 'c', 'bb', 'cc', 'bcb', 'bccb'.
    // Note that 'bcb' is counted only once, even though it occurs twice.

    // Example 2:
    // Input: s = "abcdabcdabcdabcdabcdabcdabcdabcddcbadcbadcbadcbadcbadcbadcbadcba"
    // Output: 104860361
    // Explanation: There are 3104860382 different non-empty palindromic subsequences, which is 104860361 modulo 109 + 7.

    // Constraints:
    // 1 <= s.length <= 1000
    // s[i] is either 'a', 'b', 'c', or 'd'.

    // - Complexity:
    //   - time: O(n^2)
    //   - space: O(n^2)

    func countPalindromicSubsequences(_ S: String) -> Int {
        let n = S.count
        if n == 1 { return 1 }

        let mod = Int(1e9+7)
        var S = Array(S)
        var dp = Array(repeating: Array(repeating: 0, count: n), count: n)

        for i in 0..<n { dp[i][i] = 1 }

        for len in 1..<n {
            for i in 0..<n-len {
                let j = i + len
                if S[i] != S[j] {
                    dp[i][j] = dp[i + 1][j] + dp[i][j-1] - dp[i + 1][j - 1]
                } else {
                    var left = i + 1
                    var right = j - 1
                    while left <= right, S[left] != S[j] { left += 1 }
                    while left <= right, S[right] != S[i] { right -= 1 }

                    if left > right {
                        dp[i][j] = dp[i + 1][j - 1] * 2 + 2
                    } else if left == right {
                        dp[i][j] = dp[i + 1][j - 1] * 2 + 1
                    } else {
                        dp[i][j] = dp[i + 1][j - 1] * 2 - dp[left + 1][right - 1]
                    }
                }

                dp[i][j] = dp[i][j] < 0 ? dp[i][j] + mod : dp[i][j] % mod
            }
        }

        return dp[0][n - 1]
    }

}