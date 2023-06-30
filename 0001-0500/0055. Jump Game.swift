class Solution {

    // Solution by Sergey Leschev

    // 55. Jump Game
    // Given an array of non-negative integers nums, you are initially positioned at the first index of the array.
    // Each element in the array represents your maximum jump length at that position.
    // Determine if you are able to reach the last index.

    // Determines if it is able to reach the last index.
    // - Parameter nums: Array of non-negative integers.
    // - Returns: True if it is able to reach the last index, otherwise returns false.

    // Example 1:
    // Input: nums = [2,3,1,1,4]
    // Output: true
    // Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.

    // Example 2:
    // Input: nums = [3,2,1,0,4]
    // Output: false
    // Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.
     
    // Constraints:
    // 1 <= nums.length <= 3 * 10^4
    // 0 <= nums[i] <= 10^5

    // - Complexity:
    //   - time: O(n), where n is the length of the nums.
    //   - space: O(1), only constant space is used.

    func canJump(_ nums: [Int]) -> Bool {
        var reach = 0
        var i = 0

        while i <= reach {
            reach = max(reach, i + nums[i])
            i += 1
            if reach >= nums.count - 1 { return true }
        }

        return false
    }

}