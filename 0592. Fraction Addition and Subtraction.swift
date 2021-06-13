class Solution {

    // 592. Fraction Addition and Subtraction
    // Given a string expression representing an expression of fraction addition and subtraction, return the calculation result in string format
    // The final result should be an irreducible fraction. If your final result is an integer, say 2, you need to change it to the format of a fraction that has a denominator 1. So in this case, 2 should be converted to 2/1.

    // Example 1:
    // Input: expression = "-1/2+1/2"
    // Output: "0/1"

    // Example 2:
    // Input: expression = "-1/2+1/2+1/3"
    // Output: "1/3"

    // Example 3:
    // Input: expression = "1/3-1/2"
    // Output: "-1/6"

    // Example 4:
    // Input: expression = "5/3+1/3"
    // Output: "2/1"

    // Constraints:
    // The input string only contains '0' to '9', '/', '+' and '-'. So does the output.
    // Each fraction (input and output) has the format ±numerator/denominator. If the first input fraction or the output is positive, then '+' will be omitted.
    // The input only contains valid irreducible fractions, where the numerator and denominator of each fraction will always be in the range [1, 10]. If the denominator is 1, it means this fraction is actually an integer in a fraction format defined above.
    // The number of given fractions will be in the range [1, 10].
    // The numerator and denominator of the final result are guaranteed to be valid and in the range of 32-bit int.

    func greatestCommonDivisor(m: Int, d: Int) -> Int {
        return m == 0 ? d : greatestCommonDivisor(m: d % m, d: m)
    }

    
    func fractionAddition(_ expression: String) -> String {
        var ans = (0, 1)
        var score = (0, 0)
        var symbol = 1
        var num = 0
        
        for (i, e) in expression.enumerated() {
            if e == "-" || e == "+" {
                symbol = e == "-" ? -1 : 1
            } else if e == "/" {
                score.0 = symbol * num
                num = 0
            } else {
                num = num * 10 + Int(String(e))!
            }

            if ((e == "-" || e == "+") && num != 0)  || i == expression.count - 1 {
                score.1 = num
                ans = (score.0 * ans.1 + score.1 * ans.0, (score.1 * ans.1))
                let gcd = greatestCommonDivisor(m: abs(ans.0), d: ans.1)
                ans = (ans.0 / gcd, ans.1 / gcd)
                num = 0
            }
        }
        
        return "\(ans.0)" + "/" + "\(ans.1)"
    }
    
}