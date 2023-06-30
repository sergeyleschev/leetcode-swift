class Solution {

    // Solution by Sergey Leschev

    // 594. Longest Harmonious Subsequence
    // We define a harmonious array as an array where the difference between its maximum value and its minimum value is exactly 1.
    // Given an integer array nums, return the length of its longest harmonious subsequence among all its possible subsequences.
    // A subsequence of array is a sequence that can be derived from the array by deleting some or no elements without changing the order of the remaining elements.

    // Finds the length of the longest harmonious subsequence among all possible subsequences.

    // - Parameter nums: An integer array.
    // - Returns: The length of longest harmonious subsequence.

    // Example 1:
    // Input: nums = [1,3,2,2,5,2,3,7]
    // Output: 5
    // Explanation: The longest harmonious subsequence is [3,2,2,2,3].

    // Example 2:
    // Input: nums = [1,2,3,4]
    // Output: 2

    // Example 3:
    // Input: nums = [1,1,1,1]
    // Output: 0

    // Constraints:
    // 1 <= nums.length <= 2 * 10^4
    // -10^9 <= nums[i] <= 10^9

    // - Complexity:
    //   - time: O(n), where n is the length of nums.
    //   - space: O(n), where n is the length of nums.
    
    func findLHS(_ nums: [Int]) -> Int {
        var dict = [Int: Int]()
        var ans = 0

        for num in nums {
            dict[num, default: 0] += 1
            if let val = dict[num + 1] { ans = max(ans, val + (dict[num] ?? 0)) }
            if let val = dict[num - 1] { ans = max(ans, val + (dict[num] ?? 0)) }
        }
        
        return ans
    }

}