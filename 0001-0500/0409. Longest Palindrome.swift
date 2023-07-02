class Solution {

    // Solution by Sergey Leschev

    // 409. Longest Palindrome
    // Given a string s which consists of lowercase or uppercase letters, return the length of the longest palindrome that can be built with those letters.
    // Letters are case sensitive, for example, "Aa" is not considered a palindrome here.

    // Finds the length of the longest palindromes that can be built with letters from a string.

    // - Parameter s: The string.
    // - Returns: The length of the longest palindromes

    // Example 1:
    // Input: s = "abccccdd"
    // Output: 7
    // Explanation:
    // One longest palindrome that can be built is "dccaccd", whose length is 7.

    // Example 2:
    // Input: s = "a"
    // Output: 1

    // Example 3:
    // Input: s = "bb"
    // Output: 2

    // Constraints:
    // 1 <= s.length <= 2000
    // s consists of lowercase and/or uppercase English letters only.

    // - Complexity:
    //   - time: O(n), where n is the number of letters in the string.
    //   - space: O(n), where n is the number of letters in the string.

    func longestPalindrome(_ s: String) -> Int {
        var dict = [Character: Int]()
        for ch in s { dict[ch, default: 0] += 1 }

        var ans = 0
        var hasOdd = false
        for (_, el) in dict.enumerated() {
            if el.value % 2 == 0 {
                ans += el.value
            } else {
                hasOdd = true
                ans += el.value - 1
            }
        }

        return ans + (hasOdd ? 1 : 0)
    }

}
