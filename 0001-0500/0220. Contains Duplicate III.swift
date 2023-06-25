class Solution {

    // Solution @ Sergey Leschev

    // 220. Contains Duplicate III
    // Given an integer array nums and two integers k and t, return true if there are two distinct indices i and j in the array such that abs(nums[i] - nums[j]) <= t and abs(i - j) <= k.

    // Finds out whether there are two distinct indices i and j in the array such that the
    // absolute difference between nums[i] and nums[j] is at most t and the absolute
    // difference between i and j is at most k.

    // - Parameters:
    //   - nums: An array of integers.
    //   - k: The absolute difference between the two indices.
    //   - t: The absolute difference between the two numbers.
    // - Returns: True if there are two different eligible indexes, otherwise it returns false.

    // Example 1:
    // Input: nums = [1,2,3,1], k = 3, t = 0
    // Output: true

    // Example 2:
    // Input: nums = [1,0,1,1], k = 1, t = 2
    // Output: true

    // Example 3:
    // Input: nums = [1,5,9,1,5,9], k = 2, t = 3
    // Output: false

    // Constraints:
    // 0 <= nums.length <= 2 * 10^4
    // -2^31 <= nums[i] <= 2^31 - 1
    // 0 <= k <= 10^4
    // 0 <= t <= 2^31 - 1

    // - Complexity:
    //   - time: O(n), where n is the length of the nums.
    //   - space: O(min(n, k)), where n is the length of the nums, and k is the absolute difference between the two indices.

    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        guard k > 0, t >= 0 else { return false }
        var dict = [Int: Int]()
        let w = t + 1

        for i in 0..<nums.count {
            let m = getID(nums[i], w)
            guard dict[m] == nil else { return true }
            if let num = dict[m - 1], abs(nums[i] - num) < w { return true }
            if let num = dict[m + 1], abs(nums[i] - num) < w { return true }
            dict[m] = nums[i]
            guard i >= k else { continue }

            dict.removeValue(forKey: getID(nums[i - k], w))
        }

        return false
    }


    private func getID(_ x: Int, _ w: Int) -> Int {
        return x < 0 ? ((x + 1) / w) - 1 : x / w
    }

}