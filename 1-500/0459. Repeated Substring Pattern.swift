class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 459. Repeated Substring Pattern
    // Given a string s, check if it can be constructed by taking a substring of it and appending multiple copies of the substring together.

    // Checks if the input string can be constructed by taking a substring of it and appending multiple copies of the substring together.

    // - Parameter s: The string.
    // - Returns: True if the string can be constructed, otherwise return false.

    // Example 1:
    // Input: s = "abab"
    // Output: true
    // Explanation: It is the substring "ab" twice.

    // Example 2:
    // Input: s = "aba"
    // Output: false

    // Example 3:
    // Input: s = "abcabcabcabc"
    // Output: true
    // Explanation: It is the substring "abc" four times or the substring "abcabc" twice.

    // Constraints:
    // 1 <= s.length <= 10^4
    // s consists of lowercase English letters.

    // - Complexity:
    //   - time: O(n), where n is the length of the input string.
    //   - space: O(n), where n is the length of the input string.
    
    func repeatedSubstringPattern(_ s: String) -> Bool {
        let s = Array(s)
        var dp = [Int](repeating: 0, count: s.count)

        for i in 1..<s.count {
            var j = dp[i - 1]
            while j > 0, s[i] != s[j] { j = dp[j - 1] }
            if s[i] == s[j] { j += 1 }
            dp[i] = j
        }

        let length = dp[s.count - 1]
        return length != 0 && s.count % (s.count - length) == 0
    }

}