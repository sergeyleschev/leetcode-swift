class Solution {

    // Solution by Sergey Leschev

    // 1278. Palindrome Partitioning III
    // You are given a string s containing lowercase letters and an integer k. You need to:
    // First, change some characters of s to other lowercase English letters.
    // Then divide s into k non-empty disjoint substrings such that each substring is a palindrome.
    // Return the minimal number of characters that you need to change to divide the string.

    // Example 1:
    // Input: s = "abc", k = 2
    // Output: 1
    // Explanation: You can split the string into "ab" and "c", and change 1 character in "ab" to make it palindrome.

    // Example 2:
    // Input: s = "aabbc", k = 3
    // Output: 0
    // Explanation: You can split the string into "aa", "bb" and "c", all of them are palindrome.

    // Example 3:
    // Input: s = "leetcode", k = 8
    // Output: 0

    // Constraints:
    // 1 <= k <= s.length <= 100.
    // s only contains lowercase English letters.

    func palindromePartition(_ s: String, _ k: Int) -> Int {
        guard s.count > k else { return 0 }
        let n = s.count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: k + 1)
        let s = Array(s)

        // calculate cost of transfer s.substring(i, j) to palindrome
        let getCost: (Int, Int) -> Int = { i, j in
            var res = 0
            var i = i
            var j = j

            while i < j {
                if s[i] != s[j] { res += 1 }
                i += 1
                j -= 1
            }
            return res
        }
        
        // cost map cache
        let cost: [[Int]] = {
            var res = Array(repeating: Array(repeating: 0, count: n), count: n)
            for i in 0..<n {
                for j in (i + 1)..<n { res[i][j] = getCost(i, j) }
            }
            return res
        }()
        
        for j in 0..<n { dp[1][j] = cost[0][j] }
        
        if k == 1 { return dp[1][n - 1] }

        for i in 2...k {
            for j in (i - 1)..<n {
                var minimal = n
                for t in 0..<j { minimal = min(minimal, dp[i - 1][t] + cost[t + 1][j]) }
                dp[i][j] = minimal
            }
        }

        return dp[k][n - 1]
    }

}