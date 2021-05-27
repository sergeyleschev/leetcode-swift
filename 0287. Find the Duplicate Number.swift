class Solution {

    // 287. Find the Duplicate Number
    // Given an array of integers nums containing n + 1 integers where each integer is in the range [1, n] inclusive.
    // There is only one repeated number in nums, return this repeated number.
    // You must solve the problem without modifying the array nums and uses only constant extra space.

    // Finds the duplicate number.
    // - Parameter nums: An array containing n + 1 integers where each integer is between 1 and n (inclusive).
    // - Returns: The duplicate number.

    // Example 1:
    // Input: nums = [1,3,4,2,2]
    // Output: 2

    // Example 2:
    // Input: nums = [3,1,3,4,2]
    // Output: 3

    // Example 3:
    // Input: nums = [1,1]
    // Output: 1

    // Example 4:
    // Input: nums = [1,1,2]
    // Output: 1 

    // Constraints:
    // 2 <= n <= 10^5
    // nums.length == n + 1
    // 1 <= nums[i] <= n
    // All the integers in nums appear only once except for precisely one integer which appears two or more times.

    // Follow up:
    // How can we prove that at least one duplicate number must exist in nums?
    // Can you solve the problem in linear runtime complexity?

    // - Complexity:
    //   - time: O(n), where n is the length of the nums.
    //   - space: O(1), only constant space is used.

    func findDuplicate(_ nums: [Int]) -> Int {
        var slow = nums[0]
        var fast = nums[nums[0]]

        while slow != fast {
            slow = nums[slow]
            fast = nums[nums[fast]]
        }

        slow = 0
        while slow != fast {
            slow = nums[slow]
            fast = nums[fast]
        }

        return slow
    }

}