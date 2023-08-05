class Solution {

    // Solution by Sergey Leschev
    // 2521. Distinct Prime Factors of Product of Array

    func distinctPrimeFactors(_ nums: [Int]) -> Int {
        let maxNum = nums.max() ?? 0
        var primes = Set<Int>()

        // Function to check if a number is prime
        func isPrime(_ n: Int) -> Bool {
            if n < 2 { return false }
            for i in 2..<n {
                if n % i == 0 {
                    return false
                }
            }
            return true
        }

        // Find prime factors of numbers from 2 to maxNum
        for i in 2...maxNum {
            if isPrime(i) {
                for n in nums {
                    if n % i == 0 {
                        primes.insert(i)
                        break
                    }
                }
            }
        }

        return primes.count
    }
}
