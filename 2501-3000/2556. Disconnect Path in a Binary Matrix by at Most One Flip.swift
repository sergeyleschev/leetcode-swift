class Solution {

    // Solution by Sergey Leschev
    // 2556. Disconnect Path in a Binary Matrix by at Most One Flip
    // Time complexity: O(M * N)
    // Space complexity: O(1)

    func isPossibleToCutPath(_ grid: [[Int]]) -> Bool {
        func dfs(_ grid: inout [[Int]], _ i: Int, _ j: Int) -> Bool {
            if i + 1 == grid.count && j + 1 == grid[0].count {
                return true
            }
            if i >= grid.count || j >= grid[0].count || grid[i][j] == 0 {
                return false
            }
            grid[i][j] = 0
            return dfs(&grid, i + 1, j) || dfs(&grid, i, j + 1)
        }

        var mutableGrid = grid
        if !dfs(&mutableGrid, 0, 0) {
            return true
        }
        mutableGrid[0][0] = 1
        return !dfs(&mutableGrid, 0, 0)
    }
}
