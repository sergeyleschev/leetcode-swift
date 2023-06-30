class Solution {

    // Solution by Sergey Leschev

    // 485. Max Consecutive Ones
    // Given a binary array nums, return the maximum number of consecutive 1's in the array.

    // Finds the maximum number of consecutive 1s in a binary array.

    // - Parameter nums: The binary array.
    // - Returns: The maximum number of consecutive 1s.

    // Example 1:
    // Input: nums = [1,1,0,1,1,1]
    // Output: 3
    // Explanation: The first two digits or the last three digits are consecutive 1s. The maximum number of consecutive 1s is 3.

    // Example 2:
    // Input: nums = [1,0,1,1,0,1]
    // Output: 2

    // Constraints:
    // 1 <= nums.length <= 10^5
    // nums[i] is either 0 or 1.

    // - Complexity:
    //   - time: O(n), where n is the length of nums.
    //   - space: O(1), only constant space is used.
    
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var ans = 0
        var currentMax = 0

        for i in nums {
            guard i != 1 else { currentMax += 1; continue }
            ans = max(ans, currentMax)
            currentMax = 0
        }

        return max(ans, currentMax)
    }

}