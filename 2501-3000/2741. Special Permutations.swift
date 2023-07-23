class Solution {

    // Solution by Sergey Leschev
    // 2741. Special Permutations

    var dp = [[Int]]()

    func solve(_ nums: [Int], _ prevIndex: Int, _ currentIndex: Int, _ mask: Int) -> Int {
        if currentIndex == nums.count {
            return 1
        }
        if dp[prevIndex + 1][mask] != -1 {
            return dp[prevIndex + 1][mask]
        }
        var tot = 0
        for j in 0..<nums.count {
            if mask & (1 << j) != 0 {
                continue
            }
            if prevIndex == -1 || nums[prevIndex] % nums[j] == 0 || nums[j] % nums[prevIndex] == 0 {
                tot += solve(nums, j, currentIndex + 1, mask | (1 << j))
                tot %= 1_000_000_007
            }
        }
        dp[prevIndex + 1][mask] = tot
        return dp[prevIndex + 1][mask]
    }

    func specialPerm(_ nums: [Int]) -> Int {
        dp = Array(repeating: Array(repeating: -1, count: 1 << 14), count: 20)
        return solve(nums, -1, 0, 0)
    }
}
