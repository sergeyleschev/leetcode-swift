class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 647. Palindromic Substrings
    // Given a string s, return the number of palindromic substrings in it.
    // A string is a palindrome when it reads the same backward as forward.
    // A substring is a contiguous sequence of characters within the string.

    // Example 1:
    // Input: s = "abc"
    // Output: 3
    // Explanation: Three palindromic strings: "a", "b", "c".

    // Example 2:
    // Input: s = "aaa"
    // Output: 6
    // Explanation: Six palindromic strings: "a", "a", "a", "aa", "aa", "aaa".

    // Constraints:
    // 1 <= s.length <= 1000
    // s consists of lowercase English letters.

    func countSubstrings(_ s: String) -> Int {
        let chars = Array(s)
        var count = 0
        
        
        func expandAroundCenter(_ left: Int, _ right: Int) {
            var left = left
            var right = right
            
            while left >= 0 && right < chars.count && chars[left] == chars[right] {
                count += 1
                left -= 1
                right += 1
            }
        }
        
        for i in 0..<chars.count {
            expandAroundCenter(i, i)
            expandAroundCenter(i, i + 1)
        }
        
        return count
    }

}