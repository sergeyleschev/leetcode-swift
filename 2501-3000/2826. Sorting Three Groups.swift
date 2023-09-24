class Solution {

    // Solution by Sergey Leschev
    // 2826. Sorting Three Groups

    // Time complexity: O(kn)
    // Space complexity: O(k)

    func minimumOperations(_ nums: [Int]) -> Int {
        var dp = [Int](repeating: nums.count, count: 4)

        for a in nums {
            dp[a] -= 1
            dp[2] = min(dp[2], dp[1])
            dp[3] = min(dp[3], dp[2])
        }

        return dp[3]
    }
}
