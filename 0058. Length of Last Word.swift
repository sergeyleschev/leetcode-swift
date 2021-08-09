class Solution {

    // 58. Length of Last Word
    // Given a string s consists of some words separated by spaces, return the length of the last word in the string. If the last word does not exist, return 0.
    // A word is a maximal substring consisting of non-space characters only.

    // Finds the length of the last word in a given string.

    // - Parameter s: A string consists of upper/lower-case alphabets and empty space characters ' '.
    // - Returns: The length of the last word, if the last word does not exist returns 0.

    // Example 1:
    // Input: s = "Hello World"
    // Output: 5

    // Example 2:
    // Input: s = " "
    // Output: 0
     
    // Constraints:
    // 1 <= s.length <= 10^4
    // s consists of only English letters and spaces ' '.

    // - Complexity:
    //   - time: O(n), where n is the length of `s`.
    //   - space: O(1), only constant space is used.

    func lengthOfLastWord(_ s: String) -> Int {
        var ans = 0

        for c in s.reversed() {
            if c != " " {
                ans += 1
            } else if ans > 0 {
                return ans
            }
        }

        return ans
    }

}