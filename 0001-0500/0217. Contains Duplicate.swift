class Solution {

    // Solution @ Sergey Leschev

    // 217. Contains Duplicate
    // Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

    // Given an array of integers, find if the array contains any duplicates.
    // - Parameter nums: Array of integers.
    // - Returns: true if any value appears at least twice in the array, or false if every element is distinct.

    // Example 1:
    // Input: nums = [1,2,3,1]
    // Output: true

    // Example 2:
    // Input: nums = [1,2,3,4]
    // Output: false

    // Example 3:
    // Input: nums = [1,1,1,3,3,4,3,2,4,2]
    // Output: true

    // Constraints:
    // 1 <= nums.length <= 10^5
    // -10^9 <= nums[i] <= 10^9

    // - Complexity:
    //   - time: O(n), where n is the length of the nums.
    //   - space: O(n), where n is the length of the nums.

    func containsDuplicate(_ nums: [Int]) -> Bool {
        var set = Set<Int>()

        for num in nums {
            guard !set.contains(num) else { return true }
            set.insert(num)
        }

        return false
    }

}