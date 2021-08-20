class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 238. Product of Array Except Self
    // Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].
    // The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
    // You must write an algorithm that runs in O(n) time and without using the division operation.

    // Example 1:
    // Input: nums = [1,2,3,4]
    // Output: [24,12,8,6]

    // Example 2:
    // Input: nums = [-1,1,0,-3,3]
    // Output: [0,0,9,0,0]

    // Constraints:

    // 2 <= nums.length <= 10^5
    // -30 <= nums[i] <= 30
    // The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

    // Follow up: Can you solve the problem in O(1) extra space complexity? (The output array does not count as extra space for space complexity analysis.)

    func productExceptSelf(_ nums: [Int]) -> [Int] {
        guard nums.count > 0 else { return [] }
        
        var output = Array(repeating: 1, count: nums.count)
        var prod = nums[0]
        
        for i in 1..<nums.count{
            output[i] = prod
            prod *= nums[i]
        }
        
        prod = nums[nums.count-1]
        for i in stride(from: nums.count - 2, to: -1, by: -1){
            output[i] *= prod
            prod *= nums[i]
        }
        
        return output
    }
    
}