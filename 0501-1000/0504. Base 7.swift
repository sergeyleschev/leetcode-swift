class Solution {

    // Solution by Sergey Leschev

    // 504. Base 7
    // Given an integer num, return a string of its base 7 representation.

    // Example 1:
    // Input: num = 100
    // Output: "202"

    // Example 2:
    // Input: num = -7
    // Output: "-10"

    // Constraints:
    // -10^7 <= num <= 10^7

    func convertToBase7(_ num: Int) -> String {
        if num == 0 { return "0" }
        var result = ""
        var n = abs(num)
        
        while n > 0 {
            let remainder = n % 7
            result = "\(remainder)" + result
            n /= 7
        }
        
        return num < 0 ? "-" + result : result
    }
    
}