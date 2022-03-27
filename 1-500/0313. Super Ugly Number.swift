class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 313. Super Ugly Number
    // A super ugly number is a positive integer whose prime factors are in the array primes.
    // Given an integer n and an array of integers primes, return the nth super ugly number.
    // The nth super ugly number is guaranteed to fit in a 32-bit signed integer.

    // Example 1:
    // Input: n = 12, primes = [2,7,13,19]
    // Output: 32
    // Explanation: [1,2,4,7,8,13,14,16,19,26,28,32] is the sequence of the first 12 super ugly numbers given primes = [2,7,13,19].

    // Example 2:
    // Input: n = 1, primes = [2,3,5]
    // Output: 1
    // Explanation: 1 has no prime factors, therefore all of its prime factors are in the array primes = [2,3,5].

    // Constraints:
    // 1 <= n <= 106
    // 1 <= primes.length <= 100
    // 2 <= primes[i] <= 1000
    // primes[i] is guaranteed to be a prime number.
    // All the values of primes are unique and sorted in ascending order.

    func nthSuperUglyNumber(_ n: Int, _ primes: [Int]) -> Int {
        var uglyNums = Array(repeating: Int.max, count: n)
        var indexs = Array(repeating: 0, count: primes.count)
        uglyNums[0] = 1
        
        for i in 0..<n {
            for j in 0..<primes.count {
                uglyNums[i] = min(uglyNums[i], primes[j] * uglyNums[indexs[j]])
            }

            for j in 0..<primes.count {
                while primes[j] * uglyNums[indexs[j]] <= uglyNums[i] { indexs[j] += 1}
            }
        }
        
        return uglyNums.last!
    }

}