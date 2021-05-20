class Solution {

    // 74. Search a 2D Matrix
    // Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
    // Integers in each row are sorted from left to right.
    // The first integer of each row is greater than the last integer of the previous row.

    // Finds if a value exists in an m x n matrix.

    // - Parameters:
    //   - matrix: The matrix.
    //   - target: The target value.
    // - Returns: True if target exists in the matrix, otherwise returns false.
     
    // Example 1:
    // Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
    // Output: true

    // Example 2:
    // Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
    // Output: false
     

    // Constraints:
    // m == matrix.length
    // n == matrix[i].length
    // 1 <= m, n <= 100
    // -10^4 <= matrix[i][j], target <= 10^4

    // - Complexity:
    //   - time: O(log(nm)), where n is the number of rows in the matrix, and m is the number of columns in the matrix.
    //   - space: O(1), only constant space is used.
    
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard !matrix.isEmpty else { return false }

        let m = matrix.count
        let n = matrix[0].count

        var left = 0
        var right = m * n - 1

        while left <= right {
            let mid = left + (right - left) / 2

            let el = matrix[mid / n][mid % n]
            guard el != target else { return true }

            if el < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        return false
    }

}