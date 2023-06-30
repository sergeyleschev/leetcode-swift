class Solution {

    // Solution by Sergey Leschev

    // 416. Partition Equal Subset Sum
    // Given a non-empty array nums containing only positive integers, find if the array can be partitioned into two subsets such that the sum of elements in both subsets is equal.

    // Finds if the array can be partitioned into two subsets such that the sum of elements in both subsets is equal.

    // - Parameter nums: An array containing only positive integers.
    // - Returns: True if the array can be partitioned, otherwise returns false.

    // Example 1:
    // Input: nums = [1,5,11,5]
    // Output: true
    // Explanation: The array can be partitioned as [1, 5, 5] and [11].

    // Example 2:
    // Input: nums = [1,2,3,5]
    // Output: false
    // Explanation: The array cannot be partitioned into equal sum subsets.

    // Constraints:
    // 1 <= nums.length <= 200
    // 1 <= nums[i] <= 100

    // - Complexity:
    //   - time: O(m * n), where m is the target, and n is the length of nums.
    //   - space: O(m), where m is the target.
    
    func canPartition(_ nums: [Int]) -> Bool {
        guard !nums.isEmpty else { return false }
        var totalSum = nums.reduce(0, +)
        guard totalSum % 2 == 0 else { return false }
        let target = totalSum / 2
        var dp = [Bool](repeating: false, count: target + 1)
        dp[0] = true

        for num in nums {
            for j in stride(from: target, through: num, by: -1) {
                dp[j] = dp[j] || dp[j - num]
            }
        }

        return dp[target]
    }

}