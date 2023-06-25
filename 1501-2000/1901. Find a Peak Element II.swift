class Solution {

    // Solution @ Sergey Leschev

    // 1901. Find a Peak Element II
    // A peak element in a 2D grid is an element that is strictly greater than all of its adjacent neighbors to the left, right, top, and bottom.
    // Given a 0-indexed m x n matrix mat where no two adjacent cells are equal, find any peak element mat[i][j] and return the length 2 array [i,j].
    // You may assume that the entire matrix is surrounded by an outer perimeter with the value -1 in each cell.
    // You must write an algorithm that runs in O(m log(n)) or O(n log(m)) time.

    // Example 1:
    // Input: mat = [[1,4],[3,2]]
    // Output: [0,1]
    // Explanation: Both 3 and 4 are peak elements so [1,0] and [0,1] are both acceptable answers.

    // Example 2:
    // Input: mat = [[10,20,15],[21,30,14],[7,16,32]]
    // Output: [1,1]
    // Explanation: Both 30 and 32 are peak elements so [1,1] and [2,2] are both acceptable answers.

    // Constraints:
    // m == mat.length
    // n == mat[i].length
    // 1 <= m, n <= 500
    // 1 <= mat[i][j] <= 10^5
    // No two adjacent cells are equal.

    func findPeakGrid(_ mat: [[Int]]) -> [Int] {
        let m = mat.count
        let n = mat[0].count
        var i = 0
        var j = 0

        while true {
            if i + 1 < m && mat[i + 1][j] > mat[i][j] { i += 1; continue }
            if i - 1 >= 0 && mat[i - 1][j] > mat[i][j] { i -= 1; continue }
            if j + 1 < n && mat[i][j + 1] > mat[i][j] { j += 1; continue }
            if j - 1 >= 0 && mat[i][j - 1] > mat[i][j] { j -= 1; continue }
            break
        }
        return [i, j]
    }
    
}