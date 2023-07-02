class Solution {

    // Solution by Sergey Leschev

    // 20. Valid Parentheses
    // Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

    // An input string is valid if:
    // 1. Contains just the characters '(', ')', '{', '}', '[' and ']'
    // 2. Open brackets must be closed by the same type of brackets.
    // 3. Open brackets must be closed in the correct order.
    // 4. An empty string is also considered valid.

    // Returns boolean value indicating whether the input string is valid.

    // Example 1:
    // Input: s = "()"
    // Output: true

    // Example 2:
    // Input: s = "()[]{}"
    // Output: true

    // Example 3:
    // Input: s = "(]"
    // Output: false

    // Example 4:
    // Input: s = "([)]"
    // Output: false

    // Example 5:
    // Input: s = "{[]}"
    // Output: true

    // Constraints:
    // 1 <= s.length <= 10^4
    // s consists of parentheses only '()[]{}'.

    // - Parameter s: Input string
    // - Returns: Is the input string valid.

    // - Complexity:
    //   - time: O(n), where n is the length of the s.
    //   - space: O(n), where n is the length of the s.

    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        let dict: [Character: Character] = ["(": ")", "{": "}", "[": "]"]

        for char in s {
            switch char {
            case "(", "{", "[": stack.append(char)
            case ")", "}", "]":
                guard !stack.isEmpty, dict[stack.removeLast()] == char else { return false }
            default: return false
            }
        }
        return stack.isEmpty
    }

}
