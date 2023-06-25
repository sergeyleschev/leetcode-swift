class Solution {

    // Solution @ Sergey Leschev

    // 219. Contains Duplicate II
    // Given an integer array nums and an integer k, return true if there are two distinct indices i and j in the array such that nums[i] == nums[j] and abs(i - j) <= k.

    // Finds out if an array contains nearby duplicate.
    // - Parameters:
    //   - nums: The array of integers.
    //   - k: The difference.
    // - Returns: True if nearby duplicate exists, otherwise returns false.

    // Example 1:
    // Input: nums = [1,2,3,1], k = 3
    // Output: true

    // Example 2:
    // Input: nums = [1,0,1,1], k = 1
    // Output: true

    // Example 3:
    // Input: nums = [1,2,3,1,2,3], k = 2
    // Output: false

    // Constraints:
    // 1 <= nums.length <= 10^5
    // -10^9 <= nums[i] <= 10^9
    // 0 <= k <= 10^5

    // - Complexity:
    //   - time: O(n), where n is the length of the nums.
    //   - space: O(n), where n is the length of the nums.

    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var dic = [Int: Int]()

        for (i, num) in nums.enumerated() {
            if let val = dic[num], i - val <= k { return true } else { dic[num] = i }
        }

        return false
    }

}