class Solution {

    // Solution by Sergey Leschev

    // 240. Search a 2D Matrix II
    // Write an efficient algorithm that searches for a target value in an m x n integer matrix. The matrix has the following properties:
    // Integers in each row are sorted in ascending from left to right.
    // Integers in each column are sorted in ascending from top to bottom.
     
    // Example 1:
    // Input: matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 5
    // Output: true

    // Example 2:
    // Input: matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 20
    // Output: false

    // Constraints:
    // m == matrix.length
    // n == matrix[i].length
    // 1 <= n, m <= 300
    // -10^9 <= matix[i][j] <= 10^9
    // All the integers in each row are sorted in ascending order.
    // All the integers in each column are sorted in ascending order.
    // -10^9 <= target <= 10^9
    
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let row = matrix.count
        let col = matrix[0].count
        

        func search(_ matrix: [[Int]], _ start: (Int, Int), _ end: (Int, Int)) -> Bool {
            if start.0 < 0 || start.1 < 0 || start.0 >= row || start.1 >= col {  return false }
            if end.0 < 0 || end.1 < 0 || end.0 >= row || end.1 >= col { return false }
            
            if matrix[start.0][start.1] > target || matrix[end.0][end.1] < target { return false }
            
            var i = start.0
            var j = start.1
            
            while i <= end.0 && j <= end.1 {
                if matrix[i][j] == target {
                    return true
                } else if matrix[i][j] < target {
                    i += 1
                    j += 1
                } else { break }
            }
            
            let startA = (i, start.1)
            let endA = (end.0, j - 1)
            let startB = (start.0, j)
            let endB = (i - 1, end.1)
            
            return search(matrix, startA, endA) || search(matrix, startB, endB)
        }
        
        return search(matrix, (0, 0), (row - 1, col - 1))
    }

}