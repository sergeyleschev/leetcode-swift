class Solution {

    // Solution by Sergey Leschev

    // 813. Largest Sum of Averages
    // We partition a row of numbers nums into at most k adjacent (non-empty) groups, then our score is the sum of the average of each group. What is the largest score we can achieve?
    // Note that our partition must use every number in nums, and that scores are not necessarily integers.

    // Example:
    // Input:
    // nums = [9,1,2,3,9]
    // k = 3
    // Output: 20
    // Explanation:
    // The best choice is to partition nums into [9], [1, 2, 3], [9]. The answer is 9 + (1 + 2 + 3) / 3 + 9 = 20.
    // We could have also partitioned nums into [9, 1], [2], [3, 9], for example.
    // That partition would lead to a score of 5 + 2 + 6 = 13, which is worse.

    // Note:
    // 1 <= nums.length <= 100.
    // 1 <= nums[i] <= 10000.
    // 1 <= k <= nums.length.
    // Answers within 10-6 of the correct answer will be accepted as correct.

    func largestSumOfAverages(_ A: [Int], _ K: Int) -> Double {
        var sums = Array(repeating: 0, count: A.count + 1)
        var dp = Array(repeating: 0.0, count: A.count)

        for (i, a) in A.enumerated() { sums[i + 1] += sums[i] + a }

        for (i, sum) in sums.enumerated() {
            guard i != 0 else { continue }
            dp[i - 1] = Double(sum) / Double(i)
        }

        for i in 0..<K - 1 {
            var dp0 = Array(repeating: 0.0, count: A.count)
            for j in i..<A.count {
                for k in i..<j {
                    dp0[j] = max(dp0[j], dp[k] + Double(sums[j + 1] - sums[k + 1]) / Double(j - k))
                }
            }
            dp = dp0
        }

        return dp.last!
    }

}
