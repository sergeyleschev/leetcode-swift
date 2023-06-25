class Solution {

    // Solution @ Sergey Leschev

    // 64. Minimum Path Sum
    // Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right, which minimizes the sum of all numbers along its path.
    // Note: You can only move either down or right at any point in time.

    // Finds a path from top left to bottom right, which minimizes the sum of all
    // numbers along its path.
    //
    // - Parameter grid: The grid.
    // - Returns: The minimum path sum.

    // Example 1:
    // Input: grid = [[1,3,1],[1,5,1],[4,2,1]]
    // Output: 7
    // Explanation: Because the path 1 → 3 → 1 → 1 → 1 minimizes the sum.

    // Example 2:
    // Input: grid = [[1,2,3],[4,5,6]]
    // Output: 12

    // Constraints:
    // m == grid.length
    // n == grid[i].length
    // 1 <= m, n <= 200
    // 0 <= grid[i][j] <= 100

    // - Complexity:
    //   - time: O(n * m), where n is the number of rows in the grid, and m is the number of columns in the grid.
    //   - space: O(m), where m is the number of columns in the grid.

    func minPathSum(_ grid: [[Int]]) -> Int {
        var matrix: [[Int]] = grid
        let n = grid.count - 1
        let m = grid[0].count - 1
        
        for i in 0...n {
            for j in 0...m {
                var step = matrix[i][j]
        
                if i > 0 && j > 0 {
                    step += min(matrix[i - 1][j], matrix[i][j - 1])
                } else if i > 0 && j == 0 {
                    step += matrix[i - 1][j]
                } else if j > 0 && i == 0 {
                    step += matrix[i][j - 1]
                }
                
                matrix[i][j] = step
            }
        }
        
        return matrix[n][m]
    }

}