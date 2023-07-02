class Solution {

    // Solution by Sergey Leschev

    // 980. Unique Paths III
    // On a 2-dimensional grid, there are 4 types of squares:
    // 1 represents the starting square.  There is exactly one starting square.
    // 2 represents the ending square.  There is exactly one ending square.
    // 0 represents empty squares we can walk over.
    // -1 represents obstacles that we cannot walk over.
    // Return the number of 4-directional walks from the starting square to the ending square, that walk over every non-obstacle square exactly once.

    // Finds the number of 4-directional walks from the starting square to the ending square, that walk over every non-obstacle square exactly once.

    // - Parameter grid: 2-dimensional grid.
    // - Returns: The number of 4-directional walks.

    // Example 1:
    // Input: [[1,0,0,0],[0,0,0,0],[0,0,2,-1]]
    // Output: 2
    // Explanation: We have the following two paths:
    // 1. (0,0),(0,1),(0,2),(0,3),(1,3),(1,2),(1,1),(1,0),(2,0),(2,1),(2,2)
    // 2. (0,0),(1,0),(2,0),(2,1),(1,1),(0,1),(0,2),(0,3),(1,3),(1,2),(2,2)

    // Example 2:
    // Input: [[1,0,0,0],[0,0,0,0],[0,0,0,2]]
    // Output: 4
    // Explanation: We have the following four paths:
    // 1. (0,0),(0,1),(0,2),(0,3),(1,3),(1,2),(1,1),(1,0),(2,0),(2,1),(2,2),(2,3)
    // 2. (0,0),(0,1),(1,1),(1,0),(2,0),(2,1),(2,2),(1,2),(0,2),(0,3),(1,3),(2,3)
    // 3. (0,0),(1,0),(2,0),(2,1),(2,2),(1,2),(1,1),(0,1),(0,2),(0,3),(1,3),(2,3)
    // 4. (0,0),(1,0),(2,0),(2,1),(1,1),(0,1),(0,2),(0,3),(1,3),(1,2),(2,2),(2,3)

    // Example 3:
    // Input: [[0,1],[2,0]]
    // Output: 0
    // Explanation:
    // There is no path that walks over every empty square exactly once.
    // Note that the starting and ending square can be anywhere in the grid.

    // Note:
    // 1 <= grid.length * grid[0].length <= 20

    // - Complexity:
    //   - time: O(3^n), where n is the number of cells in the grid.
    //   - space: O(n), where n is the number of cells in the grid.

    func uniquePathsIII(_ grid: [[Int]]) -> Int {
        var nonObstacles = 0
        var start = (row: 0, col: 0)
        var grid = grid
        var ans = 0

        for row in 0..<grid.count {
            for col in 0..<grid[row].count {
                guard grid[row][col] != -1 else { continue }
                if grid[row][col] == 1 { start = (row, col) }
                nonObstacles += 1
            }
        }

        backtrack(start.row, start.col, &grid, nonObstacles, &ans)
        return ans
    }

    private func backtrack(
        _ row: Int, _ col: Int, _ grid: inout [[Int]], _ nonObstacles: Int, _ ans: inout Int
    ) {
        if grid[row][col] == 2 {
            if nonObstacles == 1 { ans += 1 }
            return
        }

        let tmp = grid[row][col]
        grid[row][col] = -1
        let rowOffsets = [0, 0, 1, -1]
        let colOffsets = [1, -1, 0, 0]

        for i in 0..<4 {
            let nextRow = row + rowOffsets[i]
            let nextCol = col + colOffsets[i]

            guard nextRow >= 0, nextRow < grid.count, nextCol >= 0, nextCol < grid[nextRow].count
            else { continue }
            guard grid[nextRow][nextCol] >= 0 else { continue }
            backtrack(nextRow, nextCol, &grid, nonObstacles - 1, &ans)
        }

        grid[row][col] = tmp
    }

}
