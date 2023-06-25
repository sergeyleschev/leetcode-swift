class Solution {

    // Solution @ Sergey Leschev

    // 856. Score of Parentheses
    // Given a balanced parentheses string s, compute the score of the string based on the following rule:
    // () has score 1
    // AB has score A + B, where A and B are balanced parentheses strings.
    // (A) has score 2 * A, where A is a balanced parentheses string.

    // Example 1:
    // Input: s = "()"
    // Output: 1

    // Example 2:
    // Input: s = "(())"
    // Output: 2

    // Example 3:
    // Input: s = "()()"
    // Output: 2

    // Example 4:
    // Input: s = "(()(()))"
    // Output: 6

    // Note:
    // s is a balanced parentheses string, containing only ( and ).
    // 2 <= s.length <= 50

    func scoreOfParentheses(_ S: String) -> Int {
        var stack = [Character]()
        var ans = 0
        var depth = 0.0
        var last = Character(")")
        
        for char in S {
            if char == "(" {
                stack.append(char)
                depth += 1
            } else {
                stack.removeLast()
                if last == "(" {
                    ans += Int(pow(2.0, depth - 1))
                }
                depth -= 1
            }
            last = char
        }
        
        return ans
    }

}