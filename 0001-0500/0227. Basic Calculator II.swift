class Solution {

    // Solution by Sergey Leschev

    // 227. Basic Calculator II
    // Given a string s which represents an expression, evaluate this expression and return its value. 
    // The integer division should truncate toward zero.
    // Note: You are not allowed to use any built-in function which evaluates strings as mathematical expressions, such as eval().

    // Calculates expression string.
    
    // - Parameter s: The expression string.
    // - Returns: The result.

    // Example 1:
    // Input: s = "3+2*2"
    // Output: 7

    // Example 2:
    // Input: s = " 3/2 "
    // Output: 1

    // Example 3:
    // Input: s = " 3+5 / 2 "
    // Output: 5

    // Constraints:
    // 1 <= s.length <= 3 * 10^5
    // s consists of integers and operators ('+', '-', '*', '/') separated by some number of spaces.
    // s represents a valid expression.
    // All the integers in the expression are non-negative integers in the range [0, 2^31 - 1].
    // The answer is guaranteed to fit in a 32-bit integer.

    // - Complexity:
    //   - time: O(n), where n is the length of `s`.
    //   - space: O(1), only constant space is used.
    
    func calculate(_ s: String) -> Int {
        var num = 0
        var stack = [Int]()
        var op = "+"
        
        for char in s + "+" where char != " " {
            if let number = char.wholeNumberValue {
                num = num * 10 + number
            
            } else {
                switch op {
                case "+": stack.append(num)
                case "-": stack.append(-num)
                case "*": stack.append(stack.removeLast() * num)
                case "/": stack.append(stack.removeLast() / num)
                default: break
                }
                
                num = 0
                op = String(char)
            }
        }
        
        return stack.reduce(0, +)
    }
    
}