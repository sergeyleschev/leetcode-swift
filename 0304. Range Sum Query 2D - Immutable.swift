class NumMatrix {

    // 304. Range Sum Query 2D - Immutable
    // Given a 2D matrix matrix, handle multiple queries of the following type:
    // Calculate the sum of the elements of matrix inside the rectangle defined by its upper left corner (row1, col1) and lower right corner (row2, col2).
    // Implement the NumMatrix class:
    // NumMatrix(int[][] matrix) Initializes the object with the integer matrix matrix.
    // int sumRegion(int row1, int col1, int row2, int col2) Returns the sum of the elements of matrix inside the rectangle defined by its upper left corner (row1, col1) and lower right corner (row2, col2).

    // Example 1:
    // Input
    // ["NumMatrix", "sumRegion", "sumRegion", "sumRegion"]
    // [[[[3, 0, 1, 4, 2], [5, 6, 3, 2, 1], [1, 2, 0, 1, 5], [4, 1, 0, 1, 7], [1, 0, 3, 0, 5]]], [2, 1, 4, 3], [1, 1, 2, 2], [1, 2, 2, 4]]
    // Output
    // [null, 8, 11, 12]
    // Explanation
    // NumMatrix numMatrix = new NumMatrix([[3, 0, 1, 4, 2], [5, 6, 3, 2, 1], [1, 2, 0, 1, 5], [4, 1, 0, 1, 7], [1, 0, 3, 0, 5]]);
    // numMatrix.sumRegion(2, 1, 4, 3); // return 8 (i.e sum of the red rectangle)
    // numMatrix.sumRegion(1, 1, 2, 2); // return 11 (i.e sum of the green rectangle)
    // numMatrix.sumRegion(1, 2, 2, 4); // return 12 (i.e sum of the blue rectangle)

    // Constraints:
    // m == matrix.length
    // n == matrix[i].length
    // 1 <= m, n <= 200
    // -10^5 <= matrix[i][j] <= 10^5
    // 0 <= row1 <= row2 < m
    // 0 <= col1 <= col2 < n
    // At most 10^4 calls will be made to sumRegion.
    
    private var sums:[[Int]] = []


    init(_ matrix: [[Int]]) {
        for i in 0..<matrix.count {
            sums.append(Array(repeating: 0, count: matrix[i].count))
            for j in 0..<matrix[i].count {
                var sum = 0
                if i > 0 { sum += sums[i-1][j] }
                if j > 0 { sum += sums[i][j-1] }
                if i > 0 && j > 0 { sum -= sums[i-1][j-1] }
                sum += matrix[i][j]
                sums[i][j] = sum
            }
        }
    }
    
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        var ans = sums[row2][col2]
        
        if row1 > 0 { ans -= sums[row1-1][col2] }
        if col1 > 0 { ans -= sums[row2][col1-1] }
        if col1 > 0 && row1 > 0 { ans += sums[row1-1][col1-1] }
        return ans
    }
    
}

/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */