class Solution {

    // Solution @ Sergey Leschev

    // 1314. Matrix Block Sum
    // Given a m x n matrix mat and an integer k, return a matrix answer where each answer[i][j] is the sum of all elements mat[r][c] for:
    // i - k <= r <= i + k,
    // j - k <= c <= j + k, and
    // (r, c) is a valid position in the matrix.

    // Example 1:
    // Input: mat = [[1,2,3],[4,5,6],[7,8,9]], k = 1
    // Output: [[12,21,16],[27,45,33],[24,39,28]]

    // Example 2:
    // Input: mat = [[1,2,3],[4,5,6],[7,8,9]], k = 2
    // Output: [[45,45,45],[45,45,45],[45,45,45]]

    // Constraints:
    // m == mat.length
    // n == mat[i].length
    // 1 <= m, n, k <= 100
    // 1 <= mat[i][j] <= 100

    func matrixBlockSum(_ mat: [[Int]], _ K: Int) -> [[Int]] {
        let m = mat.count, n = mat.first?.count ?? 0
        guard m > 0 && n > 0 else { return [] }
        
        var dp = mat
        for i in 0..<m {
            for j in 1..<n { dp[i][j] = dp[i][j - 1] + dp[i][j] }
        }
        
        for i in 1..<m {
            for j in 0..<n { dp[i][j] = dp[i - 1][j] + dp[i][j] }
        }

        var ans = mat
        for i in 0..<m {
            for j in 0..<n {
                // i = 2 j = 0 K = 1
                if i <= K && j <= K {
                    ans[i][j] = dp[min(i + K, m - 1)][min(j + K, n - 1)]
                } else if i > K && j <= K {
                    ans[i][j] = dp[min(i + K, m - 1)][min(j + K, n - 1)] - dp[i - K - 1][min(j + K, n - 1)]
                } else if j > K && i <= K {
                    ans[i][j] = dp[min(i + K, m - 1)][min(j + K, n - 1)] - dp[min(i + K, m - 1)][j - K - 1]
                } else {
                    ans[i][j] = dp[min(i + K, m - 1)][min(j + K, n - 1)] - dp[i - K - 1][min(j + K, n - 1)]  - dp[min(i + K, m - 1)][j - K - 1] + dp[i - K - 1][j - K - 1]
                }
            }
        }
        
        return ans
    }

}