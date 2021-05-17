class Solution {

    // 35. Search Insert Position
    // Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
    // You must write an algorithm with O(log n) runtime complexity.

    // Search insert position.

    // - Parameters:
    //   - nums: A sorted array.
    //   - target: A target value.
    // - Returns: The index of the target if exists, or the index where it would be if it
    //   were inserted in order.

    // Example 1:
    // Input: nums = [1,3,5,6], target = 5
    // Output: 2

    // Example 2:
    // Input: nums = [1,3,5,6], target = 2
    // Output: 1

    // Example 3:
    // Input: nums = [1,3,5,6], target = 7
    // Output: 4

    // Example 4:
    // Input: nums = [1,3,5,6], target = 0
    // Output: 0

    // Example 5:
    // Input: nums = [1], target = 0
    // Output: 0
     
    // Constraints:
    // 1 <= nums.length <= 10^4
    // -10^4 <= nums[i] <= 10^4
    // nums contains distinct values sorted in ascending order.
    // -10^4 <= target <= 10^4

    // - Complexity:
    //   - time: O(log n), where n is the length of the nums.
    //   - space: O(1), only constant space is used.

    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.count

        while start < end {
            let mid = start + (end - start) / 2

            if nums[mid] < target {
                start = mid + 1
            } else {
                end = mid
            }
        }

        return start
    }

}