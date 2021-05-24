class Solution {

    // 150. Evaluate Reverse Polish Notation
    // Evaluate the value of an arithmetic expression in Reverse Polish Notation.
    // Valid operators are +, -, *, and /. Each operand may be an integer or another expression.
    // Note that division between two integers should truncate toward zero.
    // It is guaranteed that the given RPN expression is always valid. That means the expression would always evaluate to a result, and there will not be any division by zero operation.

    // Evaluates the value of an arithmetic expression in Reverse Polish Notation.
    // - Parameter tokens: Array of tokens.
    // - Returns: Value of arithmetic expression.

    // Example 1:
    // Input: tokens = ["2","1","+","3","*"]
    // Output: 9
    // Explanation: ((2 + 1) * 3) = 9

    // Example 2:
    // Input: tokens = ["4","13","5","/","+"]
    // Output: 6
    // Explanation: (4 + (13 / 5)) = 6

    // Example 3:
    // Input: tokens = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
    // Output: 22
    // Explanation: ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
    // = ((10 * (6 / (12 * -11))) + 17) + 5
    // = ((10 * (6 / -132)) + 17) + 5
    // = ((10 * 0) + 17) + 5
    // = (0 + 17) + 5
    // = 17 + 5
    // = 22

    // Constraints:
    // 1 <= tokens.length <= 10^4
    // tokens[i] is either an operator: "+", "-", "*", or "/", or an integer in the range [-200, 200].

    // - Complexity:
    //   - time: O(n), where n is the length of the tokens.
    //   - space: O(n), where n is the length of the tokens.
    
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()

        for token in tokens {
            if let num = Int(token) { stack.append(num); continue }

            guard stack.count >= 2 else { fatalError("RPN expression isn't valid.") }

            let sec = stack.removeLast()
            let fir = stack.removeLast()

            switch token {
            case "+": stack.append(fir + sec)
            case "-": stack.append(fir - sec)
            case "*": stack.append(fir * sec)
            case "/": stack.append(fir / sec)
            default:
                fatalError("RPN expression isn't valid.")
            }
        }

        guard stack.count == 1 else { fatalError("RPN expression isn't valid.") }
        return stack[0]
    }

}