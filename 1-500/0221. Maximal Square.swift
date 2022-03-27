class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 221. Maximal Square
    // Given an m x n binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area.

    // Example 1:
    // Input: matrix = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
    // Output: 4

    // Example 2:
    // Input: matrix = [["0","1"],["1","0"]]
    // Output: 1

    // Example 3:
    // Input: matrix = [["0"]]
    // Output: 0

    // Constraints:
    // m == matrix.length
    // n == matrix[i].length
    // 1 <= m, n <= 300
    // matrix[i][j] is '0' or '1'.

    func maximalSquare(_ matrix: [[Character]]) -> Int {
        var maximal = 0 //  length
        let row = matrix.count
        let col = matrix[0].count
        var dp: [[(Int, Int, Int)]] = Array(repeating: Array(repeating: (0, 0, 0), count: col), count: row)
        
        for i in 0..<row {
            for j in 0..<col {
                if matrix[i][j] == "0" {
                    dp[i][j] = (0, 0, 0)
                } else {
                    if i == 0 || j == 0 {
                        let x = (i > 0 ? dp[i - 1][j].1 : 0) + 1
                        let y = (j > 0 ? dp[i][j - 1].2 : 0) + 1
                        dp[i][j] = (1, x, y)
                    } else {
                        dp[i][j] = (min(1 + dp[i - 1][j - 1].0, 1 + dp[i - 1][j].1, 1 + dp[i][j - 1].2), 1 + dp[i - 1][j].1, 1 + dp[i][j - 1].2)
                    }
                }
                maximal = max(dp[i][j].0, maximal)
            }
        }
        
        return maximal * maximal
    }
    
}