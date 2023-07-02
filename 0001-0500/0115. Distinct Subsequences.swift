class Solution {

    // Solution by Sergey Leschev

    // 115. Distinct Subsequences
    // Given two strings s and t, return the number of distinct subsequences of s which equals t.
    // A string's subsequence is a new string formed from the original string by deleting some (can be none) of the characters without disturbing the remaining characters' relative positions. (i.e., "ACE" is a subsequence of "ABCDE" while "AEC" is not).
    // It is guaranteed the answer fits on a 32-bit signed integer.

    // Example 1:
    // Input: s = "rabbbit", t = "rabbit"
    // Output: 3
    // Explanation:
    // As shown below, there are 3 ways you can generate "rabbit" from S.
    // rabbbit
    // rabbbit
    // rabbbit

    // Example 2:
    // Input: s = "babgbag", t = "bag"
    // Output: 5
    // Explanation:
    // As shown below, there are 5 ways you can generate "bag" from S.
    // babgbag
    // babgbag
    // babgbag
    // babgbag
    // babgbag

    // Constraints:
    // 1 <= s.length, t.length <= 1000
    // s and t consist of English letters.

    func numDistinct(_ s: String, _ t: String) -> Int {
        let s = Array(s)
        let t = Array(t)
        var memo = Array(repeating: Array(repeating: -1, count: t.count), count: s.count)

        func numDistinct(_ i: Int, _ j: Int) -> Int {
            if j < 0 { return 1 }
            if i < 0 { return 0 }

            if memo[i][j] != -1 { return memo[i][j] }

            if s[i] != t[j] {
                memo[i][j] = numDistinct(i - 1, j)
            } else {
                memo[i][j] = numDistinct(i - 1, j) + numDistinct(i - 1, j - 1)
            }

            return memo[i][j]
        }

        return numDistinct(s.count - 1, t.count - 1)
    }

}
