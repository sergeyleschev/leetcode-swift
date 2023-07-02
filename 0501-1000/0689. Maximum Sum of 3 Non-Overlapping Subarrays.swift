class Solution {

    // Solution by Sergey Leschev

    // 689. Maximum Sum of 3 Non-Overlapping Subarrays
    // Given an integer array nums and an integer k, find three non-overlapping subarrays of length k with maximum sum and return them.
    // Return the result as a list of indices representing the starting position of each interval (0-indexed). If there are multiple answers, return the lexicographically smallest one.

    // Example 1:
    // Input: nums = [1,2,1,2,6,7,5,1], k = 2
    // Output: [0,3,5]
    // Explanation: Subarrays [1, 2], [2, 6], [7, 5] correspond to the starting indices [0, 3, 5].
    // We could have also taken [2, 1], but an answer of [1, 3, 5] would be lexicographically larger.

    // Example 2:
    // Input: nums = [1,2,1,2,1,2,1,2,1], k = 2
    // Output: [0,2,4]

    // Constraints:
    // 1 <= nums.length <= 2 * 10^4
    // 1 <= nums[i] < 2^16
    // 1 <= k <= floor(nums.length / 3)

    func maxSumOfThreeSubarrays(_ nums: [Int], _ k: Int) -> [Int] {
        var maxsum = -1
        let n = nums.count
        var sum = Array(repeating: 0, count: nums.count + 1)
        var posLeft = Array(repeating: 0, count: nums.count)
        var posRight = Array(repeating: 0, count: nums.count)
        var ans = Array(repeating: 0, count: 3)

        for i in 0..<n { sum[i + 1] = sum[i] + nums[i] }

        // DP for starting index of the left max sum interval
        var last = -1
        for i in k...n - 2 * k {
            var tot: Int = sum[i] - sum[i - k]
            if tot > last {
                posLeft[i] = i - k
                last = tot
            } else {
                posLeft[i] = posLeft[i - 1]
            }

        }

        last = -1
        for i in stride(from: n - 2 * k, to: k - 1, by: -1) {
            var tot: Int = sum[i + 2 * k] - sum[i + k]
            if tot >= last {
                posRight[i] = i + k
                last = tot
            } else {
                posRight[i] = posRight[i + 1]
            }
        }

        // test all possible middle interval
        for i in k...n - 2 * k {
            let l = posLeft[i]
            let r = posRight[i]
            let tot: Int = (sum[l + k] - sum[l]) + (sum[i + k] - sum[i]) + (sum[r + k] - sum[r])
            if tot > maxsum {
                maxsum = tot
                ans[0] = l
                ans[1] = i
                ans[2] = r
            }
        }

        return ans
    }

}
