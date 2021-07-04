class Solution {

    // 1254. Number of Closed Islands
    // Given a 2D grid consists of 0s (land) and 1s (water).  An island is a maximal 4-directionally connected group of 0s and a closed island is an island totally (all left, top, right, bottom) surrounded by 1s.
    // Return the number of closed islands.

    // Example 1:
    // Input: grid = [[1,1,1,1,1,1,1,0],[1,0,0,0,0,1,1,0],[1,0,1,0,1,1,1,0],[1,0,0,0,0,1,0,1],[1,1,1,1,1,1,1,0]]
    // Output: 2
    // Explanation: 
    // Islands in gray are closed because they are completely surrounded by water (group of 1s).

    // Example 2:
    // Input: grid = [[0,0,1,0,0],[0,1,0,1,0],[0,1,1,1,0]]
    // Output: 1

    // Example 3:
    // Input: grid = [[1,1,1,1,1,1,1],
    //                [1,0,0,0,0,0,1],
    //                [1,0,1,1,1,0,1],
    //                [1,0,1,0,1,0,1],
    //                [1,0,1,1,1,0,1],
    //                [1,0,0,0,0,0,1],
    //                [1,1,1,1,1,1,1]]
    // Output: 2

    // Constraints:
    // 1 <= grid.length, grid[0].length <= 100
    // 0 <= grid[i][j] <=1

    func closedIsland(_ grid: [[Int]]) -> Int {
        if grid.isEmpty { return 0 }
        var grid = grid
        let rows = grid.count
        let cols = grid[0].count
        var count = 0

        for row in 0 ..< rows {
            if grid[row][0] == 0 { dfs(grid: &grid, row: row, col: 0) }
            if grid[row][cols - 1] == 0 { dfs(grid: &grid, row: row, col: cols - 1) }
        }

        for col in 0 ..< cols {
            if grid[0][col] == 0 { dfs(grid: &grid, row: 0, col: col) }
            if grid[rows - 1][col] == 0 { dfs(grid: &grid, row: rows - 1, col: col) }
        }

        for row in 0 ..< rows {
            for col in 0 ..< cols {
                if grid[row][col] == 0 {
                    dfs(grid: &grid, row: row, col: col)
                    count = count + 1
                }
            }
        }

        return count
    }


    func dfs(grid: inout [[Int]], row: Int, col: Int) {
        if row < 0 || row >= grid.count || col < 0 || col >= grid[0].count || grid[row][col] == 1 { return }

        grid[row][col] = 1

        dfs(grid: &grid, row: row, col: col + 1)
        dfs(grid: &grid, row: row + 1, col: col)
        dfs(grid: &grid, row: row, col: col - 1)
        dfs(grid: &grid, row: row - 1, col: col)
    }

}