class Solution {

    // Solution @ Sergey Leschev

    // 516. Longest Palindromic Subsequence
    // Given a string s, find the longest palindromic subsequence's length in s.
    // A subsequence is a sequence that can be derived from another sequence by deleting some or no elements without changing the order of the remaining elements.

    // Example 1:
    // Input: s = "bbbab"
    // Output: 4
    // Explanation: One possible longest palindromic subsequence is "bbbb".

    // Example 2:
    // Input: s = "cbbd"
    // Output: 2
    // Explanation: One possible longest palindromic subsequence is "bb".

    // Constraints:
    // 1 <= s.length <= 1000
    // s consists only of lowercase English letters.

    func longestPalindromeSubseq(_ s: String) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: s.count), count: s.count)
        let arr = Array(s)
        
        return longestPalindromeSubseqHelper(arr, i: 0, j: arr.count - 1, dp: &dp)
    }
    
    
    func longestPalindromeSubseqHelper(_ s:[Character], i: Int, j: Int, dp: inout [[Int]]) -> Int {
        guard dp[i][j] == 0 else { return dp[i][j] }
        
        if i > j { return 0 }
        if i == j { return 1 }
        if s[i] == s[j] {
            dp[i][j] = longestPalindromeSubseqHelper(s, i: i + 1, j: j - 1, dp: &dp) + 2
        } else {
            dp[i][j] = max(longestPalindromeSubseqHelper(s, i: i + 1, j: j, dp: &dp), longestPalindromeSubseqHelper(s, i: i, j: j - 1, dp: &dp))
        }
        return dp[i][j]
    }

}