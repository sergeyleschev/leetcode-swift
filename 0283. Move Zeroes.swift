class Solution {

    // 283. Move Zeroes
    // Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.
    // Note that you must do this in-place without making a copy of the array.

    //  Move all 0's to the end while maintaining the relative order of the non-zero elements.
    // - Parameter nums: Array of integers

    // Example 1:
    // Input: nums = [0,1,0,3,12]
    // Output: [1,3,12,0,0]

    // Example 2:
    // Input: nums = [0]
    // Output: [0]

    // Constraints:
    // 1 <= nums.length <= 10^4
    // -2^31 <= nums[i] <= 2^31 - 1

    // - Complexity:
    //   - time: O(n), where n is the length of the nums.
    //   - space: O(1), only constant space is used.
    
    func moveZeroes(_ nums: inout [Int]) {
        guard !nums.isEmpty else { return }

        var j = 0
        for (i, num) in nums.enumerated() {
            guard num != 0 else { continue }
            nums.swapAt(i, j)
            j += 1
        }
    }

}