class Solution {

    // Solution by Sergey Leschev

    // 611. Valid Triangle Number
    // Given an integer array nums, return the number of triplets chosen from the array that can make triangles if we take them as side lengths of a triangle.

    // Example 1:
    // Input: nums = [2,2,3,4]
    // Output: 3
    // Explanation: Valid combinations are: 
    // 2,3,4 (using the first 2)
    // 2,3,4 (using the second 2)
    // 2,2,3

    // Example 2:
    // Input: nums = [4,2,3,4]
    // Output: 4

    // Constraints:
    // 1 <= nums.length <= 1000
    // 0 <= nums[i] <= 1000

    func triangleNumber(_ nums: [Int]) -> Int {
        var nums = nums.sorted()
        var end = nums.count - 1
        var ans = 0
        
        while end >= 2 {
            var left = 0, right = end - 1
            while left < right {
                if ((nums[left] + nums[right]) > nums[end]) {
                    ans += right - left
                    right -= 1
                } else {
                    left += 1
                }
            }
            end -= 1
        }
        
        return ans
    }

}