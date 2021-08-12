class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 7. Reverse Integer
    // Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-2^31, 2^31 - 1], then return 0.
    // Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

    // Example 1:
    // Input: x = 123
    // Output: 321

    // Example 2:
    // Input: x = -123
    // Output: -321

    // Example 3:
    // Input: x = 120
    // Output: 21

    // Example 4:
    // Input: x = 0
    // Output: 0
     
    // Constraints:
    // -2^31 <= x <= 2^31 - 1

    func reverse(_ x: Int) -> Int {
        let isNegtive: Bool = x < 0
        var val = isNegtive ? -x : x
        var nums: [Int] = []
        let max: Double = pow(2, 31)
        var res: Int = 0
        
        while val > 0 {
            nums.append(val % 10)
            val = val / 10
        }
        
        for num in nums { res = 10 * res + num }
        res = isNegtive ? -res : res
        
        if res < -Int(max) || res > Int(max)  - 1 { res = 0 }

        return res
    }

}