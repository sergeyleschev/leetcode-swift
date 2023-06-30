class Solution {

    // Solution by Sergey Leschev

    // 1277. Count Square Submatrices with All Ones
    // Given a m * n matrix of ones and zeros, return how many square submatrices have all ones.

    // Example 1:
    // Input: matrix =
    // [
    //   [0,1,1,1],
    //   [1,1,1,1],
    //   [0,1,1,1]
    // ]
    // Output: 15
    // Explanation: 
    // There are 10 squares of side 1.
    // There are 4 squares of side 2.
    // There is  1 square of side 3.
    // Total number of squares = 10 + 4 + 1 = 15.

    // Example 2:
    // Input: matrix = 
    // [
    //   [1,0,1],
    //   [1,1,0],
    //   [1,1,0]
    // ]
    // Output: 7
    // Explanation: 
    // There are 6 squares of side 1.  
    // There is 1 square of side 2. 
    // Total number of squares = 6 + 1 = 7.

    // Constraints:
    // 1 <= arr.length <= 300
    // 1 <= arr[0].length <= 300
    // 0 <= arr[i][j] <= 1

    // - Complexity:
    //   - time: O(n^2)
    
    // DP Solution

    func countSquares(_ matrix: [[Int]]) -> Int {
        var m: Int = matrix.count
        var n: Int = matrix[0].count
        var dp: [[Int]] = matrix.map{$0}
        var result: Int = 0

        for i in 0..<m {
            for j in 0..<n {
                if i > 0 && j > 0 && dp[i][j] >= 1 {
                    dp[i][j] = min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]) + 1
                }
                result += dp[i][j]
            }
        }

        return result
    }

}