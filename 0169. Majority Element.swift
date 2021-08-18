class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 169. Majority Element
    // Given an array nums of size n, return the majority element.
    // The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.

    // Finds the majority element.

    // - Parameter nums: Array of numbers.
    // - Returns: Majority element.

    // Example 1:
    // Input: nums = [3,2,3]
    // Output: 3

    // Example 2:
    // Input: nums = [2,2,1,1,1,2,2]
    // Output: 2

    // Constraints:
    // n == nums.length
    // 1 <= n <= 5 * 10^4
    // -2^31 <= nums[i] <= 2^31 - 1
     
    // Follow-up: Could you solve the problem in linear time and in O(1) space?

    // - Complexity:
    //   - time: O(n), where n is the length of the nums.
    //   - space: O(1), only constant space is used.
    
    func majorityElement(_ nums: [Int]) -> Int {
        var ans = -1
        var count = 0

        for num in nums {
            if count == 0 { ans = num }
            count += num == ans ? 1 : -1
        }

        return ans
    }

}