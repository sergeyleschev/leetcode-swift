class Solution {

    // Solution @ Sergey Leschev

    // 63. Unique Paths II
    // A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
    // The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
    // Now consider if some obstacles are added to the grids. How many unique paths would there be?
    // An obstacle and space is marked as 1 and 0 respectively in the grid.

    // Example 1:
    // Input: obstacleGrid = [[0,0,0],[0,1,0],[0,0,0]]
    // Output: 2
    // Explanation: There is one obstacle in the middle of the 3x3 grid above.
    // There are two ways to reach the bottom-right corner:
    // 1. Right -> Right -> Down -> Down
    // 2. Down -> Down -> Right -> Right

    // Example 2:
    // Input: obstacleGrid = [[0,1],[0,0]]
    // Output: 1
     
    // Constraints:
    // m == obstacleGrid.length
    // n == obstacleGrid[i].length
    // 1 <= m, n <= 100
    // obstacleGrid[i][j] is 0 or 1.

    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: obstacleGrid[0].count), count: obstacleGrid.count)
        
        matrix[0][0] = 1
        for i in 0..<obstacleGrid.count {
            for j in 0..<obstacleGrid[0].count {
                if i > 0 { matrix[i][j] += matrix[i - 1][j] }
                if j > 0 { matrix[i][j] += matrix[i][j - 1] }
                if obstacleGrid[i][j] == 1 { matrix[i][j] = 0 }
            }
        }
        
        return matrix[obstacleGrid.count - 1][obstacleGrid[0].count - 1]
    }
    
}