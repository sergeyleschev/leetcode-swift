class Solution {

    // Solution by Sergey Leschev

    // 448. Find All Numbers Disappeared in an Array
    // Given an array nums of n integers where nums[i] is in the range [1, n], return an array of all the integers in the range [1, n] that do not appear in nums.

    // Example 1:
    // Input: nums = [4,3,2,7,8,2,3,1]
    // Output: [5,6]

    // Example 2:
    // Input: nums = [1,1]
    // Output: [2]

    // Constraints:
    // n == nums.length
    // 1 <= n <= 10^5
    // 1 <= nums[i] <= n

    // Follow up: Could you do it without extra space and in O(n) runtime? You may assume the returned list does not count as extra space.

    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        guard nums.count > 0 else { return [] }
        var nums = nums
        var output = [Int]()
        
        for i in 0..<nums.count {
            let n = abs(nums[i])
            if nums[n-1] > 0 { nums[n - 1] *= -1  }
        }
        
        for i in 0..<nums.count {
            if nums[i] > 0 { output.append(i + 1) }
        }
        
        return output
    }
    
}