class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 188. Best Time to Buy and Sell Stock IV
    // You are given an integer array prices where prices[i] is the price of a given stock on the ith day, and an integer k.
    // Find the maximum profit you can achieve. You may complete at most k transactions.
    // Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

    // Finds the maximum profit.

    // - Parameters:
    //   - k: The number of transactions that can be completed.
    //   - prices: An array where the i-th element is the price of a given stock on day i.
    // - Returns: Maximum profit.

    // Example 1:
    // Input: k = 2, prices = [2,4,1]
    // Output: 2
    // Explanation: Buy on day 1 (price = 2) and sell on day 2 (price = 4), profit = 4-2 = 2.

    // Example 2:
    // Input: k = 2, prices = [3,2,6,5,0,3]
    // Output: 7
    // Explanation: Buy on day 2 (price = 2) and sell on day 3 (price = 6), profit = 6-2 = 4. Then buy on day 5 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.

    // Constraints:
    // 0 <= k <= 100
    // 0 <= prices.length <= 1000
    // 0 <= prices[i] <= 1000

    // - Complexity:
    //   - time: O(nk), where n is the number of prices, and k is the number of transactions.
    //   - space: O(nk), where n is the number of prices, and k is the number of transactions.

    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        guard !prices.isEmpty, k > 0 else { return 0 }

        let count = prices.count
        guard k < count / 2 else { return maxProfit(prices) }

        var ans = [[Int]](repeating: [Int](repeating: 0, count: count), count: k+1)

        for i in 1...k {
            var tmpMax = -prices[0]
            for j in 1..<count {
                ans[i][j] = max(ans[i][j-1], prices[j] + tmpMax)
                tmpMax = max(tmpMax, ans[i-1][j-1] - prices[j])
            }
        }

        return ans[k][count-1]
    }


    private func maxProfit(_ prices: [Int]) -> Int {
        var ans = 0

        for i in 1..<prices.count {
            guard prices[i] > prices[i-1] else { continue }
            ans += prices[i] - prices[i-1]
        }

        return ans
    }

}