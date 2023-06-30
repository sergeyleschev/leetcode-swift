class Solution {

    // Solution by Sergey Leschev
    // 2518. Number of Great Partitions

    func countPartitions(_ nums: [Int], _ k: Int) -> Int {
        let mod = 1000000007
        var total = 0
        var res = 1
        var dp = [Int](repeating: 0, count: k)
        dp[0] = 1
        
        for a in nums {
            for i in stride(from: k - 1 - a, through: 0, by: -1) {
                dp[i + a] = (dp[i + a] + dp[i]) % mod
            }
            
            res = (res * 2) % mod
            total += a
        }
        
        for i in 0..<k {
            if total - i < k {
                res -= dp[i]
            } else {
                res -= (dp[i] * 2) % mod
            }
        }
        
        return (res % mod + mod) % mod
    }
}
