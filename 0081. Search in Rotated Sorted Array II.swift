class Solution {

    // 81. Search in Rotated Sorted Array II
    // There is an integer array nums sorted in non-decreasing order (not necessarily with distinct values).
    // Before being passed to your function, nums is rotated at an unknown pivot index k (0 <= k < nums.length) such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). For example, [0,1,2,4,4,4,5,6,6,7] might be rotated at pivot index 5 and become [4,5,6,6,7,0,1,2,4,4].
    // Given the array nums after the rotation and an integer target, return true if target is in nums, or false if it is not in nums.

    // Searches for target in an array.

    // - Parameters:
    //   - nums: The array sorted in ascending order rotated at some pivot.
    //   - target: The target value.
    // - Returns: True if the target exists, otherwise returns false.

    // Example 1:
    // Input: nums = [2,5,6,0,0,1,2], target = 0
    // Output: true

    // Example 2:
    // Input: nums = [2,5,6,0,0,1,2], target = 3
    // Output: false

    // Constraints:
    // 1 <= nums.length <= 5000
    // -10^4 <= nums[i] <= 10^4
    // nums is guaranteed to be rotated at some pivot.
    // -10^4 <= target <= 10^4
     
    // Follow up: This problem is the same as Search in Rotated Sorted Array, where nums may contain duplicates. Would this affect the runtime complexity? How and why?

    // - Complexity:
    //   - time: O(n), where n is the length of nums.
    //   - space: O(1), only constant space is used.
    
    func search(_ nums: [Int], _ target: Int) -> Bool {
        guard !nums.isEmpty else { return false }

        var start = 0
        var end = nums.count - 1

        while start <= end {
            let mid = start + (end - start) / 2

            guard nums[mid] != target else { return true }

            if nums[start] == nums[mid], nums[end] == nums[mid] {
                start += 1
                end -= 1
            } else if nums[start] <= nums[mid] {
                if nums[start] <= target, target < nums[mid] {
                    end = mid - 1
                } else {
                    start = mid + 1
                }
            } else {
                if nums[mid] < target, target <= nums[end] {
                    start = mid + 1
                } else {
                    end = mid - 1
                }
            }
        }

        return false
    }

}