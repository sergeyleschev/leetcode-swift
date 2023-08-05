class Solution {

    // Solution by Sergey Leschev
    // 2770. Maximum Number of Jumps to Reach the Last Index
    // Memoized

    func maximumJumps(_ nums: [Int], _ target: Int) -> Int {
        func find(_ ind: Int, _ nums: [Int], _ tar: Int, _ dp: inout [Int]) -> Int {
            if ind == nums.count - 1 {
                return 0
            }

            if dp[ind] != -1 {
                return dp[ind]
            }

            var ans = Int.min

            for i in (ind + 1)..<nums.count {
                if abs(nums[i] - nums[ind]) <= tar {
                    ans = max(ans, 1 + find(i, nums, tar, &dp))
                }
            }
            dp[ind] = ans
            return dp[ind]
        }

        var dp = [Int](repeating: -1, count: nums.count)
        let ans = find(0, nums, target, &dp)
        return ans > 0 ? ans : -1
    }
}
