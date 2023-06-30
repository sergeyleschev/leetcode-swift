class Solution {

    // Solution by Sergey Leschev

    // 441. Arranging Coins
    // You have n coins and you want to build a staircase with these coins. The staircase consists of k rows where the ith row has exactly i coins. The last row of the staircase may be incomplete.
    // Given the integer n, return the number of complete rows of the staircase you will build.

    // Finds the total number of full staircase rows that can be formed from n coins.

    // - Parameter n: The number of coins.
    // - Returns: The number of full staircase.

    // Example 1:
    // Input: n = 5
    // Output: 2
    // Explanation: Because the 3rd row is incomplete, we return 2.

    // Example 2:
    // Input: n = 8
    // Output: 3
    // Explanation: Because the 4th row is incomplete, we return 3.

    // Constraints:
    // 1 <= n <= 2^31 - 1

    // - Complexity:
    //   - time: O(1), only constant time is used.
    //   - space: O(1), only constant space is used.
    
    func arrangeCoins(_ n: Int) -> Int {
        return Int(sqrt(2.0 * Double(n) + 0.25) - 0.5)
    }

}