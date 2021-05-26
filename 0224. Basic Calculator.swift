class Solution {

    // 224. Basic Calculator
    // Given a string s representing a valid expression, implement a basic calculator to evaluate it, and return the result of the evaluation.
    // Note: You are not allowed to use any built-in function which evaluates strings as mathematical expressions, such as eval().

    // Example 1:
    // Input: s = "1 + 1"
    // Output: 2

    // Example 2:
    // Input: s = " 2-1 + 2 "
    // Output: 3

    // Example 3:
    // Input: s = "(1+(4+5+2)-3)+(6+8)"
    // Output: 23

    // Example 4:
    // Input: s = "+48 + -48"
    // Output: 0
    // Explanation: Numbers can have multiple digits and start with +/-.

    // Constraints:
    // 1 <= s.length <= 3 * 10^5
    // s consists of digits, '+', '-', '(', ')', and ' '.
    // s represents a valid expression.
    // Every number and running calculation will fit in a signed 32-bit integer.

    func calculate(_ s: String) -> Int {
        let tokens = parse(s)
        return Int(calculate(tokens))!
    }

    
    func calculate(_ tokens: [String]) -> String {
        var tokens = tokens
        var stack: [Int] = []
        var i = 0
        
        while i < tokens.count {
            let token = tokens[i]
            switch token {

            case "(": stack.append(i)
            case ")":
                let start = stack[stack.count - 1]
                let end = i
                stack.remove(at: stack.count - 1)
                let val = calculateTokensWithoutBrackets(Array(tokens[start+1..<end]))
                tokens.replaceSubrange(start...end, with: [val])
                i = start
            default: break
            }

            i += 1
        }
        return calculateTokensWithoutBrackets(tokens)
    }

    
    func calculateTokensWithoutBrackets(_ tokens: [String]) -> String {
        var sum = 0
        var pos = 1
        
        for token in tokens {
            switch token {
            case "+": pos = 1
            case "-": pos = -1
            default: sum += pos * Int(token)!
            }
        }
        
        return String(sum)
    }
    
    
    func parse(_ s: String) -> [String] {
        var tokens: [String] = []
        var number: String = ""
        
        let appendNumberIfExist = {
            if number.count > 0 {
                tokens.append(number)
                number = ""
            }
        }
        
        for c in s {
            switch c {
            case "+", "-", "(", ")":
                appendNumberIfExist()
                tokens.append(String(c))
            case " ":  appendNumberIfExist()
            default: number += String(c)
            }
        }
        
        appendNumberIfExist()
        return tokens
    }

}