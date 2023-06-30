class Solution {

    // Solution by Sergey Leschev

    // 1351. Count Negative Numbers in a Sorted Matrix
    // Given a m x n matrix grid which is sorted in non-increasing order both row-wise and column-wise, return the number of negative numbers in grid.

    // Example 1:
    // Input: grid = [[4,3,2,-1],[3,2,1,-1],[1,1,-1,-2],[-1,-1,-2,-3]]
    // Output: 8
    // Explanation: There are 8 negatives number in the matrix.

    // Example 2:
    // Input: grid = [[3,2],[1,0]]
    // Output: 0

    // Example 3:
    // Input: grid = [[1,-1],[-1,-1]]
    // Output: 3

    // Example 4:
    // Input: grid = [[-1]]
    // Output: 1

    // Constraints:
    // m == grid.length
    // n == grid[i].length
    // 1 <= m, n <= 100
    // -100 <= grid[i][j] <= 100

    // - Complexity:
    //   - time: O(m + n).
    //   - space: O(1), only constant space is used.

    func countNegatives(_ grid: [[Int]]) -> Int {
        guard !grid.isEmpty else { return 0 }
        let rowCount = grid.count
        let colCount = grid[0].count
        var row = rowCount - 1
        var col = 0
        var total = 0

        while row >= 0, col < colCount {
            if grid[row][col] < 0 {
                row -= 1
                total += (colCount - col)
            } else {
                col += 1
            }
        }

        return total
    }

}