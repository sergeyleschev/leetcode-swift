class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 673. Number of Longest Increasing Subsequence
    // Given an integer array nums, return the number of longest increasing subsequences.
    // Notice that the sequence has to be strictly increasing.

    // Finds the number of longest increasing subsequences.

    // - Parameter nums: An integer array.
    // - Returns: The number of longest increasing subsequences.

    // Example 1:
    // Input: nums = [1,3,5,4,7]
    // Output: 2
    // Explanation: The two longest increasing subsequences are [1, 3, 4, 7] and [1, 3, 5, 7].

    // Example 2:
    // Input: nums = [2,2,2,2,2]
    // Output: 5
    // Explanation: The length of longest continuous increasing subsequence is 1, and there are 5 subsequences' length is 1, so output 5.

    // Constraints:
    // 1 <= nums.length <= 2000
    // -10^6 <= nums[i] <= 10^6

    // - Complexity:
    //   - time: O(n^2), where n is the length of nums.
    //   - space: O(n), where n is the length of nums.
    
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums.count }
        var lengths = [Int](repeating: 0, count: nums.count)
        var counts = [Int](repeating: 1, count: nums.count)
        var ans = 0
        var maxLen = 0

        for i in 0..<nums.count {
            for j in 0..<i {
                guard nums[i] > nums[j] else { continue }
                if lengths[j] >= lengths[i] {
                    lengths[i] = lengths[j] + 1
                    counts[i] = counts[j]
                } else if lengths[j] + 1 == lengths[i] {
                    counts[i] += counts[j]
                }
            }
        }

        for length in lengths { maxLen = max(maxLen, length) }

        for i in 0..<nums.count {
            guard lengths[i] == maxLen else { continue }
            ans += counts[i]
        }

        return ans
    }

}