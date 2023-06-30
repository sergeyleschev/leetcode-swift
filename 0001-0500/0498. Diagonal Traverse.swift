class Solution {

    // Solution by Sergey Leschev

    // 498. Diagonal Traverse
    // Given an m x n matrix mat, return an array of all the elements of the array in a diagonal order.

    // Returns all elements of the matrix in a diagonal order.

    // - Parameter matrix: The matrix.
    // - Returns: All elements of the matrix in a diagonal order.

    // Example 1:
    // Input: mat = [[1,2,3],[4,5,6],[7,8,9]]
    // Output: [1,2,4,7,5,3,6,8,9]

    // Example 2:
    // Input: mat = [[1,2],[3,4]]
    // Output: [1,2,3,4]

    // Constraints:
    // m == mat.length
    // n == mat[i].length
    // 1 <= m, n <= 10^4
    // 1 <= m * n <= 10^4
    // -10^5 <= mat[i][j] <= 10^5

    // - Complexity:
    //   - time: O(n * m), where n is the number of rows, and m is the number of columns.
    //   - space: O(n * m), where n is the number of rows, and m is the number of columns.
    
    func findDiagonalOrder(_ matrix: [[Int]]) -> [Int] {
        guard !matrix.isEmpty else { return [] }
        let n = matrix.count
        let m = matrix[0].count
        var ans = [Int](repeating: 0, count: n * m)
        var row = 0
        var col = 0
        var up = true
        var r = 0
        
        while row < n, col < m {
            ans[r] = matrix[row][col]
            r += 1
            
            var newRow = row + (up ? -1 : 1)
            var newCol = col + (up ? 1 : -1)
            
            if newRow < 0 || newRow == n || newCol < 0 || newCol == m {
                if up {
                    row += col == m - 1 ? 1 : 0
                    col += col < m - 1 ? 1 : 0
                } else {
                    col += row == n - 1 ? 1 : 0
                    row += row < n - 1 ? 1 : 0
                }
                up.toggle()
            } else {
                row = newRow
                col = newCol
            }
        }

        return ans
    }

}