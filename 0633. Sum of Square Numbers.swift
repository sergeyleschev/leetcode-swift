class Solution {

    // 633. Sum of Square Numbers
    // Given a non-negative integer c, decide whether there're two integers a and b such that a2 + b2 = c.

    // Example 1:
    // Input: c = 5
    // Output: true
    // Explanation: 1 * 1 + 2 * 2 = 5

    // Example 2:
    // Input: c = 3
    // Output: false

    // Example 3:
    // Input: c = 4
    // Output: true

    // Example 4:
    // Input: c = 2
    // Output: true

    // Example 5:
    // Input: c = 1
    // Output: true

    // Constraints:
    // 0 <= c <= 2^31 - 1

    func judgeSquareSum(_ c: Int) -> Bool {
        let value = sqrt(Double(c))
        
        if Double(Int(value)) == value { return true } 
        else {
            for num in 0..<Int(ceil(value)) {
                let square = sqrt(Double(c - num * num))
                if Double(Int(square)) == square { return true }
            }
            return false
        }
        
    }

}