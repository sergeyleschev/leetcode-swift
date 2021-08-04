class Solution {

    // 1712. Ways to Split Array Into Three Subarrays
    // A split of an integer array is good if:
    // The array is split into three non-empty contiguous subarrays - named left, mid, right respectively from left to right.
    // The sum of the elements in left is less than or equal to the sum of the elements in mid, and the sum of the elements in mid is less than or equal to the sum of the elements in right.
    // Given nums, an array of non-negative integers, return the number of good ways to split nums. As the number may be too large, return it modulo 109 + 7.

    // Example 1:
    // Input: nums = [1,1,1]
    // Output: 1
    // Explanation: The only good way to split nums is [1] [1] [1].

    // Example 2:
    // Input: nums = [1,2,2,2,5,0]
    // Output: 3
    // Explanation: There are three good ways of splitting nums:
    // [1] [2] [2,2,5,0]
    // [1] [2,2] [2,5,0]
    // [1,2] [2,2] [5,0]

    // Example 3:
    // Input: nums = [3,2,1]
    // Output: 0
    // Explanation: There is no good way to split nums.

    // Constraints:
    // 3 <= nums.length <= 10^5
    // 0 <= nums[i] <= 10^4

    private let mod = 1_000_000_007


    func waysToSplit(_ nums: [Int]) -> Int {
        let n = nums.count
        var preffix = [0]
        for num in nums { preffix.append(preffix.last! + num) }
        var ans = 0
        var midStartIdx = 2

        for l in 1...(n - 2) {
            let leftSum = preffix[l]
            midStartIdx = max(midStartIdx, l + 1)
            while midStartIdx < n && preffix[midStartIdx] - leftSum < leftSum  { midStartIdx += 1 }
            guard midStartIdx < n else { break }
            var low = midStartIdx
            var high = n - 1

            while low <= high {
                let mid = (low + high) >> 1
                if preffix[n] - preffix[mid] < preffix[mid] - leftSum {
                    high = mid - 1
                } else {
                    low = mid + 1
                }
            }
            ans = (ans + high - midStartIdx + 1) % mod
        }
        return ans
    }

}