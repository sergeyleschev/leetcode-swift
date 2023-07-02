class Solution {

    // Solution by Sergey Leschev

    // 1594. Maximum Non Negative Product in a Matrix
    // You are given a rows x cols matrix grid. Initially, you are located at the top-left corner (0, 0), and in each step, you can only move right or down in the matrix.
    // Among all possible paths starting from the top-left corner (0, 0) and ending in the bottom-right corner (rows - 1, cols - 1), find the path with the maximum non-negative product. The product of a path is the product of all integers in the grid cells visited along the path.
    // Return the maximum non-negative product modulo 109 + 7. If the maximum product is negative return -1.
    // Notice that the modulo is performed after getting the maximum product.

    // Example 1:
    // Input: grid = [[-1,-2,-3],
    //                [-2,-3,-3],
    //                [-3,-3,-2]]
    // Output: -1
    // Explanation: It's not possible to get non-negative product in the path from (0, 0) to (2, 2), so return -1.

    // Example 2:
    // Input: grid = [[1,-2,1],
    //                [1,-2,1],
    //                [3,-4,1]]
    // Output: 8
    // Explanation: Maximum non-negative product is in bold (1 * 1 * -2 * -4 * 1 = 8).

    // Example 3:
    // Input: grid = [[1, 3],
    //                [0,-4]]
    // Output: 0
    // Explanation: Maximum non-negative product is in bold (1 * 0 * -4 = 0).

    // Example 4:
    // Input: grid = [[ 1, 4,4,0],
    //                [-2, 0,0,1],
    //                [ 1,-1,1,1]]
    // Output: 2
    // Explanation: Maximum non-negative product is in bold (1 * -2 * 1 * -1 * 1 * 1 = 2).

    // Constraints:
    // 1 <= rows, cols <= 15
    // -4 <= grid[i][j] <= 4

    private let mod = 1_000_000_007
    private typealias Answer = (min: Int, max: Int)

    func maxProductPath(_ grid: [[Int]]) -> Int {
        guard !grid.isEmpty else { return -1 }
        guard !grid[0].isEmpty else { return -1 }
        let m = grid.count
        let n = grid[0].count

        guard m * n > 1 else { return grid[0][0] >= 0 ? grid[0][0] : -1 }
        var dp: [[Answer]] = [[Answer]](
            repeating: [Answer](repeating: (Int.max, Int.min), count: n), count: m)
        dp[0][0] = (grid[0][0], grid[0][0])

        if m > 1 {
            for r in 1..<m {
                let t = grid[r][0] * dp[r - 1][0].max
                dp[r][0] = (t, t)
            }
        }

        if n > 1 {
            for c in 1..<n {
                let t = grid[0][c] * dp[0][c - 1].min
                dp[0][c] = (t, t)
            }
        }

        guard m > 1 && n > 1 else {
            return dp[m - 1][n - 1].max >= 0 ? dp[m - 1][n - 1].max % mod : -1
        }
        for r in 1..<m {
            for c in 1..<n {
                let ans = [
                    grid[r][c] * dp[r - 1][c].min, grid[r][c] * dp[r - 1][c].max,
                    grid[r][c] * dp[r][c - 1].min, grid[r][c] * dp[r][c - 1].max,
                ]
                dp[r][c] = (ans.min()!, ans.max()!)
            }
        }
        return dp[m - 1][n - 1].max >= 0 ? dp[m - 1][n - 1].max % mod : -1
    }

}
