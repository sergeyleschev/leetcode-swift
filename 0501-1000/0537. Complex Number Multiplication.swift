class Solution {

    // Solution by Sergey Leschev

    // 537. Complex Number Multiplication
    // A complex number can be represented as a string on the form "real+imaginaryi" where:
    // real is the real part and is an integer in the range [-100, 100].
    // imaginary is the imaginary part and is an integer in the range [-100, 100].
    // i2 == -1.
    // Given two complex numbers num1 and num2 as strings, return a string of the complex number that represents their multiplications.

    // Example 1:
    // Input: num1 = "1+1i", num2 = "1+1i"
    // Output: "0+2i"
    // Explanation: (1 + i) * (1 + i) = 1 + i2 + 2 * i = 2i, and you need convert it to the form of 0+2i.

    // Example 2:
    // Input: num1 = "1+-1i", num2 = "1+-1i"
    // Output: "0+-2i"
    // Explanation: (1 - i) * (1 - i) = 1 + i2 - 2 * i = -2i, and you need convert it to the form of 0+-2i.

    // Constraints:
    // num1 and num2 are valid complex numbers.

    func complexNumberMultiply(_ a: String, _ b: String) -> String {
        var aInt = 0,bInt = 0,cInt = 0,dInt = 0
        
        (aInt, bInt) = self.stringToint(a)
        (cInt, dInt) = self.stringToint(b)

        return String(aInt * cInt - bInt * dInt) + "+" + String(bInt * cInt + aInt * dInt) + "i"
    }
    
    
    func stringToint(_ str:String) -> (Int,Int) {
        var real = ""
        var vir = ""
        
        for (i,k) in str.enumerated() {
            if k == "+" {
                real = String(str[..<str.index(str.startIndex, offsetBy:i)])
                vir = String(str[str.index(str.startIndex, offsetBy: i + 1)..<str.index(before: str.endIndex)])
            }
        }
        
        return (Int(real)!, Int(vir)!)
    }
    
}