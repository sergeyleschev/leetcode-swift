class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 136. Single Number
    // Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.
    // You must implement a solution with a linear runtime complexity and use only constant extra space.

    // Except for one, every other element appears twice in given array of integers.
    // Finds that single one.

    // - Parameter nums: Array of integers.
    // - Returns: A number that appears only once.

    // Example 1:
    // Input: nums = [2,2,1]
    // Output: 1

    // Example 2:
    // Input: nums = [4,1,2,1,2]
    // Output: 4

    // Example 3:
    // Input: nums = [1]
    // Output: 1

    // Constraints:
    // 1 <= nums.length <= 3 * 10^4
    // -3 * 10^4 <= nums[i] <= 3 * 10^4
    // Each element in the array appears twice except for one element which appears only once.

    // - Complexity:
    //   - time: O(n), where n is the length of the nums.
    //   - space: O(1), only constant space is used.
    
    func singleNumber(_ nums: [Int]) -> Int {
        var ans = 0

        for num in nums {
            ans ^= num
        }

        return ans
    }

}