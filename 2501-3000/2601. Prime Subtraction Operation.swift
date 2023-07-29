class Solution {

    // Solution by Sergey Leschev
    // 2601. Prime Subtraction Operation
    // Time complexity: O(n*m)
    // Space complexity: O(n)

    func primeSubOperation(_ nums: [Int]) -> Bool {
        func isPrime(_ num: Int) -> Bool {
            if num <= 1 {
                return false
            }
            for i in 2..<num {
                if num % i == 0 {
                    return false
                }
            }
            return true
        }

        let n = nums.count
        var isPrime = [Bool](repeating: true, count: 1005)

        // Sieve Algorithm to find primes up to 1000
        isPrime[0] = false
        isPrime[1] = false
        for i in 2..<1005 {
            for j in stride(from: 2 * i, to: 1005, by: i) {
                isPrime[j] = false
            }
        }

        var prime = [Int]()
        for i in 0..<1005 {
            if isPrime[i] {
                prime.append(i)
            }
        }

        var flg = 0
        var prev = nums[n - 1]
        for i in stride(from: n - 2, through: 0, by: -1) {
            if nums[i] < prev {
                prev = nums[i]
                continue
            }
            flg = 1
            for sub in prime {
                if sub < nums[i] && nums[i] - sub < prev {
                    prev = nums[i] - sub
                    flg = 0
                    break
                }
            }
            if flg == 1 {
                break
            }
        }
        return flg == 0
    }
}
