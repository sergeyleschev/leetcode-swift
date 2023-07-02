class Solution {

    // Solution by Sergey Leschev

    // 189. Rotate Array
    // Given an array, rotate the array to the right by k steps, where k is non-negative.

    // Example 1:
    // Input: nums = [1,2,3,4,5,6,7], k = 3
    // Output: [5,6,7,1,2,3,4]
    // Explanation:
    // rotate 1 steps to the right: [7,1,2,3,4,5,6]
    // rotate 2 steps to the right: [6,7,1,2,3,4,5]
    // rotate 3 steps to the right: [5,6,7,1,2,3,4]

    // Rotates an array to the right by k steps.

    // - Parameters:
    //   - nums: The array.
    //   - k: The number of steps.

    // Example 2:
    // Input: nums = [-1,-100,3,99], k = 2
    // Output: [3,99,-1,-100]
    // Explanation:
    // rotate 1 steps to the right: [99,-1,-100,3]
    // rotate 2 steps to the right: [3,99,-1,-100]

    // Constraints:
    // 1 <= nums.length <= 10^5
    // -2^31 <= nums[i] <= 2^31 - 1
    // 0 <= k <= 10^5

    // Follow up:
    // Try to come up with as many solutions as you can. There are at least three different ways to solve this problem.
    // Could you do it in-place with O(1) extra space?

    // - Complexity:
    //   - time: O(n), where n is the length of the nums.
    //   - space: O(1), only constant space is used.

    func rotate(_ nums: inout [Int], _ k: Int) {
        guard !nums.isEmpty else { return }

        let k = k % nums.count
        reverse(&nums, start: 0, end: nums.count - 1)
        reverse(&nums, start: 0, end: k - 1)
        reverse(&nums, start: k, end: nums.count - 1)
    }

    private func reverse(_ nums: inout [Int], start: Int, end: Int) {
        var start = start
        var end = end
        while start < end {
            nums.swapAt(start, end)
            start += 1
            end -= 1
        }
    }

}
