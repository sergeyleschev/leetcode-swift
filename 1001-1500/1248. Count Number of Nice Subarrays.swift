class Solution {

    // Solution by Sergey Leschev

    // 1248. Count Number of Nice Subarrays
    // Given an array of integers nums and an integer k. A continuous subarray is called nice if there are k odd numbers on it.
    // Return the number of nice sub-arrays.

    // Example 1:
    // Input: nums = [1,1,2,1,1], k = 3
    // Output: 2
    // Explanation: The only sub-arrays with 3 odd numbers are [1,1,2,1] and [1,2,1,1].

    // Example 2:
    // Input: nums = [2,4,6], k = 1
    // Output: 0
    // Explanation: There is no odd numbers in the array.

    // Example 3:
    // Input: nums = [2,2,2,1,2,2,1,2,2,2], k = 2
    // Output: 16

    // Constraints:
    // 1 <= nums.length <= 50000
    // 1 <= nums[i] <= 10^5
    // 1 <= k <= nums.length

    func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
        var h = 0
        var t = 0
        var count = nums.count
        var odd = 0
        var ans = 0

        while h <= t && t < count {
            var pre = 1
            var suf = 1

            while h < count && !isOdd(nums[h]) {
                pre += 1
                h += 1
            }

            while t < count && odd < k {
                if isOdd(nums[t]) { odd += 1 }
                t += 1
            }

            while t < count && !isOdd(nums[t]) {
                t += 1
                suf += 1
            }

            if odd == k { ans += pre * suf }
            h += 1
            odd -= 1
        }

        return ans
    }

    private func isOdd(_ n: Int) -> Bool { n % 2 == 1 }
}
