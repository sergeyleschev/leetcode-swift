class Solution {

    // Solution @ Sergey Leschev

    // 1163. Last Substring in Lexicographical Order
    // Given a string s, return the last substring of s in lexicographical order.

    // Example 1:
    // Input: s = "abab"
    // Output: "bab"
    // Explanation: The substrings are ["a", "ab", "aba", "abab", "b", "ba", "bab"]. The lexicographically maximum substring is "bab".

    // Example 2:
    // Input: s = "leetcode"
    // Output: "tcode"
     
    // Constraints:
    // 1 <= s.length <= 4 * 10^5
    // s contains only lowercase English letters.

    func lastSubstring(_ s: String) -> String {
        var max = ""

        for index in s.indices {
            let suffix = s[index ..< s.endIndex]
            if suffix > max { max = String(suffix) }
        }

        return max
    }
    
}