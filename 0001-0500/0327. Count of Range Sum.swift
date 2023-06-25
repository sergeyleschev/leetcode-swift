class Solution {

    // Solution @ Sergey Leschev

    // 327. Count of Range Sum
    // Given an integer array nums and two integers lower and upper, return the number of range sums that lie in [lower, upper] inclusive.
    // Range sum S(i, j) is defined as the sum of the elements in nums between indices i and j inclusive, where i <= j.

    // Example 1:
    // Input: nums = [-2,5,-1], lower = -2, upper = 2
    // Output: 3
    // Explanation: The three ranges are: [0,0], [2,2], and [0,2] and their respective sums are: -2, -1, 2.

    // Example 2:
    // Input: nums = [0], lower = 0, upper = 0
    // Output: 1

    // Constraints:
    // 1 <= nums.length <= 10^5
    // -2^31 <= nums[i] <= 2^31 - 1
    // -10^5 <= lower <= upper <= 10^5
    // The answer is guaranteed to fit in a 32-bit integer.

    func countRangeSum(_ nums: [Int], _ lower: Int, _ upper: Int) -> Int {
        guard nums.count > 0 else { return 0 }
        let n = nums.count
        var ans = 0
        var dp = Array.init(repeating: 0, count: n)
        
        for i in 0..<n {
            for j in i..<n {
                if i == j {
                    dp[i] = nums[i]
                } else {
                    dp[i] = dp[i] + nums[j]
                }
                if dp[i] >= lower, dp[i] <= upper {
                    ans += 1
                }
            }
        }
        
        return ans
    }

}