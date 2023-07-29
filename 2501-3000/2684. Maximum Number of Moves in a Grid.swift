class Solution {

    // Solution by Sergey Leschev
    // 2684. Maximum Number of Moves in a Grid
    // Top Down DP
    // Time complexity: O(mn)
    // Space complexity: O(mn)

    func maxMoves(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        let dirs = [(0, 1), (1, 1), (-1, 1)]

        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)

        func dfs(_ i: Int, _ j: Int) -> Int {
            if dp[i][j] > 0 {
                return dp[i][j]
            }

            var ans = 0
            for (x, y) in dirs {
                let ni = i + x
                let nj = j + y
                if ni >= 0, ni < m, nj >= 0, nj < n, grid[i][j] < grid[ni][nj] {
                    ans = max(ans, 1 + dfs(ni, nj))
                }
            }

            dp[i][j] = ans
            return ans
        }

        var maxMoves = 0
        for i in 0..<m {
            maxMoves = max(maxMoves, dfs(i, 0))
        }

        return maxMoves
    }
}
