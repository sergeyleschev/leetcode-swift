class Solution {

    // Solution by Sergey Leschev

    // 583. Delete Operation for Two Strings
    // Given two strings word1 and word2, return the minimum number of steps required to make word1 and word2 the same.
    // In one step, you can delete exactly one character in either string.

    // Example 1:
    // Input: word1 = "sea", word2 = "eat"
    // Output: 2
    // Explanation: You need one step to make "sea" to "ea" and another step to make "eat" to "ea".

    // Example 2:
    // Input: word1 = "leetcode", word2 = "etco"
    // Output: 4

    // Constraints:
    // 1 <= word1.length, word2.length <= 500
    // word1 and word2 consist of only lowercase English letters.

    func minDistance(_ word1: String, _ word2: String) -> Int {
        guard !word1.isEmpty && !word2.isEmpty else { return word1.isEmpty ? word2.count : word1.count }
        
        var dp = Array(repeating: Array(repeating: 0, count: word2.count + 1), count: word1.count + 1)
        
        let chars1 = Array(word1)
        let chars2 = Array(word2)
        let c1 = word1.count
        let c2 = word2.count
        
        for i in 0...c1 { dp[i][0] = i }
        for i in 0...c2 { dp[0][i] = i }
        
        for i in 1...c1 {
            for j in 1...c2 {
                if chars1[i - 1] == chars2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1]
                }else {
                    dp[i][j] = min(dp[i - 1][j - 1] + 2, dp[i - 1][j] + 1, dp[i][j - 1] + 1)
                }
            }
        }
        
        return dp[c1][c2]
    }

}