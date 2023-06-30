class Solution {

    // Solution by Sergey Leschev

    // 1143. Longest Common Subsequence
    // Given two strings text1 and text2, return the length of their longest common subsequence. If there is no common subsequence, return 0.
    // A subsequence of a string is a new string generated from the original string with some characters (can be none) deleted without changing the relative order of the remaining characters.
    // For example, "ace" is a subsequence of "abcde".
    // A common subsequence of two strings is a subsequence that is common to both strings.

    // Example 1:
    // Input: text1 = "abcde", text2 = "ace" 
    // Output: 3  
    // Explanation: The longest common subsequence is "ace" and its length is 3.

    // Example 2:
    // Input: text1 = "abc", text2 = "abc"
    // Output: 3
    // Explanation: The longest common subsequence is "abc" and its length is 3.

    // Example 3:
    // Input: text1 = "abc", text2 = "def"
    // Output: 0
    // Explanation: There is no such common subsequence, so the result is 0.

    // Constraints:
    // 1 <= text1.length, text2.length <= 1000
    // text1 and text2 consist of only lowercase English characters.

    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        guard text1.count > 0 && text2.count > 0 else { return 0 }
        let text1 = Array(text1)
        let text2 = Array(text2)
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: text2.count + 1), count: text1.count + 1)
        
        for i in 1...text1.count {
            for j in 1...text2.count {
                if text1[i - 1] == text2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        
        let ans = dp.last?.last ?? 0
        return ans
    }
    
}