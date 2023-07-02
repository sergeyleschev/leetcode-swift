class Solution {

    // Solution by Sergey Leschev

    // 128. Longest Consecutive Sequence
    // Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.

    // Example 1:
    // Input: nums = [100,4,200,1,3,2]
    // Output: 4
    // Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.

    // Example 2:
    // Input: nums = [0,3,7,2,5,8,4,6,0,1]
    // Output: 9

    // Constraints:
    // 0 <= nums.length <= 10^4
    // -10^9 <= nums[i] <= 10^9

    // Follow up: Could you implement the O(n) solution?

    func longestConsecutive(_ nums: [Int]) -> Int {
        var map: [Int: (Int, Int)] = [:]
        var max = 0

        for num in nums {
            if map[num] == nil {
                let left = map[num - 1]
                let right = map[num + 1]

                if let left = left, let right = right {
                    map[num] = (left.0 + 1, right.1 + 1)

                } else if let left = left {
                    map[num] = (left.0 + 1, 0)

                } else if let right = right {
                    map[num] = (0, right.1 + 1)

                } else {
                    map[num] = (0, 0)
                }

                let lower = num - map[num]!.0
                let upper = num + map[num]!.1
                map[lower] = (0, upper - lower)
                map[upper] = (upper - lower, 0)
                let count = upper - lower + 1
                max = max > count ? max : count
            }
        }

        return max
    }

}
