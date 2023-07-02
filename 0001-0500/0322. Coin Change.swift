class Solution {

    // Solution by Sergey Leschev

    // 322. Coin Change
    // You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.
    // Return the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.
    // You may assume that you have an infinite number of each kind of coin.

    // Finds the fewest number of coins that you need to make up to the amount.

    // - Parameters:
    //   - coins: The coins.
    //   - amount: The total amount of money.
    // - Returns: The fewest number of coins, if the amount of money cannot be made up returns -1.

    // Example 1:
    // Input: coins = [1,2,5], amount = 11
    // Output: 3
    // Explanation: 11 = 5 + 5 + 1

    // Example 2:
    // Input: coins = [2], amount = 3
    // Output: -1

    // Example 3:
    // Input: coins = [1], amount = 0
    // Output: 0

    // Example 4:
    // Input: coins = [1], amount = 1
    // Output: 1

    // Example 5:
    // Input: coins = [1], amount = 2
    // Output: 2

    // Constraints:
    // 1 <= coins.length <= 12
    // 1 <= coins[i] <= 2^31 - 1
    // 0 <= amount <= 10^4

    // - Complexity:
    //   - time: O(s * n), where s is the amount, and n is the length of coins.
    //   - space: O(s), where s is the amount.

    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else { return 0 }
        var dp = [Int](repeating: amount + 1, count: amount + 1)
        dp[0] = 0

        for i in 1...amount {
            for coin in coins {
                guard coin <= i else { continue }
                dp[i] = min(dp[i], dp[i - coin] + 1)
            }
        }

        return dp[amount] > amount ? -1 : dp[amount]
    }

}
