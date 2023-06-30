class Solution {

    // Solution by Sergey Leschev

    // 1391. Check if There is a Valid Path in a Grid
    // Given a m x n grid. Each cell of the grid represents a street. The street of grid[i][j] can be:
    // 1 which means a street connecting the left cell and the right cell.
    // 2 which means a street connecting the upper cell and the lower cell.
    // 3 which means a street connecting the left cell and the lower cell.
    // 4 which means a street connecting the right cell and the lower cell.
    // 5 which means a street connecting the left cell and the upper cell.
    // 6 which means a street connecting the right cell and the upper cell.
    // You will initially start at the street of the upper-left cell (0,0). A valid path in the grid is a path which starts from the upper left cell (0,0) and ends at the bottom-right cell (m - 1, n - 1). The path should only follow the streets.
    // Notice that you are not allowed to change any street.

    // Return true if there is a valid path in the grid or false otherwise.

    // Example 1:
    // Input: grid = [[2,4,3],[6,5,2]]
    // Output: true
    // Explanation: As shown you can start at cell (0, 0) and visit all the cells of the grid to reach (m - 1, n - 1).

    // Example 2:
    // Input: grid = [[1,2,1],[1,2,1]]
    // Output: false
    // Explanation: As shown you the street at cell (0, 0) is not connected with any street of any other cell and you will get stuck at cell (0, 0)

    // Example 3:
    // Input: grid = [[1,1,2]]
    // Output: false
    // Explanation: You will get stuck at cell (0, 1) and you cannot reach cell (0, 2).

    // Example 4:
    // Input: grid = [[1,1,1,1,1,1,3]]
    // Output: true

    // Example 5:
    // Input: grid = [[2],[2],[2],[2],[2],[2],[6]]
    // Output: true

    // Constraints:
    // m == grid.length
    // n == grid[i].length
    // 1 <= m, n <= 300
    // 1 <= grid[i][j] <= 6

    // Using BFS to visit all the possible cells from start point (0, 0)
     
    // The key part is at each valid cell, try through all the possble next cell (xx, yy) based on the rules and current cell (x, y).

    // When checking the validation of next cell, need to check
    // If (xx, yy) is not out of current matrix.
    // If (xx, yy) has not been visited before, otherwise, duplicates will be added, it would be unlimited cells to visit, which results exceeds time limit.
    // If (xx, yy) is able to getting back to (x, y), otherwise, it's not valid, which means it should be connected well.

    // - Complexity:
    //   - time: O(n * m)
    //   - space: O(n * m)
    //     which is the number of rows and number of colums in the 2-dimension array.

    func hasValidPath(_ grid: [[Int]]) -> Bool {
        let n = grid.count
        guard n > 0, let m = grid.first?.count, m > 0 else { return false }
        var marked = Array(repeating: Array(repeating: false, count: m), count: n) // Mark the cell if it has been visited
        let dirs = [(0, -1), (-1, 0), (0, 1), (1 ,0)] // List of direction options: Left, Up, Right, Down
        let rules = [ [], [0, 2], [1, 3], [0, 3], [2, 3], [0, 1], [1, 2] ] // Map cell number to corresponding direction options
        var queue = [(0, 0)]

        marked[0][0] = true
        
        while queue.isEmpty == false {
            let (x, y) = queue.removeFirst()

            if x == n - 1, y == m - 1 { return true }
            
            for ruleChoice in rules[grid[x][y]] {
                let xx = x + dirs[ruleChoice].0
                let yy = y + dirs[ruleChoice].1
               
                if xx >= 0, xx < n, yy >= 0, yy < m, marked[xx][yy] == false, rules[grid[xx][yy]].contains((ruleChoice + 2) % dirs.count) {
                    marked[xx][yy] = true
                    queue.append((xx, yy))
                }
            }
        }

        return false
    }

}