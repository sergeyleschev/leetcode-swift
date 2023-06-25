class Solution {

    // Solution @ Sergey Leschev

    // 714. Best Time to Buy and Sell Stock with Transaction Fee
    // You are given an array prices where prices[i] is the price of a given stock on the ith day, and an integer fee representing a transaction fee.
    // Find the maximum profit you can achieve. You may complete as many transactions as you like, but you need to pay the transaction fee for each transaction.
    // Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

    // Finds the maximum profit you can achieve.

    // - Parameters:
    //   - prices: An array of prices.
    //   - fee: A transaction fee.
    // - Returns: The maximum profit.

    // Example 1:
    // Input: prices = [1,3,2,8,4,9], fee = 2
    // Output: 8
    // Explanation: The maximum profit can be achieved by:
    // - Buying at prices[0] = 1
    // - Selling at prices[3] = 8
    // - Buying at prices[4] = 4
    // - Selling at prices[5] = 9
    // The total profit is ((8 - 1) - 2) + ((9 - 4) - 2) = 8.

    // Example 2:
    // Input: prices = [1,3,7,5,10,3], fee = 3
    // Output: 6

    // Constraints:
    // 1 <= prices.length <= 5 * 10^4
    // 1 <= prices[i] < 5 * 10^4
    // 0 <= fee < 5 * 10^4

    // - Complexity:
    //   - time: O(n), where n is the length of prices.
    //   - space: O(1), only constant space is used.
    
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        var ans = 0
        var hold = -prices[0]
        
        for i in 1..<prices.count {
            ans = max(ans, hold + prices[i] - fee)
            hold = max(hold, ans - prices[i])
        }
        
        return ans
    }

}