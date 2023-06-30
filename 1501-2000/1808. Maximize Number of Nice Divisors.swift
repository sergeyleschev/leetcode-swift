class Solution {

    // Solution by Sergey Leschev

    // 1808. Maximize Number of Nice Divisors
    // You are given a positive integer primeFactors. You are asked to construct a positive integer n that satisfies the following conditions:
    // The number of prime factors of n (not necessarily distinct) is at most primeFactors.
    // The number of nice divisors of n is maximized. Note that a divisor of n is nice if it is divisible by every prime factor of n. For example, if n = 12, then its prime factors are [2,2,3], then 6 and 12 are nice divisors, while 3 and 4 are not.
    // Return the number of nice divisors of n. Since that number can be too large, return it modulo 109 + 7.
    // Note that a prime number is a natural number greater than 1 that is not a product of two smaller natural numbers. The prime factors of a number n is a list of prime numbers such that their product equals n.

    // Example 1:
    // Input: primeFactors = 5
    // Output: 6
    // Explanation: 200 is a valid value of n.
    // It has 5 prime factors: [2,2,2,5,5], and it has 6 nice divisors: [10,20,40,50,100,200].
    // There is not other value of n that has at most 5 prime factors and more nice divisors.

    // Example 2:
    // Input: primeFactors = 8
    // Output: 18

    // Constraints:
    // 1 <= primeFactors <= 10^9

    // Solution: Math. Fast exponentiation algorithm.

    // - Complexity:
    //   - time: O(logn)
    //   - space: O(1)

    func maxNiceDivisors(_ primeFactors: Int) -> Int {
        if primeFactors < 3 { return primeFactors }
        let mod = Int(1e9 + 7)
        let a = primeFactors / 3
        let b = primeFactors % 3

        if b == 0 { return helpPow(3, a, mod) }
        else if b == 1 { return helpPow(3, a - 1, mod) * 4 % mod } 
        else if b == 2 { return helpPow(3, a, mod) * 2 % mod }
        return 0
    }


    private func helpPow(_ a: Int, _ power: Int, _ mod: Int) -> Int {
        var res = 1
        var a = a
        var power = power
        
        while power != 0 {
            // power % 2 == 1
            if power & 1 == 1 { res = res * a % mod }
            // power/2
            power >>= 1
            a = (a * a) % mod
        }
        return res
    }

}