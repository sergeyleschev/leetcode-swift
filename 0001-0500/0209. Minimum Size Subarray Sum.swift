class Solution {

    // Solution @ Sergey Leschev

    // 209. Minimum Size Subarray Sum
    // Given an array of positive integers nums and a positive integer target, return the minimal length of a contiguous subarray [numsl, numsl+1, ..., numsr-1, numsr] of which the sum is greater than or equal to target. If there is no such subarray, return 0 instead.

    // Finds the minimum length of a contiguous subarray of which the sum is greater than or equal to given target.

    // - Parameters:
    //   - target: The target.
    //   - nums: An array of positive integers.
    // - Returns: The minimum length of a contiguous subarray.

    // Example 1:
    // Input: target = 7, nums = [2,3,1,2,4,3]
    // Output: 2
    // Explanation: The subarray [4,3] has the minimal length under the problem constraint.

    // Example 2:
    // Input: target = 4, nums = [1,4,4]
    // Output: 1

    // Example 3:
    // Input: target = 11, nums = [1,1,1,1,1,1,1,1]
    // Output: 0

    // Constraints:
    // 1 <= target <= 10^9
    // 1 <= nums.length <= 10^5
    // 1 <= nums[i] <= 10^5

    // - Complexity:
    //     - time: O(n), where n is the length of nums.
    //     - space: O(1), only constant space is used.

    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var ans = Int.max
        var sum = 0
        var j = 0
        
        for i in 0..<nums.count {
            sum += nums[i]

            while sum >= target {
                ans = min(ans, i + 1 - j)
                sum -= nums[j]
                j += 1
            }
        }

        return ans == Int.max ? 0 : ans
    }

}