class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 518. Coin Change 2
    // You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.
    // Return the number of combinations that make up that amount. If that amount of money cannot be made up by any combination of the coins, return 0.
    // You may assume that you have an infinite number of each kind of coin.
    // The answer is guaranteed to fit into a signed 32-bit integer.

    // Finds the number of combinations that make up coins to the amount.

    // - Parameters:
    //   - amount: The total amount of money.
    //   - coins: The coins.
    // - Returns: The number of combinations.

    // Example 1:
    // Input: amount = 5, coins = [1,2,5]
    // Output: 4
    // Explanation: there are four ways to make up the amount:
    // 5=5
    // 5=2+2+1
    // 5=2+1+1+1
    // 5=1+1+1+1+1

    // Example 2:
    // Input: amount = 3, coins = [2]
    // Output: 0
    // Explanation: the amount of 3 cannot be made up just with coins of 2.

    // Example 3:
    // Input: amount = 10, coins = [10]
    // Output: 1

    // Constraints:
    // 1 <= coins.length <= 300
    // 1 <= coins[i] <= 5000
    // All the values of coins are unique.
    // 0 <= amount <= 5000

    // - Complexity:
    //   - time: O(n * m), where n is the number of coins, and m is the given amount.
    //   - space: O(m), where m is the given amount.
    
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        guard amount > 0 else { return 1 }
                
        var ans = [Int](repeating: 0, count: amount+1)
        ans[0] = 1
        
        for coin in coins  {
            guard coin <= amount else { continue }
            for i in coin...amount {
                ans[i] += ans[i - coin]
            }
        }
        
        return ans[amount]
    }

}