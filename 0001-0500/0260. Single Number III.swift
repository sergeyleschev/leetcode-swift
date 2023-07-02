class Solution {

    // Solution by Sergey Leschev

    // 260. Single Number III
    // Given an integer array nums, in which exactly two elements appear only once and all the other elements appear exactly twice. Find the two elements that appear only once. You can return the answer in any order.
    // You must write an algorithm that runs in linear runtime complexity and uses only constant extra space.

    // Finds the two elements that appear only once in an array of numbers.
    // - Parameter nums: The array of numbers.
    // - Returns: The two elements that appear only once.

    // Example 1:
    // Input: nums = [1,2,1,3,2,5]
    // Output: [3,5]
    // Explanation:  [5, 3] is also a valid answer.

    // Example 2:
    // Input: nums = [-1,0]
    // Output: [-1,0]

    // Example 3:
    // Input: nums = [0,1]
    // Output: [1,0]

    // Constraints:
    // 2 <= nums.length <= 3 * 10^4
    // -2^31 <= nums[i] <= 2^31 - 1
    // Each integer in nums will appear twice, only two integers will appear once.

    // - Complexity:
    //   - time: O(n), where n is the length of the nums.
    //   - space: O(1), only constant space is used.

    func singleNumber(_ nums: [Int]) -> [Int] {
        var diff = 0
        var ans = [Int](repeating: 0, count: 2)

        for num in nums { diff ^= num }
        diff &= -diff

        for num in nums {
            if num & diff == 0 {
                ans[0] ^= num
            } else {
                ans[1] ^= num
            }
        }

        return ans
    }

}
