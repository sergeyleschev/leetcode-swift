class Solution {

    // 5. Longest Palindromic Substring
    // Given a string s, return the longest palindromic substring in s.

    // Example 1:
    // Input: s = "babad"
    // Output: "bab"
    // Note: "aba" is also a valid answer.

    // Example 2:
    // Input: s = "cbbd"
    // Output: "bb"

    // Example 3:
    // Input: s = "a"
    // Output: "a"

    // Example 4:
    // Input: s = "ac"
    // Output: "a"
     
    // Constraints:
    // 1 <= s.length <= 1000
    // s consist of only digits and English letters (lower-case and/or upper-case)

    func longestPalindrome(_ s: String) -> String {
        guard s.count > 0 else { return s }
        var string = Array(s)
        let count = string.count
        var max_1 = 0
        var index_1 = 0
        var max_2 = 0
        var index_2 = -1

        for i in 0..<count {
            var tmp = 0
            for j in 0..<count {
                if (i - j < 0 || i + j > count-1) { break }
                if (string[i  - j] != string[i + j]) { break }
                max_1 = max_1 > tmp ? max_1 : tmp
                index_1 = max_1 > tmp ? index_1 : i
                tmp += 1
            }
        }

        for i in 0..<count {
            var tmp = 0
            for j in 0..<count {
                if (i - j < 0 || i + j + 1 > count - 1) { break }
                if (string[i - j] != string[i + j + 1]) { break }
                tmp += 1
                max_2 = max_2 > tmp ? max_2 : tmp
                index_2 = max_2 > tmp ? index_2 : i
            }
        }

        if ((max_1 * 2 + 1) >= max_2 * 2) {
            let start = s.index(s.startIndex, offsetBy: index_1 - max_1)
            let end = s.index(s.startIndex, offsetBy: index_1 + max_1 + 1)
            return String(s[start..<end])

        } else {
            let start = s.index(s.startIndex, offsetBy: index_2 - max_2 + 1)
            let end = s.index(s.startIndex, offsetBy: index_2 + max_2 + 1)
            return String(s[start..<end])
        }  
    }

}