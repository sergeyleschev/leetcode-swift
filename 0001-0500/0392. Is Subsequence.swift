class Solution {

    // Solution @ Sergey Leschev

    // 392. Is Subsequence
    // Given two strings s and t, return true if s is a subsequence of t, or false otherwise.
    // A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).

    // Checks if s is subsequence of t.

    // - Parameters:
    //   - s: The string.
    //   - t: The string.
    // - Returns: True if s is a subsequence of t, otherwise returns false.

    // Example 1:
    // Input: s = "abc", t = "ahbgdc"
    // Output: true

    // Example 2:
    // Input: s = "axc", t = "ahbgdc"
    // Output: false

    // Constraints:
    // 0 <= s.length <= 100
    // 0 <= t.length <= 10^4
    // s and t consist only of lowercase English letters.
     
    // Follow up: Suppose there are lots of incoming s, say s1, s2, ..., sk where k >= 10^9, and you want to check one by one to see if t has its subsequence. In this scenario, how would you change your code?

    // - Complexity:
    //   - time: O(n), where n is the number of letters in t.
    //   - space: O(max(n, m)), where n is the number of letters in t, and m is the number of letters in s.

    func isSubsequence(_ s: String, _ t: String) -> Bool {
        guard s.count <= t.count else { return false }
        let s = Array(s)
        let t = Array(t)
        var i = 0
        var j = 0

        while i < s.count {
            guard j < t.count else { return false }
            if s[i] == t[j] { i += 1 }
            j += 1
        }

        return true
    }

}