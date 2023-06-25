class Solution {

    // Solution @ Sergey Leschev

    // 1446. Consecutive Characters
    // Given a string s, the power of the string is the maximum length of a non-empty substring that contains only one unique character.

    // Return the power of the string.

    // - Parameter s: The string.
    // - Returns: The power of the string.

    // Example 1:
    // Input: s = "leetcode"
    // Output: 2
    // Explanation: The substring "ee" is of length 2 with the character 'e' only.

    // Example 2:
    // Input: s = "abbcccddddeeeeedcba"
    // Output: 5
    // Explanation: The substring "eeeee" is of length 5 with the character 'e' only.

    // Example 3:
    // Input: s = "triplepillooooow"
    // Output: 5

    // Example 4:
    // Input: s = "hooraaaaaaaaaaay"
    // Output: 11

    // Example 5:
    // Input: s = "tourist"
    // Output: 1

    // Constraints:
    // 1 <= s.length <= 500
    // s contains only lowercase English letters.

    // - Complexity:
    //   - time: O(n), where n is the length of `s`.
    //   - space: O(1), only constant space is used.
    
    func maxPower(_ s: String) -> Int {
        var ans = 0
        var cur = 0
        var prev: Character = "-"

        for ch in s {
            if prev == ch {
                cur += 1
            } else {
                cur = 1
                prev = ch
            }

            ans = max(ans, cur)
        }

        return ans
    }

}