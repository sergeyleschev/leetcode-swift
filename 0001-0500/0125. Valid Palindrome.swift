class Solution {

    // Solution @ Sergey Leschev

    // 125. Valid Palindrome
    // Given a string s, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

    // Determines if a string is a palindrome.
    // - Parameter s: The string.
    // - Returns: True if the string is a palindrome, otherwise returns false.

    // Example 1:
    // Input: s = "A man, a plan, a canal: Panama"
    // Output: true
    // Explanation: "amanaplanacanalpanama" is a palindrome.
    
    // Example 2:
    // Input: s = "race a car"
    // Output: false
    // Explanation: "raceacar" is not a palindrome.

    // Constraints:
    // 1 <= s.length <= 2 * 10^5
    // s consists only of printable ASCII characters.

    // - Complexity:
    //   - time: O(n), where n is the length of the *s*.
    //   - space: O(1), only constant space is used.

    func isPalindrome(_ s: String) -> Bool {
        guard !s.isEmpty else { return true }

        let s = Array(s)
        var i = 0
        var j = s.count - 1

        while i < j {
            if !s[i].isLetter, !s[i].isNumber { i += 1; continue }

            if !s[j].isLetter, !s[j].isNumber { j -= 1; continue }

            guard s[i].lowercased() == s[j].lowercased() else { return false }
            i += 1
            j -= 1
        }

        return true
    }

}