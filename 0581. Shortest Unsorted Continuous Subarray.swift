class Solution {

    // 581. Shortest Unsorted Continuous Subarray
    // Given an integer array nums, you need to find one continuous subarray that if you only sort this subarray in ascending order, then the whole array will be sorted in ascending order.
    // Return the shortest such subarray and output its length.

    // Example 1:
    // Input: nums = [2,6,4,8,10,9,15]
    // Output: 5
    // Explanation: You need to sort [6, 4, 8, 10, 9] in ascending order to make the whole array sorted in ascending order.

    // Example 2:
    // Input: nums = [1,2,3,4]
    // Output: 0

    // Example 3:
    // Input: nums = [1]
    // Output: 0

    // Constraints:
    // 1 <= nums.length <= 10^4
    // -10^5 <= nums[i] <= 10^5

    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        var unorderedMin = Int.max
        var unorderedMax = Int.min
        var start = 0, end = 0
        
        for i in stride(from: 1, to: nums.count, by: 1) {
            if nums[i] < nums[i - 1] { unorderedMin = min(unorderedMin, nums[i]) }
        }
        
        for i in stride(from: nums.count - 2, through: 0, by: -1) {
            if nums[i] > nums[i + 1] { unorderedMax = max(unorderedMax, nums[i]) }
        }
        
        for i in 0..<nums.count {
            if nums[i] > unorderedMin { start = i; break }
        }
        
        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            if nums[i] < unorderedMax { end = i; break }
        }
        
        return end == start ? 0 : end - start + 1
    }
    
}