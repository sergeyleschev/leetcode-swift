class Solution {

    // Solution by Sergey Leschev

    // 33. Search in Rotated Sorted Array
    // There is an integer array nums sorted in ascending order (with distinct values).
    // Prior to being passed to your function, nums is rotated at an unknown pivot index k (0 <= k < nums.length) such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). For example, [0,1,2,4,5,6,7] might be rotated at pivot index 3 and become [4,5,6,7,0,1,2].
    // Given the array nums after the rotation and an integer target, return the index of target if it is in nums, or -1 if it is not in nums.
    // You must write an algorithm with O(log n) runtime complexity.

    // Finds the index of `target` in the array.

    // - Parameters:
    //   - nums: The array.
    //   - target: An integer.
    // - Returns: The index of `target` if `target` exist in `nums`, otherwise
    //   returns -1.

    // Example 1:
    // Input: nums = [4,5,6,7,0,1,2], target = 0
    // Output: 4

    // Example 2:
    // Input: nums = [4,5,6,7,0,1,2], target = 3
    // Output: -1

    // Example 3:
    // Input: nums = [1], target = 0
    // Output: -1
     
    // Constraints:
    // 1 <= nums.length <= 5000
    // -10^4 <= nums[i] <= 10^4
    // All values of nums are unique.
    // nums is guaranteed to be rotated at some pivot.
    // -10^4 <= target <= 10^4

    // - Complexity:
    //     - time: O(log n), where n is the length of nums.
    //     - space: O(1), only constant space is used.
    
    func search(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.count - 1

        while start <= end {
            let mid = start + (end - start) / 2
            guard nums[mid] != target else { return mid }

            if nums[start] < nums[mid] {
                if nums[start] <= target, target < nums[mid] {
                    end = mid - 1
                } else {
                    start = mid + 1
                }
            } else if nums[start] > nums[mid] {
                if nums[mid] < target, target <= nums[end] {
                    start = mid + 1
                } else {
                    end = mid - 1
                }

            } else {
                start = mid + 1
            }

        }
        return -1
    }

}