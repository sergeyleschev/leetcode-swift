class Solution {

    // 1748. Sum of Unique Elements
    // You are given an integer array nums. The unique elements of an array are the elements that appear exactly once in the array.

    // Return the sum of all the unique elements of nums.

    // Example 1:
    // Input: nums = [1,2,3,2]
    // Output: 4
    // Explanation: The unique elements are [1,3], and the sum is 4.

    // Example 2:
    // Input: nums = [1,1,1,1,1]
    // Output: 0
    // Explanation: There are no unique elements, and the sum is 0.

    // Example 3:
    // Input: nums = [1,2,3,4,5]
    // Output: 15
    // Explanation: The unique elements are [1,2,3,4,5], and the sum is 15.

    // Constraints:
    // 1 <= nums.length <= 100
    // 1 <= nums[i] <= 100

    func sumOfUnique(_ nums: [Int]) -> Int {
        var ans = 0
        var cnt = [Int](repeating: 0, count: 101)
        
        for num in nums { cnt[num] += 1 }
        for idx in 0...100 where cnt[idx] == 1 { ans += idx }
        return ans
    }
    
}