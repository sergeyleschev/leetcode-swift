class Solution {

    // 371. Sum of Two Integers
    // Given two integers a and b, return the sum of the two integers without using the operators + and -.

    // Example 1:
    // Input: a = 1, b = 2
    // Output: 3

    // Example 2:
    // Input: a = 2, b = 3
    // Output: 5

    // Constraints:
    // -1000 <= a, b <= 1000

    func getSum(_ a: Int, _ b: Int) -> Int {
        var c = a
        var d = b
        
        while d != 0 {
            let sum  = c ^ d
            let carry = (c & d) << 1
            c = sum
            d = carry
        }
        
        return c
    }
    
}