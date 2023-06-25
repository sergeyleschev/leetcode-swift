class Solution {

    // Solution @ Sergey Leschev

    // 1329. Sort the Matrix Diagonally
    // A matrix diagonal is a diagonal line of cells starting from some cell in either the topmost row or leftmost column and going in the bottom-right direction until reaching the matrix's end. For example, the matrix diagonal starting from mat[2][0], where mat is a 6 x 3 matrix, includes cells mat[2][0], mat[3][1], and mat[4][2].
    // Given an m x n matrix mat of integers, sort each matrix diagonal in ascending order and return the resulting matrix.

    // Sorts each matrix diagonal in ascending order.

    // - Parameter mat: The matrix.
    // - Returns: The matrix with sorted diagonals.

    // Example 1:
    // Input: mat = [[3,3,1,1],[2,2,1,2],[1,1,1,2]]
    // Output: [[1,1,1,1],[1,2,2,2],[1,2,3,3]]

    // Example 2:
    // Input: mat = [[11,25,66,1,69,7],[23,55,17,45,15,52],[75,31,36,44,58,8],[22,27,33,25,68,4],[84,28,14,11,5,50]]
    // Output: [[5,17,4,1,52,7],[11,11,25,45,8,69],[14,23,25,44,58,15],[22,27,31,36,50,66],[84,28,75,33,55,68]]

    // Constraints:
    // m == mat.length
    // n == mat[i].length
    // 1 <= m, n <= 100
    // 1 <= mat[i][j] <= 100

    // - Complexity:
    //   - time: O(n * m * log(min(n, m))), where n is the number of rows in the mat, and m is the number of columns in the mat.
    //   - space: O(n * m), where n is the number of rows in the mat, and m is the number of columns in the mat.
    
    func diagonalSort(_ mat: [[Int]]) -> [[Int]] {
        var mat = mat
        let n = mat.count
        let m = mat[0].count
        
        for i in 0..<n { sortDiagonal(in: &mat, i: i, j: 0, n: n, m: m) }
        for j in 0..<m { sortDiagonal(in: &mat, i: 0, j: j, n: n, m: m) }
        
        return mat
    }
    
    
    private func sortDiagonal(in mat: inout [[Int]], i: Int, j: Int, n: Int, m: Int) {
        var diagonal = [Int]()
        var i = i
        var j = j
        
        while i < n, j < m {
            diagonal.append(mat[i][j])
            i += 1
            j += 1
        }
        
        diagonal.sort()
        
        while i > 0, j > 0 {
            i -= 1
            j -= 1
            mat[i][j] = diagonal.removeLast()
        }
    }

}