class Solution {

    // Solution @ Sergey Leschev, Belarusian State University
    
    // 201. Bitwise AND of Numbers Range
    // Given two integers left and right that represent the range [left, right], return the bitwise AND of all numbers in this range, inclusive.

    // Example 1:
    // Input: left = 5, right = 7
    // Output: 4

    // Example 2:
    // Input: left = 0, right = 0
    // Output: 0

    // Example 3:
    // Input: left = 1, right = 2147483647
    // Output: 0

    // Constraints:
    // 0 <= left <= right <= 2^31 - 1
    
    func rangeBitwiseAnd(_ left: Int, _ right: Int) -> Int {
        var mask = 0

        for i in 0..<32 {
            let temp = 1 << (31 - i)
            if temp & left == temp & right {
                mask |= temp
            } else { break }
        }
        
        return right & mask
    }

}
