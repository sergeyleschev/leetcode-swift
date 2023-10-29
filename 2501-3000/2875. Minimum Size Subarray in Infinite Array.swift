class Solution {

    // Solution by Sergey Leschev
    // 2875. Minimum Size Subarray in Infinite Array

    // Time complexity: O(n)
    // Space complexity: O(n)

    func minSizeSubarray(_ nums: [Int], _ target: Int) -> Int {
        let sumA = nums.reduce(0, +)
        let n = nums.count
        var k = target / sumA
        var res = n
        var target = target % sumA

        if target == 0 {
            return k * n
        }

        var dp: [Int: Int] = [0: -1]
        var su = 0

        for i in 0..<(2 * n) {
            su += nums[i % n]
            if let prevIndex = dp[su - target] {
                res = min(res, i - prevIndex)
            }
            dp[su] = i
        }

        return res < n ? res + k * n : -1
    }
}
