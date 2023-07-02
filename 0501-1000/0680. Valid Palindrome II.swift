class Solution {

    // Solution by Sergey Leschev

    // 680. Valid Palindrome I
    // Given a string s, return true if the s can be palindrome after deleting at most one character from it.

    // Example 1:
    // Input: s = "aba"
    // Output: true

    // Example 2:
    // Input: s = "abca"
    // Output: true
    // Explanation: You could delete the character 'c'.

    // Example 3:
    // Input: s = "abc"
    // Output: false

    // Constraints:
    // 1 <= s.length <= 10^5
    // s consists of lowercase English letters.

    func validPalindrome(_ s: String) -> Bool {
        var chars = Array(s.unicodeScalars.map { $0.value })
        var left = 0
        var right = s.count - 1

        func isPalindrome(chars: ArraySlice<UInt32>) -> Bool {
            var left = chars.startIndex
            var right = chars.endIndex - 1
            while left < right {
                if chars[left] != chars[right] { return false }
                left += 1
                right -= 1
            }
            return true
        }

        while left < right {
            if chars[left] != chars[right] {
                return isPalindrome(chars: chars[left + 1...right])
                    || isPalindrome(chars: chars[left...right - 1])
            }
            left += 1
            right -= 1
        }

        return true
    }

}
