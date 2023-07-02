class Solution {

    // Solution by Sergey Leschev

    // 1425. Constrained Subsequence Sum
    // Given an integer array nums and an integer k, return the maximum sum of a non-empty subsequence of that array such that for every two consecutive integers in the subsequence, nums[i] and nums[j], where i < j, the condition j - i <= k is satisfied.

    // A subsequence of an array is obtained by deleting some number of elements (can be zero) from the array, leaving the remaining elements in their original order.

    // Example 1:
    // Input: nums = [10,2,-10,5,20], k = 2
    // Output: 37
    // Explanation: The subsequence is [10, 2, 5, 20].

    // Example 2:
    // Input: nums = [-1,-2,-3], k = 1
    // Output: -1
    // Explanation: The subsequence must be non-empty, so we choose the largest number.

    // Example 3:
    // Input: nums = [10,-2,-10,-5,20], k = 2
    // Output: 23
    // Explanation: The subsequence is [10, -2, -5, 20].

    // Constraints:
    // 1 <= k <= nums.length <= 10^5
    // -10^4 <= nums[i] <= 10^4

    // Solution: DP
    // dp[i] = nums[i] + max(0, dp[i-k], dp[i-k+1], ..., dp[i-1])
    // binary insert/remove to help fasting find max(0, dp[i-k], dp[i-k+1], ..., dp[i-1])
    // Time Complexity: O(n logk)
    // Space Complexity: O(n + k)

    func constrainedSubsetSum(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var dp = Array(repeating: 0, count: n)  // dp[i] - nums[0...i] if nums[i] is in the subsequence
        var cacheK = [Int]()

        dp[0] = nums[0]
        insert(dp[0], &cacheK)  // cache dp[i-k..<i], cacheK.last! will be previous largest element

        var maxSum = dp[0]

        for i in 1..<n {
            if i > k { remove(dp[i - k - 1], &cacheK) }
            dp[i] = nums[i] + max(cacheK.last ?? 0, 0)
            insert(dp[i], &cacheK)
            maxSum = max(maxSum, dp[i])
        }

        return maxSum
    }

    private func insert(_ target: Int, _ cacheK: inout [Int]) {
        if cacheK.isEmpty {
            cacheK.append(target)
            return
        }
        var left = 0
        var right = cacheK.count - 1

        while left < right {
            let mid = left + (right - left) / 2
            if cacheK[mid] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }

        if cacheK[left] < target {
            cacheK.insert(target, at: left + 1)
        } else {
            cacheK.insert(target, at: left)
        }
    }

    private func remove(_ target: Int, _ cacheK: inout [Int]) {
        var left = 0
        var right = cacheK.count - 1

        while left <= right {
            let mid = left + (right - left) / 2
            if cacheK[mid] == target {
                cacheK.remove(at: mid)
                return
            } else if cacheK[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
    }

}
