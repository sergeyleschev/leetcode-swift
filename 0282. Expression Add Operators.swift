class Solution {

    // 282. Expression Add Operators
    // Given a string num that contains only digits and an integer target, return all possibilities to add the binary operators '+', '-', or '*' between the digits of num so that the resultant expression evaluates to the target value.

    // Example 1:
    // Input: num = "123", target = 6
    // Output: ["1*2*3","1+2+3"]

    // Example 2:
    // Input: num = "232", target = 8
    // Output: ["2*3+2","2+3*2"]

    // Example 3:
    // Input: num = "10^5", target = 5
    // Output: ["1*0+5","10^-5"]

    // Example 4:
    // Input: num = "00", target = 0
    // Output: ["0*0","0+0","0-0"]

    // Example 5:
    // Input: num = "3456237490", target = 9191
    // Output: []

    // Constraints:
    // 1 <= num.length <= 10
    // num consists of only digits.
    // -2^31 <= target <= 2^31 - 1

    func addOperators(_ num: String, _ target: Int) -> [String] {
        var res = [String]()
        helper(&res, "", Array(num), target, 0, 0, 0)
        return res
    }
    
    
    private func helper(_ res: inout [String], _ str: String, _ numChars: [Character], _ target: Int, _ pos: Int, _ currentAccum: Int, _ prevNum: Int) {
        if pos == numChars.count {
            if currentAccum == target { res.append(str) }; return 
        }
        
        for i in pos ..< numChars.count {
            if i != pos && numChars[pos] == "0" { break }
            
            let current = Int(String(numChars[pos ..< i+1]))!
            
            if pos == 0 {
                helper(&res, str + String(current), numChars, target, i + 1, current, current)
            } else {
                helper(&res, str + "+" + String(current), numChars, target, i + 1, currentAccum + current, current)
                helper(&res, str + "-" + String(current), numChars, target, i + 1, currentAccum - current, -current)
                helper(&res, str + "*" + String(current), numChars, target, i + 1, currentAccum - prevNum + prevNum * current, prevNum * current)
            }
        }
    }

}