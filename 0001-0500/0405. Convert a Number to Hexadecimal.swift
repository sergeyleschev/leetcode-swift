class Solution {

    // Solution @ Sergey Leschev

    // 405. Convert a Number to Hexadecimal
    // Given an integer num, return a string representing its hexadecimal representation. For negative integers, two’s complement method is used.
    // All the letters in the answer string should be lowercase characters, and there should not be any leading zeros in the answer except for the zero itself.
    // Note: You are not allowed to use any built-in library method to directly solve this problem.

    // Example 1:
    // Input: num = 26
    // Output: "1a"

    // Example 2:
    // Input: num = -1
    // Output: "ffffffff"

    // Constraints:
    // -2^31 <= num <= 2^31 - 1

    func toHex(_ num: Int) -> String {
        if case 0..<10 = num { return "\(num)" }
        
        var n = num
        if num < 0 { n += 4294967296 }
        
        var res = ""
        while n > 0 {
            let digit = n % 16
            if digit >= 10 {
                res = String(Character(UnicodeScalar(digit + 87)!)) + res
            } else {
                res = "\(digit)" + res
            }
            n /= 16
        }
        
        return res
    }
    
}