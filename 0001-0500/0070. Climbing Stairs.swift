class Solution {

    // Solution by Sergey Leschev

    // 70. Climbing Stairs
    // You are climbing a staircase. It takes n steps to reach the top.
    // Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

    // Calculates how many different ways we can climb to the top.

    // - Parameter n: The number of steps.
    // - Returns: Number of distinct ways to climb to the top.

    // Example 1:
    // Input: n = 2
    // Output: 2
    // Explanation: There are two ways to climb to the top.
    // 1. 1 step + 1 step
    // 2. 2 steps

    // Example 2:
    // Input: n = 3
    // Output: 3
    // Explanation: There are three ways to climb to the top.
    // 1. 1 step + 1 step + 1 step
    // 2. 1 step + 2 steps
    // 3. 2 steps + 1 step

    // Constraints:
    // 1 <= n <= 45

    // - Complexity:
    //   - time: O(n), where n is the number of steps.
    //   - space: O(1), only constant space is used.

    func climbStairs(_ n: Int) -> Int {
        if n == 0 || n == 1 { return 1 }

        var first = 1
        var second = 1
        var third = 0

        for _ in 2...n {
            third = first + second
            first = second
            second = third
        }

        return second
    }

}
