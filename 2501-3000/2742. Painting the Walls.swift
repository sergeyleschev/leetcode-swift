class Solution {

    // Solution by Sergey Leschev
    // 2742. Painting the Walls
    // Time complexity: O(n^2)
    // Space complexity: O(n)

    func paintWalls(_ cost: [Int], _ time: [Int]) -> Int {
        let n = cost.count
        var dp = [Int](repeating: Int(1e9), count: n + 1)
        dp[0] = 0

        for i in 0..<n {
            for j in (1...n).reversed() {
                dp[j] = min(dp[j], dp[max(j - time[i] - 1, 0)] + cost[i])
            }
        }

        return dp[n]
    }
}
