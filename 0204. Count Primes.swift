class Solution {

    // 204. Count Primes
    // Count the number of prime numbers less than a non-negative number, n.

    // Example 1:
    // Input: n = 10
    // Output: 4
    // Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.

    // Example 2:
    // Input: n = 0
    // Output: 0

    // Example 3:
    // Input: n = 1
    // Output: 0

    // Constraints:
    // 0 <= n <= 5 * 10^6

    func countPrimes(_ n: Int) -> Int {
        guard n > 1 else { return 0 }

        var result = 0
        var primes = [Bool](repeating: true, count: n)
        
        for i in 2 ..< n {
            if primes[i] {
                result += 1

                var j = 2;
                while i * j < n {
                    primes[i * j] = false
                    j += 1
                }

            }
        }

        return result
    }
    
}