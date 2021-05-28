class Solution {

    // 357. Count Numbers with Unique Digits
    // Given an integer n, return the count of all numbers with unique digits, x, where 0 <= x < 10n.

    // Example 1:
    // Input: n = 2
    // Output: 91
    // Explanation: The answer should be the total numbers in the range of 0 ≤ x < 100, excluding 11,22,33,44,55,66,77,88,99

    // Example 2:
    // Input: n = 0
    // Output: 1

    // Constraints:
    // 0 <= n <= 8

    func countNumbersWithUniqueDigits(_ n: Int) -> Int {
        var result = 0
        
        if n == 1 { return 10 } 
        else if n == 0 { return 1 }
        
        for i in 2...n {
            var temp = 1
            for j in 2...i { temp *= 9 - j + 2 }
            result += temp * 9
        }
        
        return result + 10
    }
    
}