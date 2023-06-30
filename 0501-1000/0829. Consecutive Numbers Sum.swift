class Solution {

    // Solution by Sergey Leschev

    // 829. Consecutive Numbers Sum
    // Given a positive integer n, how many ways can we write it as a sum of consecutive positive integers?

    // Example 1:
    // Input: n = 5
    // Output: 2
    // Explanation: 5 = 5 = 2 + 3

    // Example 2:
    // Input: n = 9
    // Output: 3
    // Explanation: 9 = 9 = 4 + 5 = 2 + 3 + 4

    // Example 3:
    // Input: n = 15
    // Output: 4
    // Explanation: 15 = 15 = 8 + 7 = 4 + 5 + 6 = 1 + 2 + 3 + 4 + 5
    // Note: 1 <= n <= 10 ^ 9.

    func consecutiveNumbersSum(_ N: Int) -> Int {
        var ans = 0
        var c = 0
        
        while true {
            c += 1
            if N / c < c / 2 + c % 2 { break }
            if c % 2 == 1 && N % c == 0 {
                ans += 1
            } else if c % 2 == 0 && (N / c) * c + c / 2 == N {
                ans += 1
            }
        }
        
        return ans
    }
    
}