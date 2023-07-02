class Solution {

    // Solution by Sergey Leschev

    func waysToReachTarget(_ target: Int, _ types: [[Int]]) -> Int {
        let mod = 1_000_000_007
        var dp = Array(repeating: 0, count: target + 1)
        dp[0] = 1

        for type in types {
            let count = type[0]
            let marks = type[1]
            for j in stride(from: target, through: marks, by: -1) {
                for k in stride(from: 1, through: count, by: 1) {
                    if j - k * marks >= 0 {
                        dp[j] = (dp[j] + dp[j - k * marks]) % mod
                    }
                }
            }
        }

        return dp[target]
    }
}
