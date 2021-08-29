class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 678. Valid Parenthesis String
    // Given a string s containing only three types of characters: '(', ')' and '*', return true if s is valid.
    // The following rules define a valid string:
    // Any left parenthesis '(' must have a corresponding right parenthesis ')'.
    // Any right parenthesis ')' must have a corresponding left parenthesis '('.
    // Left parenthesis '(' must go before the corresponding right parenthesis ')'.
    // '*' could be treated as a single right parenthesis ')' or a single left parenthesis '(' or an empty string "".

    // Checks whether a string is valid.

    // - Parameter s: The string.
    // - Returns: True if the string is valid, otherwise returns false.

    // Example 1:
    // Input: s = "()"
    // Output: true

    // Example 2:
    // Input: s = "(*)"
    // Output: true

    // Example 3:
    // Input: s = "(*))"
    // Output: true

    // Constraints:
    // 1 <= s.length <= 100
    // s[i] is '(', ')' or '*'.

    // - Complexity:
    //   - time: O(n), where n is the length of the string.
    //   - space: O(1), only constant space is used.
    
    func checkValidString(_ s: String) -> Bool {
        var open = 0
        var close = 0

        for c in s {
            open += c == "(" ? 1 : -1
            close += c != ")" ? 1 : -1
            guard close >= 0 else { return false }
            open = max(open, 0)
        }

        return open == 0
    }

}