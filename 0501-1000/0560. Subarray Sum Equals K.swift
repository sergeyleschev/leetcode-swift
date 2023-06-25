class Solution {

    // Solution @ Sergey Leschev

    // 560. Subarray Sum Equals K
    // Given an array of integers nums and an integer k, return the total number of continuous subarrays whose sum equals to k.

    // Example 1:
    // Input: nums = [1,1,1], k = 2
    // Output: 2

    // Example 2:
    // Input: nums = [1,2,3], k = 3
    // Output: 2

    // Constraints:
    // 1 <= nums.length <= 2 * 10^4
    // -1000 <= nums[i] <= 1000
    // -10^7 <= k <= 10^7
    
    // Use hash map to record the number of prefix sum's appearance.

    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var prefixSum = 0
        var map = [0: 1]
        var count = 0
        
        for i in 0..<nums.count {
            prefixSum += nums[i]
            count += map[prefixSum - k] ?? 0
            map[prefixSum, default: 0] += 1
        }
        
        return count
    }

}