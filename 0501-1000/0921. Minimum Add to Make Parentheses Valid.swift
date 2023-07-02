class Solution {

    // Solution by Sergey Leschev

    // 921. Minimum Add to Make Parentheses Valid
    // Given a string s of '(' and ')' parentheses, we add the minimum number of parentheses ( '(' or ')', and in any positions ) so that the resulting parentheses string is valid.
    // Formally, a parentheses string is valid if and only if:
    // It is the empty string, or
    // It can be written as AB (A concatenated with B), where A and B are valid strings, or
    // It can be written as (A), where A is a valid string.
    // Given a parentheses string, return the minimum number of parentheses we must add to make the resulting string valid.

    // Example 1:
    // Input: s = "())"
    // Output: 1

    // Example 2:
    // Input: s = "((("
    // Output: 3

    // Example 3:
    // Input: s = "()"
    // Output: 0

    // Example 4:
    // Input: s = "()))(("
    // Output: 4

    // Note:
    // s.length <= 1000
    // s only consists of '(' and ')' characters.

    func minAddToMakeValid(_ S: String) -> Int {
        var stack = [Character]()
        var i = 0
        var S = Array(S)

        while i < S.count {
            if Character("(") == S[i] {
                stack.append(S.remove(at: i))
            } else if Character(")") == S[i] {
                if !stack.isEmpty {
                    S.remove(at: i)
                    stack.removeLast()
                } else {
                    i += 1
                }
            }
        }

        return S.count + stack.count
    }

}
