class Solution {

    // Solution @ Sergey Leschev
    
    // 494. Target Sum
    // You are given an integer array nums and an integer target.
    // You want to build an expression out of nums by adding one of the symbols '+' and '-' before each integer in nums and then concatenate all the integers.
    // For example, if nums = [2, 1], you can add a '+' before 2 and a '-' before 1 and concatenate them to build the expression "+2-1".
    // Return the number of different expressions that you can build, which evaluates to target.

    // Example 1:
    // Input: nums = [1,1,1,1,1], target = 3
    // Output: 5
    // Explanation: There are 5 ways to assign symbols to make the sum of nums be target 3.
    // -1 + 1 + 1 + 1 + 1 = 3
    // +1 - 1 + 1 + 1 + 1 = 3
    // +1 + 1 - 1 + 1 + 1 = 3
    // +1 + 1 + 1 - 1 + 1 = 3
    // +1 + 1 + 1 + 1 - 1 = 3

    // Example 2:
    // Input: nums = [1], target = 1
    // Output: 1

    // Constraints:
    // 1 <= nums.length <= 20
    // 0 <= nums[i] <= 1000
    // 0 <= sum(nums[i]) <= 1000
    // -1000 <= target <= 1000

    // dp[i][j] = dp[i - 1][j - nums[i]] + dp[i - 1][j + nums[i]]

    func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
        let sum = nums.reduce(0, +)
        if S > sum || S < -sum { return 0 }
        var dp = Array(repeating: Array(repeating: 0, count: sum * 2 + 1), count: nums.count)
        let offset = sum

        dp[0][nums[0] + offset] = 1
        dp[0][ -nums[0] + offset] += 1 // here use '+=' instead of '=' in case of nums[0] == 0
        
        for i in stride(from: 1, to: nums.count, by: 1) {
            for j in -sum...sum {
                if j + nums[i] <= sum {
                    dp[i][j + offset] += dp[i - 1][j + nums[i] + offset]
                }

                if j - nums[i] >= -sum {
                    dp[i][j + offset] += dp[i - 1][j - nums[i] + offset]
                }
            }
        }
        
        return dp[nums.count - 1][S + offset]
    }

}