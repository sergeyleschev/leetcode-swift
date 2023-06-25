class Solution {

    // Solution @ Sergey Leschev

    // 1745. Palindrome Partitioning IV
    // Given a string s, return true if it is possible to split the string s into three non-empty palindromic substrings. Otherwise, return false.​​​​​
    // A string is said to be palindrome if it the same string when reversed.

    // Example 1:
    // Input: s = "abcbdd"
    // Output: true
    // Explanation: "abcbdd" = "a" + "bcb" + "dd", and all three substrings are palindromes.

    // Example 2:
    // Input: s = "bcbddxy"
    // Output: false
    // Explanation: s cannot be split into 3 palindromes.

    // Constraints:
    // 3 <= s.length <= 2000
    // s consists only of lowercase English letters.

    func checkPartitioning(_ s: String) -> Bool {
        guard s.count != 3 else { return true }
        let s2Chars = [Character](s)
        let n = s.count
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        var first = [Int]()
        var second = [Int]()

        (0..<n).forEach { dp[$0][$0] = true }
        
        for j in 1..<n {
            for i in 0..<j where s2Chars[i] == s2Chars[j] && (j - i < 3 || dp[i + 1][j - 1]) { dp[i][j] = true }
        }
        
        for i in 0..<n {
            if dp[0][i] { first.append(i) }
            if dp[i][n - 1] { second.append(i) }
        }

        for f in first {
            while !second.isEmpty && second.first! <= f { second.removeFirst() }
            guard !second.isEmpty else { return false }
            for s in second {
                guard !dp[f + 1][s - 1] else { return true }
            }
        }
        return false
    }

}