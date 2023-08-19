class Solution {

    // Solution by Sergey Leschev
    // 2555. Maximize Win From Two Segments
    // DP + Sliding Segment

    // # Intuition
    // The problem of maximizing wins from one segment, can be effectively solved using a sliding window approach.
    // By utilizing this approach, we can calculate the outcome by considering the dynamic programming (dp) values.

    // # Approach
    // To solve this problem, we establish a sliding segment, resembling a sliding window,
    // where the difference between A[i] and A[j] is less than or equal to k.
    // The dp array dp[k] signifies the maximum number of elements we can encompass
    // if we optimally choose a single segment within the first k elements.
    // As we shift a segment from the left to the right, the count of elements covered by this segment is given by i - j + 1.
    // Additionally, within the initial j elements, we are capable of covering at most dp[j] elements.

    // In total, we can cover i - j + 1 + dp[j] elements. Continuously update the result res during this process.
    // Ultimately, return the value of res.
    // This approach offers a clear way to maximize the count of prizes won
    // through strategically selecting two segments while adhering to the specified conditions.

    // # Complexity
    // Time complexity: O(n)
    // Space complexity: O(n)

    func maximizeWin(_ prizePositions: [Int], _ k: Int) -> Int {
        var res = 0
        let n = prizePositions.count
        var j = 0
        var dp = Array(repeating: 0, count: n + 1)

        for i in 0..<n {
            while j < n && prizePositions[j] < prizePositions[i] - k {
                j += 1
            }
            dp[i + 1] = max(dp[i], i - j + 1)
            res = max(res, i - j + 1 + dp[j])
        }

        return res
    }
}
