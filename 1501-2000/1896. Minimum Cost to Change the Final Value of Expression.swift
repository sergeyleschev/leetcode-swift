class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1896. Minimum Cost to Change the Final Value of Expression
    // You are given a valid boolean expression as a string expression consisting of the characters '1','0','&' (bitwise AND operator),'|' (bitwise OR operator),'(', and ')'.
    // For example, "()1|1" and "(1)&()" are not valid while "1", "(((1))|(0))", and "1|(0&(1))" are valid expressions.
    // Return the minimum cost to change the final value of the expression.
    // For example, if expression = "1|1|(0&0)&1", its value is 1|1|(0&0)&1 = 1|1|0&1 = 1|0&1 = 1&1 = 1. We want to apply operations so that the new expression evaluates to 0.
    // The cost of changing the final value of an expression is the number of operations performed on the expression. The types of operations are described as follows:
    // Turn a '1' into a '0'.
    // Turn a '0' into a '1'.
    // Turn a '&' into a '|'.
    // Turn a '|' into a '&'.
    // Note: '&' does not take precedence over '|' in the order of calculation. Evaluate parentheses first, then in left-to-right order.

    // Example 1:
    // Input: expression = "1&(0|1)"
    // Output: 1
    // Explanation: We can turn "1&(0|1)" into "1&(0&1)" by changing the '|' to a '&' using 1 operation.
    // The new expression evaluates to 0. 

    // Example 2:
    // Input: expression = "(0&0)&(0&0&0)"
    // Output: 3
    // Explanation: We can turn "(0&0)&(0&0&0)" into "(0|1)|(0&0&0)" using 3 operations.
    // The new expression evaluates to 1.

    // Example 3:
    // Input: expression = "(0|(1|0&1))"
    // Output: 1
    // Explanation: We can turn "(0|(1|0&1))" into "(0|(0|0&1))" using 1 operation.
    // The new expression evaluates to 0.

    // Constraints:
    // 1 <= expression.length <= 10^5
    // expression only contains '1','0','&','|','(', and ')'
    // All parentheses are properly matched.
    // There will be no empty parentheses (i.e: "()" is not a substring of expression).

    // - Complexity:
    //   - time: O(n)

    func minOperationsToFlip(_ expression: String) -> Int {
        let n = expression.count
        var e = Array(expression)
        var pair = [Int: Int]()
        var stack = [Int]()

        for (i, c) in e.enumerated() {
            if c == "(" { stack.append(i) } 
            else if c == ")" {
                let last = stack.removeLast()
                pair[i] = last
            }
        }

        return check(0, n - 1, e, pair).minOperation
    }


    private func check(_ start: Int, _ end: Int, _ e: [Character], _ pair: [Int: Int]) -> (val: Int, minOperation: Int) {
        if start == end { return (e[start].wholeNumberValue!, 1) }
        
        if e[end] == Character("0") || e[end] == Character("1") {
            let (v1, p1) = check(start, end - 2, e, pair)
            let (v2, p2) = check(end, end, e, pair)
            return calculate(v1, p1, v2, p2, e[end - 1])

        } else {
            if pair[end] == start { return check(start + 1, end - 1, e, pair) }
            let (v1, p1) = check(start, pair[end]! - 2, e, pair)
            let (v2, p2) = check(pair[end]!, end, e, pair)
            return calculate(v1, p1, v2, p2, e[pair[end]! - 1])
        }
    }


    private func calculate(_ v1: Int, _ p1: Int, _ v2: Int, _ p2: Int, _ operation: Character) -> (val: Int, minOperation: Int) {
        if v1 == 0 && v2 == 0 && operation == Character("|") { return (0, min(p1, p2)) }
        if v1 == 1 && v2 == 0 && operation == Character("|") { return (1, 1) }
        if v1 == 1 && v2 == 1 && operation == Character("|") { return (1, 1 + min(p1, p2)) }
        if v1 == 0 && v2 == 1 && operation == Character("|") { return (1, 1) }
        if v1 == 0 && v2 == 0 && operation == Character("&") { return (0, 1 + min(p1, p2)) }
        if v1 == 1 && v2 == 0 && operation == Character("&") { return (0, 1) }
        if v1 == 1 && v2 == 1 && operation == Character("&") { return (1, min(p1, p2)) }
        if v1 == 0 && v2 == 1 && operation == Character("&") { return (0, 1) }
        return (0, 0)
    }

}