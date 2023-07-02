class Solution {

    // Solution by Sergey Leschev

    // 1262. Greatest Sum Divisible by Three
    // Given an array nums of integers, we need to find the maximum possible sum of elements of the array such that it is divisible by three.

    // Example 1:
    // Input: nums = [3,6,5,1,8]
    // Output: 18
    // Explanation: Pick numbers 3, 6, 1 and 8 their sum is 18 (maximum sum divisible by 3).

    // Example 2:
    // Input: nums = [4]
    // Output: 0
    // Explanation: Since 4 is not divisible by 3, do not pick any number.

    // Example 3:
    // Input: nums = [1,2,3,4,4]
    // Output: 12
    // Explanation: Pick numbers 1, 3, 4 and 4 their sum is 12 (maximum sum divisible by 3).

    // Constraints:
    // 1 <= nums.length <= 4 * 10^4
    // 1 <= nums[i] <= 10^4

    func maxSumDivThree(_ nums: [Int]) -> Int {
        let n = nums.count
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 3), count: n + 1)

        for i in 1...n {
            for j in 0..<3 {
                dp[i][j] = dp[i - 1][j]
                let t = (j - nums[i - 1] % 3 + 3) % 3
                if dp[i - 1][t] != 0 || nums[i - 1] % 3 == j {
                    dp[i][j] = max(dp[i][j], dp[i - 1][t] + nums[i - 1])
                }
            }
        }

        return dp[n][0]
    }

}
