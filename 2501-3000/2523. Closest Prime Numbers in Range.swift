class Solution {

    // Solution by Sergey Leschev
    // 2523. Closest Prime Numbers in Range

    func closestPrimes(_ left: Int, _ right: Int) -> [Int] {
        // Function to generate primes using Sieve of Eratosthenes algorithm
        func sieveOfEratosthenes(_ n: Int) -> [Bool] {
            var sieve = [Bool](repeating: true, count: n + 1)
            sieve[0] = false
            sieve[1] = false
            var p = 2
            while p * p <= n {
                if sieve[p] {
                    for i in stride(from: p * p, through: n, by: p) {
                        sieve[i] = false
                    }
                }
                p += 1
            }
            return sieve
        }

        // Find primes between left and right
        let sieve = sieveOfEratosthenes(right)
        var primes = [Int]()
        for num in left...right {
            if sieve[num] {
                primes.append(num)
            }
        }

        // Find the closest pair
        var n1 = -1
        var n2 = -1
        var i = 0
        while i + 1 < primes.count {
            if primes[i + 1] - primes[i] < n2 - n1 || n1 == -1 {
                n1 = primes[i]
                n2 = primes[i + 1]
                if n2 - n1 < 3 {
                    break
                }
            }
            i += 1
        }

        return n1 != -1 ? [n1, n2] : [-1, -1]
    }
}
