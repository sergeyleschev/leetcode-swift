class Solution {

    // Solution by Sergey Leschev

    // 200. Number of Islands
    // Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.
    // An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

    // Example 1:
    // Input: grid = [
    //   ["1","1","1","1","0"],
    //   ["1","1","0","1","0"],
    //   ["1","1","0","0","0"],
    //   ["0","0","0","0","0"]
    // ]
    // Output: 1

    // Example 2:
    // Input: grid = [
    //   ["1","1","0","0","0"],
    //   ["1","1","0","0","0"],
    //   ["0","0","1","0","0"],
    //   ["0","0","0","1","1"]
    // ]
    // Output: 3

    // Constraints:
    // m == grid.length
    // n == grid[i].length
    // 1 <= m, n <= 300
    // grid[i][j] is '0' or '1'.

    func numIslands(_ grid: [[Character]]) -> Int {
        guard grid.count > 0 else { return 0 }

        var grid = grid
        var output = 0

        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == "1" {
                    output += 1
                    removeIsland(&grid, i, j)
                }
            }
        }

        return output
    }

    func removeIsland(_ grid: inout [[Character]], _ i: Int, _ j: Int) {
        guard i >= 0, j >= 0, i < grid.count, j < grid[i].count, grid[i][j] == "1" else { return }

        grid[i][j] = "0"

        removeIsland(&grid, i, j + 1)
        removeIsland(&grid, i + 1, j)
        removeIsland(&grid, i, j - 1)
        removeIsland(&grid, i - 1, j)
    }

}
