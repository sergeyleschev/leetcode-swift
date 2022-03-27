class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1006. Clumsy Factorial
    // Normally, the factorial of a positive integer n is the product of all positive integers less than or equal to n.  For example, factorial(10) = 10 * 9 * 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1.
    // We instead make a clumsy factorial: using the integers in decreasing order, we swap out the multiply operations for a fixed rotation of operations: multiply (*), divide (/), add (+) and subtract (-) in this order.
    // For example, clumsy(10) = 10 * 9 / 8 + 7 - 6 * 5 / 4 + 3 - 2 * 1.  However, these operations are still applied using the usual order of operations of arithmetic: we do all multiplication and division steps before any addition or subtraction steps, and multiplication and division steps are processed left to right.
    // Additionally, the division that we use is floor division such that 10 * 9 / 8 equals 11.  This guarantees the result is an integer.
    // Implement the clumsy function as defined above: given an integer n, it returns the clumsy factorial of n.

    // Example 1:
    // Input: n = 4
    // Output: 7
    // Explanation: 7 = 4 * 3 / 2 + 1

    // Example 2:
    // Input: n = 10
    // Output: 12
    // Explanation: 12 = 10 * 9 / 8 + 7 - 6 * 5 / 4 + 3 - 2 * 1

    // Note:
    // 1 <= n <= 10000
    // -2^31 <= answer <= 2^31 - 1  (The answer is guaranteed to fit within a 32-bit integer.)

    func clumsy(_ N: Int) -> Int {
        guard N > 0 else { return 0 }
        var stack: [Int] = [], o = "+"
        let operators = ["*", "/", "+", "-"]
        
        for i in stride(from: N, to: 0, by: -1) {
            switch o {
            case "*": stack.append(stack.removeLast() * i)
            case "/": stack.append(stack.removeLast() / i)
            case "+": stack.append(i)
            case "-": stack.append(-i)
            default: continue
            }
            o = operators[(N - i) % 4]
        }
        
        let ans = stack.reduce(0, +)
        return ans
    }
    
}