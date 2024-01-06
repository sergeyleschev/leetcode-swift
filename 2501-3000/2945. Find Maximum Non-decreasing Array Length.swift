class Solution {

    // Solution by Sergey Leschev
    // 2945. Find Maximum Non-decreasing Array Length

    // Time Complexity: O(n log n)
    // Space Complexity: O(n)

    func findMaximumLength(_ nums: [Int]) -> Int {
        let n = nums.count
        var pre = [Int](repeating: 0, count: n + 2)
        var dp = [Int](repeating: 0, count: n + 1)
        var acc = [Int](repeating: 0, count: n + 1)

        for i in 1...n {
            acc[i] = acc[i - 1] + nums[i - 1]
        }

        var i = 0
        for j in 1...n {
            i = max(i, pre[j])
            dp[j] = dp[i] + 1
            let k = lowerBound(acc, 2 * acc[j] - acc[i])
            pre[k] = j
        }

        return dp[n]
    }

    private func lowerBound(_ array: [Int], _ target: Int) -> Int {
        var left = 0
        var right = array.count

        while left < right {
            let mid = left + (right - left) / 2
            if array[mid] < target {
                left = mid + 1
            } else {
                right = mid
            }
        }

        return left
    }
}
