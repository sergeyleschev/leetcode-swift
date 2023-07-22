class Solution {

    // Solution by Sergey Leschev
    // 2761. Prime Pairs With Target Sum

    func sieveOfEratosthenes(_ n: Int) -> [Bool] {
        var isPrime = [Bool](repeating: true, count: n + 1)
        isPrime[0] = false
        isPrime[1] = false

        var i = 2
        while i * i <= n {
            if isPrime[i] {
                var j = i * i
                while j <= n {
                    isPrime[j] = false
                    j += i
                }
            }
            i += 1
        }

        return isPrime
    }

    func findPrimePairs(_ n: Int) -> [[Int]] {
        var ans = [[Int]]()
        if n == 1 {
            return ans
        }

        let primes = sieveOfEratosthenes(n)

        for i in 1...(n / 2) {
            if primes[i] && primes[n - i] {
                ans.append([i, n - i])
            }
        }

        return ans
    }
}
