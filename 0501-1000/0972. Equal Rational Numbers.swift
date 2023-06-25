struct Fraction {
    var numerator: Int
    var denominator: Int
        
    public func isEqualTo(other fraction: Fraction) -> Bool { numerator * fraction.denominator == denominator * fraction.numerator }
}


class Solution {

    // Solution @ Sergey Leschev

    // 972. Equal Rational Numbers
    // Given two strings s and t, each of which represents a non-negative rational number, return true if and only if they represent the same number. The strings may use parentheses to denote the repeating part of the rational number.
    // A rational number can be represented using up to three parts: <IntegerPart>, <NonRepeatingPart>, and a <RepeatingPart>. The number will be represented in one of the following three ways:
    // <IntegerPart>
    // For example, 12, 0, and 123.
    // <IntegerPart><.><NonRepeatingPart>
    // For example, 0.5, 1., 2.12, and 123.0001.
    // <IntegerPart><.><NonRepeatingPart><(><RepeatingPart><)>
    // For example, 0.1(6), 1.(9), 123.00(1212).
    // The repeating portion of a decimal expansion is conventionally denoted within a pair of round brackets. For example:
    // 1/6 = 0.16666666... = 0.1(6) = 0.1666(6) = 0.166(66).

    // Example 1:
    // Input: s = "0.(52)", t = "0.5(25)"
    // Output: true
    // Explanation: Because "0.(52)" represents 0.52525252..., and "0.5(25)" represents 0.52525252525..... , the strings represent the same number.

    // Example 2:
    // Input: s = "0.1666(6)", t = "0.166(66)"
    // Output: true

    // Example 3:
    // Input: s = "0.9(9)", t = "1."
    // Output: true
    // Explanation: "0.9(9)" represents 0.999999999... repeated forever, which equals 1.  [See this link for an explanation.]
    // "1." represents the number 1, which is formed correctly: (IntegerPart) = "1" and (NonRepeatingPart) = "".

    // Constraints:
    // Each part consists only of digits.
    // The <IntegerPart> does not have leading zeros (except for the zero itself).
    // 1 <= <IntegerPart>.length <= 4
    // 0 <= <NonRepeatingPart>.length <= 4
    // 1 <= <RepeatingPart>.length <= 4

    private var powerOfTen: [Int]


    init() {
        powerOfTen = [1]
        for _ in 1...15 { powerOfTen.append(powerOfTen.last! * 10) }
    }


    func isRationalEqual(_ s: String, _ t: String) -> Bool { stringToFraction(s).isEqualTo(other: stringToFraction(t)) }
    

    private func stringToFraction(_ numStr: String) -> Fraction {
        guard !numStr.contains("(") else { return circulatingDecimalToFraction(numStr) }
        guard !numStr.contains(".") else { return doubleToFraction(numStr) }
        return integerToFraction(numStr)
    }
    

    private func integerToFraction(_ integer : String) -> Fraction { Fraction(numerator: Int(integer)!, denominator: 1) }
    

    private func doubleToFraction(_ numStr: String) -> Fraction {
        let pointIndex = numStr.firstIndex(of: ".")!
        let integer = Int(String(numStr[..<pointIndex]))!
        let floatStr = String(numStr[numStr.index(after: pointIndex)...])
        if floatStr.isEmpty { return Fraction(numerator: integer, denominator: 1) }
        let floatLength = floatStr.count
        return Fraction(numerator: integer * powerOfTen[floatLength] + Int(floatStr)!, denominator: powerOfTen[floatLength])
    }
    

    private func circulatingDecimalToFraction(_ numStr: String) -> Fraction {
        let leftParenthesisIdx = numStr.firstIndex(of: "(")!
        let pointIndex = numStr.firstIndex(of: ".")!
        let integer = Int(String(numStr[..<pointIndex]))!
        let nonRepeatingPart = String(numStr[numStr.index(after: pointIndex)..<leftParenthesisIdx])
        let rightParenthesisIdx = numStr.firstIndex(of: ")")!
        let repeatingPart = String(numStr[numStr.index(after: leftParenthesisIdx)..<rightParenthesisIdx])
        return Fraction(numerator: powerOfTen[repeatingPart.count + nonRepeatingPart.count] * integer + Int(nonRepeatingPart + repeatingPart)! - (powerOfTen[nonRepeatingPart.count] * integer + (Int(nonRepeatingPart) ?? 0 )), 
                        denominator: powerOfTen[nonRepeatingPart.count + repeatingPart.count] - powerOfTen[nonRepeatingPart.count])
    }

}