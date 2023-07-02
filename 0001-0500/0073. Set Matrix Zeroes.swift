class Solution {

    // Solution by Sergey Leschev

    // 73. Set Matrix Zeroes
    // Given an m x n matrix. If an element is 0, set its entire row and column to 0. Do it in-place.

    // Follow up:
    // A straight forward solution using O(mn) space is probably a bad idea.
    // A simple improvement uses O(m + n) space, but still not the best solution.
    // Could you devise a constant space solution?

    // Example 1:
    // Input: matrix = [[1,1,1],[1,0,1],[1,1,1]]
    // Output: [[1,0,1],[0,0,0],[1,0,1]]

    // Example 2:
    // Input: matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
    // Output: [[0,0,0,0],[0,4,5,0],[0,3,1,0]]

    // Constraints:
    // m == matrix.length
    // n == matrix[0].length
    // 1 <= m, n <= 200
    // -2^31 <= matrix[i][j] <= 2^31 - 1

    func setZeroes(_ matrix: inout [[Int]]) {
        let row = matrix.count
        let col = matrix[0].count

        for i in 0..<row {
            for j in 0..<col {
                if matrix[i][j] == 0 {
                    setMax(&matrix, i, j)
                }
            }
        }

        for i in 0..<row {
            for j in 0..<col {
                if matrix[i][j] != 0 {
                    resetMax(&matrix, i, j)
                }
            }
        }
    }

    func setMax(_ matrix: inout [[Int]], _ row: Int, _ col: Int) {
        for i in 0..<matrix.count {
            let val = matrix[i][col]
            matrix[i][col] = val == 0 ? 0 : Int.max
        }

        for j in 0..<matrix[0].count {
            let val = matrix[row][j]
            matrix[row][j] = val == 0 ? 0 : Int.max
        }
    }

    func resetMax(_ matrix: inout [[Int]], _ row: Int, _ col: Int) {
        let val = matrix[row][col]
        if val == Int.max { matrix[row][col] = 0 }
    }

}
