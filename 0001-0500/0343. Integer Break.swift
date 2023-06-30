class Solution {

    // Solution by Sergey Leschev

    // 343. Integer Break
    // Given an integer n, break it into the sum of k positive integers, where k >= 2, and maximize the product of those integers.
    // Return the maximum product you can get.

    // Example 1:
    // Input: n = 2
    // Output: 1
    // Explanation: 2 = 1 + 1, 1 × 1 = 1.

    // Example 2:
    // Input: n = 10
    // Output: 36
    // Explanation: 10 = 3 + 3 + 4, 3 × 3 × 4 = 36.

    // Constraints:
    // 2 <= n <= 58

    func integerBreak(_ n: Int) -> Int {
        if n == 2 { return 1 }
        if n == 3 { return 2 }
        
        var num = n
        var res = 1
        
        while num > 4 {
            res *= 3
            num -= 3
        }
        
        return num > 0 ? res * num : res
    }
    
}