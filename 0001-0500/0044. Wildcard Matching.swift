class Solution {

    // Solution by Sergey Leschev

    // 44. Wildcard Matching
    // Given an input string (s) and a pattern (p), implement wildcard pattern matching with support for '?' and '*' where:
    // '?' Matches any single character.
    // '*' Matches any sequence of characters (including the empty sequence).
    // The matching should cover the entire input string (not partial).

    // Example 1:
    // Input: s = "aa", p = "a"
    // Output: false
    // Explanation: "a" does not match the entire string "aa".

    // Example 2:
    // Input: s = "aa", p = "*"
    // Output: true
    // Explanation: '*' matches any sequence.

    // Example 3:
    // Input: s = "cb", p = "?a"
    // Output: false
    // Explanation: '?' matches 'c', but the second letter is 'a', which does not match 'b'.

    // Example 4:
    // Input: s = "adceb", p = "*a*b"
    // Output: true
    // Explanation: The first '*' matches the empty sequence, while the second '*' matches the substring "dce".

    // Example 5:
    // Input: s = "acdcb", p = "a*c?b"
    // Output: false

    // Constraints:
    // 0 <= s.length, p.length <= 2000
    // s contains only lowercase English letters.
    // p contains only lowercase English letters, '?' or '*'.

    func isMatch(_ s: String, _ p: String) -> Bool {
        var sIndex = 0
        var pIndex = 0
        var starIndex = -1
        var sTmpIndex = -1

        while sIndex < s.count {
            if pIndex < p.count
                && (s[s.index(s.startIndex, offsetBy: sIndex)]
                    == p[p.index(p.startIndex, offsetBy: pIndex)]
                    || p[p.index(p.startIndex, offsetBy: pIndex)] == "?")
            {
                sIndex += 1
                pIndex += 1
            } else if pIndex < p.count && p[p.index(p.startIndex, offsetBy: pIndex)] == "*" {
                starIndex = pIndex
                sTmpIndex = sIndex
                pIndex += 1
            } else if starIndex != -1 {
                pIndex = starIndex + 1
                sTmpIndex += 1
                sIndex = sTmpIndex
            } else {
                return false
            }
        }

        while pIndex < p.count && p[p.index(p.startIndex, offsetBy: pIndex)] == "*" {
            pIndex += 1
        }

        return pIndex == p.count
    }
}
