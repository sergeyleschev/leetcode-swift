class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 241. Different Ways to Add Parentheses
    // Given a string expression of numbers and operators, return all possible results from computing all the different possible ways to group numbers and operators. You may return the answer in any order.

    // Example 1:
    // Input: expression = "2-1-1"
    // Output: [0,2]
    // Explanation:
    // ((2-1)-1) = 0 
    // (2-(1-1)) = 2

    // Example 2:
    // Input: expression = "2*3-4*5"
    // Output: [-34,-14,-10,-10,10]
    // Explanation:
    // (2*(3-(4*5))) = -34 
    // ((2*3)-(4*5)) = -14 
    // ((2*(3-4))*5) = -10 
    // (2*((3-4)*5)) = -10 
    // (((2*3)-4)*5) = 10

    // Constraints:
    // 1 <= expression.length <= 20
    // expression consists of digits and the operator '+', '-', and '*'.

    func diffWaysToCompute(_ expression: String) -> [Int] {
        let (numbers, operators) = parse(expression)
        return compute(numbers, operators)
    }
    
    
    func compute(_ numbers: [Int], _ operators: [Character]) -> [Int] {
        if operators.count == 0 { return numbers }
        var res: [Int] = []
        
        for (i, op) in operators.enumerated() {
            let lhs = compute(Array(numbers[0...i]), Array(operators[0..<i]))
            let rhs = compute(Array(numbers[i + 1..<numbers.count]), Array(operators[i + 1..<operators.count]))
            for num1 in lhs {
                for num2 in rhs {
                    let val = calculate(num1, num2, op)
                    res.append(val)
                }
            }
        }
        
        return res
    }
    
    
    func parse(_ expression: String) -> ([Int], [Character]) {
        var operators: [Character] = []
        var numbers: [Int] = []
        var token = ""
        
        for c in expression {
            switch c {
            case "+", "-", "*": 
                numbers.append(Int(token)!)
                operators.append(c)
                token = ""
            default: 
                token += String(c)
            }
        }
        
        numbers.append(Int(token)!)
        return (numbers, operators)
    }
    
    
    func calculate(_ num1: Int, _ num2: Int, _ op: Character) -> Int {
        var res: Int
        
        switch op {
        case "+":  res = num1 + num2 
        case "-":  res = num1 - num2 
        case "*":  res = num1 * num2
        default: res = 0
        }
        
        return res
    }
    
}