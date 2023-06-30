class Solution {

    // Solution by Sergey Leschev

    // 1249. Minimum Remove to Make Valid Parentheses
    // Given a string s of '(' , ')' and lowercase English characters. 
    // Your task is to remove the minimum number of parentheses ( '(' or ')', in any positions ) so that the resulting parentheses string is valid and return any valid string.
    // Formally, a parentheses string is valid if and only if:
    // It is the empty string, contains only lowercase characters, or
    // It can be written as AB (A concatenated with B), where A and B are valid strings, or
    // It can be written as (A), where A is a valid string.

    // Removes the minimum number of parentheses.

    // - Parameter s: The string.
    // - Returns: Valid parenthesis string.

    // Example 1:
    // Input: s = "lee(t(c)o)de)"
    // Output: "lee(t(c)o)de"
    // Explanation: "lee(t(co)de)" , "lee(t(c)ode)" would also be accepted.

    // Example 2:
    // Input: s = "a)b(c)d"
    // Output: "ab(c)d"

    // Example 3:
    // Input: s = "))(("
    // Output: ""
    // Explanation: An empty string is also valid.

    // Example 4:
    // Input: s = "(a(b(c)d)"
    // Output: "a(b(c)d)"

    // Constraints:
    // 1 <= s.length <= 10^5
    // s[i] is one of  '(' , ')' and lowercase English letters.

    // - Complexity:
    //   - time: O(n), where n is the length of s.
    //   - space: O(n), where n is the length of s.
    
    func minRemoveToMakeValid(_ s: String) -> String {
        var remove = Set<Int>()
        var stack = [Int]()
        var ans = [Character]()
        
        for (i, ch) in s.enumerated() {
            if ch == "(" {
                stack.append(i)
            } else if ch == ")" {
                if stack.isEmpty {
                    remove.insert(i)
                } else {
                    stack.removeLast()
                }
            }
        }
        
        while !stack.isEmpty { remove.insert(stack.removeLast()) }
        
        for (i, ch) in s.enumerated() {
            guard !remove.contains(i) else { continue }
            ans.append(ch)
        }
        
        return String(ans)
    }

}