class Solution {

    // Solution by Sergey Leschev
    // 2572. Count the Number of Square-Free Subsets

    // Time complexity:O(n * {2^{10}})
    // Space complexity: O(n * {2^{10}})

    let mod = 1_000_000_007
    let primes: [Int] = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]

    func squareFreeSubsets(_ nums: [Int]) -> Int {
        var memo = Array(repeating: Array(repeating: -1, count: 1 << 10), count: nums.count)

        func dp(_ i: Int, _ mask: Int) -> Int {
            if i == nums.count { return 1 }
            if memo[i][mask] != -1 { return memo[i][mask] }

            var temp = mask
            var flag = 1

            for j in 0..<10 {
                var num = nums[i]  // Make a mutable copy here
                var count = 0

                while num % primes[j] == 0 {
                    num /= primes[j]
                    count += 1
                }

                if count >= 2 || (count == 1 && ((mask >> j) & 1) == 1) {
                    flag = 0
                    break
                }

                if count != 0 {
                    temp = temp | (1 << j)
                }
            }

            if flag == 1 {
                memo[i][mask] = (dp(i + 1, mask) + dp(i + 1, temp)) % mod
            } else {
                memo[i][mask] = dp(i + 1, mask)
            }

            return memo[i][mask]
        }

        return (dp(0, 0) - 1 + mod) % mod
    }
}
