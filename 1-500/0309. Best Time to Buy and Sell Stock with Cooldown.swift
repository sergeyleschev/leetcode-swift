class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 309. Best Time to Buy and Sell Stock with Cooldown
    // You are given an array prices where prices[i] is the price of a given stock on the ith day.
    // Find the maximum profit you can achieve. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times) with the following restrictions:
    // After you sell your stock, you cannot buy stock on the next day (i.e., cooldown one day).
    // Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

    // Finds the maximum profit.

    // - Parameter prices: The prices of a given stock.
    // - Returns: The maximum profit.

    // Example 1:
    // Input: prices = [1,2,3,0,2]
    // Output: 3
    // Explanation: transactions = [buy, sell, cooldown, buy, sell]

    // Example 2:
    // Input: prices = [1]
    // Output: 0

    // Constraints:
    // 1 <= prices.length <= 5000
    // 0 <= prices[i] <= 1000

    // - Complexity:
    //   - time: O(n), where n is the length of the prices.
    //   - space: O(1), only constant space is used.
    
    func maxProfit(_ prices: [Int]) -> Int {
        var sold = 0
        var hold = Int.min
        var rest = 0
        var prevSold = 0
        
        for price in prices {
            prevSold = sold
            sold = hold + price
            hold = max(hold, rest - price)
            rest = max(rest, prevSold)
        }
        
        return max(sold, rest)
    }

}