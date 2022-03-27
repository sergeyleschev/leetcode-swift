class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 400. Nth Digit
    // Given an integer n, return the nth digit of the infinite integer sequence [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, ...].

    // Example 1:
    // Input: n = 3
    // Output: 3

    // Example 2:
    // Input: n = 11
    // Output: 0
    // Explanation: The 11th digit of the sequence 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, ... is a 0, which is part of the number 10.

    // Constraints:
    // 1 <= n <= 2^31 - 1

    func findNthDigit(_ n: Int) -> Int {
        guard n >= 10 else { return n }
        
        var i = 2
        var digit = 10
        var num = 9
        
        while n > num{
            num += 9 * digit * i
            if n < num { break }
            digit = digit * 10
            i += 1
        }
        
        num = n - num + 9 * digit * i
        let index = (num - 1) % i
        let res = "\(digit + (num - 1) / i)"
        
        return Int(String(res[res.index(res.startIndex, offsetBy: index)]))!
    }
    
}