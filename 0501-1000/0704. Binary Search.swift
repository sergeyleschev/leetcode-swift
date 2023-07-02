class Solution {

    // Solution by Sergey Leschev

    // 704. Binary Search
    // Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.
    // You must write an algorithm with O(log n) runtime complexity.

    // Finds the index of target in the given array.

    // - Parameters:
    //   - nums: A sorted (in ascending order) integer array.
    //   - target: The target value.
    // - Returns: If the target exists in an array returns its index, otherwise returns -1.

    // Example 1:
    // Input: nums = [-1,0,3,5,9,12], target = 9
    // Output: 4
    // Explanation: 9 exists in nums and its index is 4

    // Example 2:
    // Input: nums = [-1,0,3,5,9,12], target = 2
    // Output: -1
    // Explanation: 2 does not exist in nums so return -1

    // Constraints:
    // 1 <= nums.length <= 10^4
    // -10^4 < nums[i], target < 10^4
    // All the integers in nums are unique.
    // nums is sorted in ascending order.

    // - Complexity:
    //   - time: O(log(n)), where n is the length of the nums.
    //   - space: O(1), only constant space is used.

    func search(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
        var high = nums.count - 1

        while low <= high {
            var mid = low + (high - low) / 2

            guard nums[mid] != target else { return mid }

            if nums[mid] < target {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }

        return -1
    }

}
