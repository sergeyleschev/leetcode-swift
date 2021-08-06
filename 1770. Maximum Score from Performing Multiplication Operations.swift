class Solution {

    // 1770. Maximum Score from Performing Multiplication Operations
    // You are given two integer arrays nums and multipliers of size n and m respectively, where n >= m. The arrays are 1-indexed.
    // You begin with a score of 0. You want to perform exactly m operations. On the ith operation (1-indexed), you will:
    // Choose one integer x from either the start or the end of the array nums.
    // Add multipliers[i] * x to your score.
    // Remove x from the array nums.
    // Return the maximum score after performing m operations.

    // Example 1:
    // Input: nums = [1,2,3], multipliers = [3,2,1]
    // Output: 14
    // Explanation: An optimal solution is as follows:
    // - Choose from the end, [1,2,3], adding 3 * 3 = 9 to the score.
    // - Choose from the end, [1,2], adding 2 * 2 = 4 to the score.
    // - Choose from the end, [1], adding 1 * 1 = 1 to the score.
    // The total score is 9 + 4 + 1 = 14.

    // Example 2:
    // Input: nums = [-5,-3,-3,-2,7,1], multipliers = [-10,-5,3,4,6]
    // Output: 102
    // Explanation: An optimal solution is as follows:
    // - Choose from the start, [-5,-3,-3,-2,7,1], adding -5 * -10 = 50 to the score.
    // - Choose from the start, [-3,-3,-2,7,1], adding -3 * -5 = 15 to the score.
    // - Choose from the start, [-3,-2,7,1], adding -3 * 3 = -9 to the score.
    // - Choose from the end, [-2,7,1], adding 1 * 4 = 4 to the score.
    // - Choose from the end, [-2,7], adding 7 * 6 = 42 to the score. 
    // The total score is 50 + 15 - 9 + 4 + 42 = 102.

    // Constraints:
    // n == nums.length
    // m == multipliers.length
    // 1 <= m <= 10^3
    // m <= n <= 10^5
    // -1000 <= nums[i], multipliers[i] <= 1000

    func maximumScore(_ nums: [Int], _ multipliers: [Int]) -> Int {
        let m = nums.count
        let n = multipliers.count
        var memo = [[Int?]](repeating: [Int?](repeating: nil, count: n + 1), count: n + 1)


        func dfs(_ l: Int, _ r: Int, _ i: Int) -> Int {
            guard i < n else { return 0 }
            if let score = memo[i][l] { return score }
            memo[i][l] = max(nums[l] * multipliers[i] + dfs(l + 1, r, i + 1), nums[r] * multipliers[i] + dfs(l, r - 1, i + 1))
            return memo[i][l] ?? 0
        }
        return dfs(0, m - 1, 0)
    }

}