class Solution {

    // Solution by Sergey Leschev
    // 2915. Length of the Longest Subsequence That Sums to Target

    var dp: [[Int]] = []

    func solve(_ nums: [Int], _ i: Int, _ target: Int) -> Int {
        if target == 0 {
            return 0
        }
        if target < 0 || i >= nums.count {
            return -1001
        }
        if dp[i][target] != -1 {
            return dp[i][target]
        }
        let take = 1 + solve(nums, i + 1, target - nums[i])
        let notTake = solve(nums, i + 1, target)
        dp[i][target] = max(take, notTake)
        return dp[i][target]
    }

    func lengthOfLongestSubsequence(_ nums: [Int], _ target: Int) -> Int {
        dp = Array(repeating: Array(repeating: -1, count: 1001), count: 1001)
        let ans = solve(nums, 0, target)
        return (ans > 0) ? ans : -1
    }
}
