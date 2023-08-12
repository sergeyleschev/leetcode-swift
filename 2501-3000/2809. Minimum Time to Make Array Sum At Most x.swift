class Solution {

    // Solution by Sergey Leschev
    // 2809. Minimum Time to Make Array Sum At Most x
    // DP

    // # Approach
    // We begin by calculating the total sum of the arrays A and B as sa and sb respectively.
    // If no actions are taken, at i seconds, we would have a total of sb * i + sa.
    // During the t seconds, we select t elements. When we consider these selected elements, A[i] would be removed.
    // The sum for these selected elements would be b1 * (t - 1) + b2 * (t - 2) + ... + bt * 0, where b1, b2, b3, ..., bt are arranged in increasing order.
    // To solve this problem, we sort all the pairs (B[i], A[i]) based on the value of B[i].\
    // We then utilize dynamic programming (dp) with the following logic:
    // dp[j][i] represents the maximum value we can reduce within i seconds, using j + 1 step-smallest integers.
    // The dp equation is as follows:
    // dp[j][i] = max(dp[j][i], dp[j - 1][i - 1] + i * b + a)
    // In the end, we return the value of i seconds if sb * i + sa - dp[n - 1][i] is less than or equal to x. If not, we return -1.
    // It is possible to optimize the space complexity by storing only the first dimension of the dp array.

    // Time complexity: O(n^2)
    // Space complexity: O(n)

    func minimumTime(_ nums1: [Int], _ nums2: [Int], _ x: Int) -> Int {
        let n = nums1.count
        var dp = [Int](repeating: 0, count: n + 1)

        let sortedPairs = zip(nums2, nums1).sorted { $0.0 < $1.0 }

        for (j, (b, a)) in sortedPairs.enumerated() {
            for i in stride(from: j + 1, through: 1, by: -1) {
                dp[i] = max(dp[i], dp[i - 1] + i * b + a)
            }
        }

        let sa = nums1.reduce(0, +)
        let sb = nums2.reduce(0, +)

        for i in 0...n {
            if sb * i + sa - dp[i] <= x {
                return i
            }
        }

        return -1
    }
}
