class Solution {

    // Solution @ Sergey Leschev
    // 956. Tallest Billboard

    func tallestBillboard(_ rods: [Int]) -> Int {
        var dp = [0: 0]
        
        for i in rods {
            var cur = [Int: Int]()
            for (sum, height) in dp {
                cur[sum + i] = max(dp[sum]! + i, cur[sum + i, default: 0])
                cur[sum] = max(dp[sum]!, cur[sum, default: 0])
                cur[sum - i] = max(dp[sum]!, cur[sum - i, default: 0])
            }
            dp = cur
        }
        
        return dp[0, default: 0]
    }
}
