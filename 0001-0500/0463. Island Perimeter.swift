class Solution {

    // Solution by Sergey Leschev

    // 463. Island Perimeter
    // You are given row x col grid representing a map where grid[i][j] = 1 represents land and grid[i][j] = 0 represents water.
    // Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells).
    // The island doesn't have "lakes", meaning the water inside isn't connected to the water around the island. One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.

    // Determines the perimeter of the island.

    // - Parameter grid: A map of the island, where 1 represents land and 0 represents water.
    // - Returns: The perimeter of the island.

    // Example 1:
    // Input: grid = [[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]
    // Output: 16
    // Explanation: The perimeter is the 16 yellow stripes in the image above.

    // Example 2:
    // Input: grid = [[1]]
    // Output: 4

    // Example 3:
    // Input: grid = [[1,0]]
    // Output: 4

    // Constraints:
    // row == grid.length
    // col == grid[i].length
    // 1 <= row, col <= 100
    // grid[i][j] is 0 or 1.

    // - Complexity:
    //   - time: O(n * m), where n is the number of rows in the grid, and m is the number of columns in the grid.
    //   - space: O(1), only constant space is used.

    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var ans = 0

        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                guard grid[i][j] == 1 else { continue }
                ans += 4
                if i > 0, grid[i - 1][j] == 1 { ans -= 2 }
                if j > 0, grid[i][j - 1] == 1 { ans -= 2 }
            }
        }

        return ans
    }

}
