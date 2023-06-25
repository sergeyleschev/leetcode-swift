class Solution {

    // Solution @ Sergey Leschev

    // 229. Majority Element II
    // Given an integer array of size n, find all elements that appear more than ⌊ n/3 ⌋ times.
    // Follow-up: Could you solve the problem in linear time and in O(1) space?

    // Finds all elements that appear more than ⌊n/3⌋ times.
    
    // - Parameter nums: An integer array.
    // - Returns: All elements that appear more than ⌊n/3⌋ times.

    // Example 1:
    // Input: nums = [3,2,3]
    // Output: [3]

    // Example 2:
    // Input: nums = [1]
    // Output: [1]

    // Example 3:
    // Input: nums = [1,2]
    // Output: [1,2]

    // Constraints:
    // 1 <= nums.length <= 5 * 10^4
    // -10^9 <= nums[i] <= 10^9

    // - Complexity:
    //   - time: O(n), where n is the length of `nums`.
    //   - space: O(1), only constant space is used.
    
    func majorityElement(_ nums: [Int]) -> [Int] {
        var elems = [Int: Int]()
        
        for n in nums { elems[n, default: 0] +=  1 }
        
        return elems.compactMap { key, value in
            if value > nums.count / 3 { return key }
            return nil
        }
    }
    
}