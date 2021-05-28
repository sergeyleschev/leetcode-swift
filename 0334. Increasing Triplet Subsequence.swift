class Solution {

    // 334. Increasing Triplet Subsequence
    // Given an integer array nums, return true if there exists a triple of indices (i, j, k) such that i < j < k and nums[i] < nums[j] < nums[k]. If no such indices exists, return false.

    // Finds if there exists a triple of indices (i, j, k) such that i < j < k
    // and nums[i] < nums[j] < nums[k]

    // - Parameter nums: An integer array.
    // - Returns: True if indices exist, otherwise returns false.

    // Example 1:
    // Input: nums = [1,2,3,4,5]
    // Output: true
    // Explanation: Any triplet where i < j < k is valid.

    // Example 2:
    // Input: nums = [5,4,3,2,1]
    // Output: false
    // Explanation: No triplet exists.

    // Example 3:
    // Input: nums = [2,1,5,0,4,6]
    // Output: true
    // Explanation: The triplet (3, 4, 5) is valid because nums[3] == 0 < nums[4] == 4 < nums[5] == 6.

    // Constraints:
    // 1 <= nums.length <= 5 * 10^5
    // -2^31 <= nums[i] <= 2^31 - 1

    // Follow up: Could you implement a solution that runs in O(n) time complexity and O(1) space complexity?

    // - Complexity:
    //   - time: O(n), where n is the length of the nums.
    //   - space: O(1), only constant space is used.

    func increasingTriplet(_ nums: [Int]) -> Bool {
        var first = Int.max
        var second = Int.max
        
        for num in nums {
            if num <= first {
                first = num
            } else if num <= second {
                second = num
            } else {
                return true
            }
        }
        
        return false
    }

}