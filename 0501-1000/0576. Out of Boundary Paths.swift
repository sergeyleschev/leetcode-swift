class Solution {

    // Solution by Sergey Leschev

    // 576. Out of Boundary Paths
    // There is an m x n grid with a ball. The ball is initially at the position [startRow, startColumn]. You are allowed to move the ball to one of the four adjacent four cells in the grid (possibly out of the grid crossing the grid boundary). You can apply at most maxMove moves to the ball.
    // Given the five integers m, n, maxMove, startRow, startColumn, return the number of paths to move the ball out of the grid boundary. Since the answer can be very large, return it modulo 109 + 7.

    // Example 1:
    // Input: m = 2, n = 2, maxMove = 2, startRow = 0, startColumn = 0
    // Output: 6

    // Example 2:
    // Input: m = 1, n = 3, maxMove = 3, startRow = 0, startColumn = 1
    // Output: 12

    // Constraints:
    // 1 <= m, n <= 50
    // 0 <= maxMove <= 50
    // 0 <= startRow <= m
    // 0 <= startColumn <= n

    // - Complexity:
    //   - time: O(mnN)
    //   - space: O(mn)

    func findPaths(_ m: Int, _ n: Int, _ N: Int, _ i: Int, _ j: Int) -> Int {
        if N == 0 { return 0 }
        let mod = Int(1e9 + 7)
        let dir = [0, 1, 0, -1, 0]
        var count = 0
        var dp = Array( repeating: Array(repeating: 0, count: n), count: m)

        dp[i][j] = 1
        for moves in 1...N {
            var temp = Array( repeating: Array(repeating: 0, count: n), count: m )
            for r in 0..<m {
                for c in 0..<n {
                    if r == m - 1 { count = (count + dp[r][c]) % mod }
                    if c == n - 1 { count = (count + dp[r][c]) % mod }
                    if r == 0 { count = (count + dp[r][c]) % mod }
                    if c == 0 { count = (count + dp[r][c]) % mod }
                    temp[r][c] = ((
                        (r > 0 ? dp[r - 1][c] : 0) + (c > 0 ? dp[r][c - 1] : 0)
                    ) % mod + (
                        (r < m - 1 ? dp[r + 1][c] : 0) + (c < n - 1 ? dp[r][c + 1] : 0)
                    ) % mod) % mod
                }
            }
            dp = temp
        }

        return count
    }
    
}