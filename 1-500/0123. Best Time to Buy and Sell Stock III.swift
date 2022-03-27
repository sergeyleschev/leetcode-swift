class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 123. Best Time to Buy and Sell Stock III
    // You are given an array prices where prices[i] is the price of a given stock on the ith day.
    // Find the maximum profit you can achieve. You may complete at most two transactions.
    // Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

    // Finds the maximum profit.

    // - Parameter prices: An array where the i-th element is the price of a given stock on day i.
    // - Returns: Maximum profit.

    // Example 1:
    // Input: prices = [3,3,5,0,0,3,1,4]
    // Output: 6
    // Explanation: Buy on day 4 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.
    // Then buy on day 7 (price = 1) and sell on day 8 (price = 4), profit = 4-1 = 3.

    // Example 2:
    // Input: prices = [1,2,3,4,5]
    // Output: 4
    // Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
    // Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are engaging multiple transactions at the same time. You must sell before buying again.

    // Example 3:
    // Input: prices = [7,6,4,3,1]
    // Output: 0
    // Explanation: In this case, no transaction is done, i.e. max profit = 0.

    // Example 4:
    // Input: prices = [1]
    // Output: 0

    // Constraints:
    // 1 <= prices.length <= 10^5
    // 0 <= prices[i] <= 10^5

    /// - Complexity:
    ///   - time: O(n), where n is the length of the prices.
    ///   - space: O(1), only constant space is used.

    func maxProfit(_ prices: [Int]) -> Int {
        var buy1 = Int.max
        var buy2 = Int.max
        var sell1 = 0
        var sell2 = 0

        for price in prices {
            buy1 = min(buy1, price)
            sell1 = max(sell1, price - buy1)

            buy2 = min(buy2, price - sell1)
            sell2 = max(sell2, price - buy2)
        }

        return sell2
    }

}