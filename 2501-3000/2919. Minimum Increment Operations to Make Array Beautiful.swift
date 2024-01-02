class Solution {

    // Solution by Sergey Leschev
    // 2919. Minimum Increment Operations to Make Array Beautiful

    // Time Complexity: O(n)
    // Space Complexity: O(1)

    func minIncrementOperations(_ nums: [Int], _ k: Int) -> Int {
        var dp1 = 0
        var dp2 = 0
        var dp3 = 0

        for a in nums {
            let temp1 = dp1
            let temp2 = dp2
            dp1 = temp2
            dp2 = dp3
            dp3 = min(temp1, temp2, dp3) + max(k - a, 0)
        }

        return min(dp1, dp2, dp3)
    }
}
