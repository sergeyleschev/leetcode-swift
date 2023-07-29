class Solution {

    // Solution by Sergey Leschev
    // 2658. Maximum Number of Fish in a Grid
    // DFS

    let dir = [[1, 0], [0, 1], [-1, 0], [0, -1]]

    func dfs(_ grid: inout [[Int]], _ r: Int, _ c: Int) -> Int {
        guard r >= 0 && c >= 0 && r < grid.count && c < grid[0].count && grid[r][c] > 0 else {
            return 0
        }

        var res = grid[r][c]
        grid[r][c] = 0

        for d in dir {
            res += dfs(&grid, r + d[0], c + d[1])
        }

        return res
    }

    func findMaxFish(_ grid: [[Int]]) -> Int {
        var ans = 0
        var mutableGrid = grid

        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                ans = max(ans, dfs(&mutableGrid, i, j))
            }
        }

        return ans
    }
}
