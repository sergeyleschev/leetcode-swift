class Solution {

    // 456. 132 Pattern
    // Given an array of n integers nums, a 132 pattern is a subsequence of three integers nums[i], nums[j] and nums[k] such that i < j < k and nums[i] < nums[k] < nums[j].
    // Return true if there is a 132 pattern in nums, otherwise, return false.

    // Finds if 132 pattern exists in the given array.

    // - Parameter nums: An array of integers.
    // - Returns: True if a 132 pattern exists, otherwise returns false.

    // Example 1:
    // Input: nums = [1,2,3,4]
    // Output: false
    // Explanation: There is no 132 pattern in the sequence.

    // Example 2:
    // Input: nums = [3,1,4,2]
    // Output: true
    // Explanation: There is a 132 pattern in the sequence: [1, 4, 2].

    // Example 3:
    // Input: nums = [-1,3,2,0]
    // Output: true
    // Explanation: There are three 132 patterns in the sequence: [-1, 3, 2], [-1, 3, 0] and [-1, 2, 0].

    // Constraints:
    // n == nums.length
    // 1 <= n <= 2 * 10^5
    // -10^9 <= nums[i] <= 10^9

    // - Complexity:
    //   - time: O(n), where n is the length of the nums.
    //   - space: O(n), where n is the length of the nums.
    
    func find132pattern(_ nums: [Int]) -> Bool {
        guard nums.count >= 3 else { return false }
        var nums = nums
        var tmp = [Int](repeating: 0, count: nums.count)
        tmp[0] = nums[0]

        for i in 1..<nums.count { tmp[i] = min(tmp[i-1], nums[i]) }

        var j = nums.count - 1
        var k = nums.count

        while j >= 0 {
            guard nums[j] > tmp[j] else { j -= 1; continue }
            while k < nums.count, nums[k] <= tmp[j] { k += 1 }
            if k < nums.count, nums[k] < nums[j] { return true }
            k -= 1
            nums[k] = nums[j]
            j -= 1
        }

        return false
    }

}