class Solution {

    // Solution by Sergey Leschev
    // 2547. Minimum Cost to Split an Array

    func minCost(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var trimmedLen = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        var dp = [Int](repeating: -1, count: n)

        // Calculate trimmedLen
        for i in 0..<n {
            var count = 0
            var mp = [Int](repeating: 0, count: 1001)
            for j in i..<n {
                let num = nums[j]
                if mp[num] != 0 {
                    if mp[num] == 1 {
                        count += 2
                    } else {
                        count += 1
                    }
                }
                mp[num] += 1
                trimmedLen[i][j] = count
            }
        }

        func solve(_ start: Int) -> Int {
            if start >= n {
                return 0
            }
            if dp[start] != -1 {
                return dp[start]
            }

            var minAns = Int.max
            for end in start..<n {
                let curr = k + trimmedLen[start][end]
                let nextMin = solve(end + 1)
                let total = curr + nextMin
                minAns = min(minAns, total)
            }
            dp[start] = minAns
            return minAns
        }

        return solve(0)
    }
}
