class Solution {

    // Solution by Sergey Leschev
    // 2944. Minimum Number of Coins for Fruits

    // Time Complexity: O(n)
    // Space Complexity: O(n)

    func minimumCoins(_ prices: [Int]) -> Int {
        let n = prices.count
        var dp = [Int](repeating: 0, count: n + 1)
        var q = [Int]()  // Using an array as a deque

        for i in 0..<n {
            while !q.isEmpty && (q.first! + 1) * 2 < i + 1 {
                q.removeFirst()
            }

            while !q.isEmpty && dp[q.last!] + prices[q.last!] >= dp[i] + prices[i] {
                q.removeLast()
            }

            q.append(i)
            dp[i + 1] = dp[q.first!] + prices[q.first!]
        }

        return dp[n]
    }
}
