class Solution {

    // Solution by Sergey Leschev

    // 1559. Detect Cycles in 2D Grid
    // Given a 2D array of characters grid of size m x n, you need to find if there exists any cycle consisting of the same value in grid.
    // A cycle is a path of length 4 or more in the grid that starts and ends at the same cell. From a given cell, you can move to one of the cells adjacent to it - in one of the four directions (up, down, left, or right), if it has the same value of the current cell.
    // Also, you cannot move to the cell that you visited in your last move. For example, the cycle (1, 1) -> (1, 2) -> (1, 1) is invalid because from (1, 2) we visited (1, 1) which was the last visited cell.

    // Return true if any cycle of the same value exists in grid, otherwise, return false.

    // Example 1:
    // Input: grid = [["a","a","a","a"],["a","b","b","a"],["a","b","b","a"],["a","a","a","a"]]
    // Output: true
    // Explanation: There are two valid cycles shown in different colors in the image below:

    // Example 2:
    // Input: grid = [["c","c","c","a"],["c","d","c","c"],["c","c","e","c"],["f","c","c","c"]]
    // Output: true
    // Explanation: There is only one valid cycle highlighted in the image below:

    // Example 3:
    // Input: grid = [["a","b","b"],["b","z","b"],["b","b","a"]]
    // Output: false

    // Constraints:
    // m == grid.length
    // n == grid[i].length
    // 1 <= m <= 500
    // 1 <= n <= 500
    // grid consists only of lowercase English letters.

    private let  directions = [1, 0, -1, 0, 1]


    func containsCycle(_ grid: [[Character]]) -> Bool {
        var gridCopy = grid.map { $0.map { $0.asciiValue! } }
        let m = grid.count
        let n = grid[0].count

        for r in 0..<m {
            for c in 0..<n {
                if gridCopy[r][c] >= 97 {
                    let target = gridCopy[r][c]
                    var queue = [Int]()
                    queue.append(r << 16 | c)

                    while !queue.isEmpty {
                        var nextLevel = [Int]()
                        for p in queue {
                            let x = p >> 16
                            let y = p & 0xffff
                            if gridCopy[x][y] < 97 { return true }
                            gridCopy[x][y] -= 26
                            for j in 0..<4 {
                                let nextX = x + directions[j]
                                let nextY = y + directions[j + 1]
                                if nextX >= 0 && nextX < m && nextY >= 0 && nextY < n && gridCopy[nextX][nextY] == target {
                                    nextLevel.append(nextX << 16 | nextY)
                                }
                            }
                        }
                        queue = nextLevel
                    }
                }
            }
        }
        return false
    }

}