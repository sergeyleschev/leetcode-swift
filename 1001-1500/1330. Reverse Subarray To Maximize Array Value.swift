class Solution {

    // Solution by Sergey Leschev

    // 1330. Reverse Subarray To Maximize Array Value
    // You are given an integer array nums. The value of this array is defined as the sum of |nums[i]-nums[i+1]| for all 0 <= i < nums.length-1.
    // You are allowed to select any subarray of the given array and reverse it. You can perform this operation only once.
    // Find maximum possible value of the final array.

    // Example 1:
    // Input: nums = [2,3,1,5,4]
    // Output: 10
    // Explanation: By reversing the subarray [3,1,5] the array becomes [2,5,1,3,4] whose value is 10.

    // Example 2:
    // Input: nums = [2,4,9,24,2,1,10]
    // Output: 68

    // Constraints:
    // 1 <= nums.length <= 3*10^4
    // -10^5 <= nums[i] <= 10^5

    func maxValueAfterReverse(_ nums: [Int]) -> Int {
        let value = zip(nums, nums.dropFirst()).map { abs($0 - $1) }.reduce(0, +)

        let lo = zip(nums, nums.dropFirst()).map { a, b in max(a, b) }.min()!
        let hi = zip(nums, nums.dropFirst()).map { c, d in min(c, d) }.max()!
        
        let fromFirst = zip(nums, nums.dropFirst()).map { c, d in abs(nums.first! - d) - abs(c - d) }.max()!
        let toLast = zip(nums, nums.dropFirst()).map { a, b in abs(nums.last! - a) - abs(b - a) }.max()!
        
        return value + max((hi - lo) * 2, fromFirst, toLast)
    }

}