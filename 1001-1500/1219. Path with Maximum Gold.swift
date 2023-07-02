class Solution {

    // Solution by Sergey Leschev

    // 1219. Path with Maximum Gold
    // In a gold mine grid of size m x n, each cell in this mine has an integer representing the amount of gold in that cell, 0 if it is empty.
    // Return the maximum amount of gold you can collect under the conditions:
    // Every time you are located in a cell you will collect all the gold in that cell.
    // From your position, you can walk one step to the left, right, up, or down.
    // You can't visit the same cell more than once.
    // Never visit a cell with 0 gold.
    // You can start and stop collecting gold from any position in the grid that has some gold.

    // Example 1:
    // Input: grid = [[0,6,0],[5,8,7],[0,9,0]]
    // Output: 24
    // Explanation:
    // [[0,6,0],
    //  [5,8,7],
    //  [0,9,0]]
    // Path to get the maximum gold, 9 -> 8 -> 7.

    // Example 2:
    // Input: grid = [[1,0,7],[2,0,6],[3,4,5],[0,3,0],[9,0,20]]
    // Output: 28
    // Explanation:
    // [[1,0,7],
    //  [2,0,6],
    //  [3,4,5],
    //  [0,3,0],
    //  [9,0,20]]
    // Path to get the maximum gold, 1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7.

    // Constraints:
    // m == grid.length
    // n == grid[i].length
    // 1 <= m, n <= 15
    // 0 <= grid[i][j] <= 100
    // There are at most 25 cells containing gold.

    func getMaximumGold(_ grid: [[Int]]) -> Int {
        var maxSum = 0
        let n = grid.count
        guard let m = grid.first?.count else { return maxSum }
        let dx = [1, 0, -1, 0]
        let dy = [0, 1, 0, -1]

        func dig(_ x: Int, _ y: Int, _ sum: Int, _ visited: inout [[Bool]]) {
            maxSum = max(sum, maxSum)
            for index in 0..<dx.count {
                let xx = x + dx[index]
                let yy = y + dy[index]
                if xx >= 0, xx < n, yy >= 0, yy < m, grid[xx][yy] > 0, visited[xx][yy] == false {
                    visited[xx][yy] = true
                    dig(xx, yy, sum + grid[xx][yy], &visited)
                    visited[xx][yy] = false
                }
            }
        }

        for x in 0..<n {
            for y in 0..<m {
                if grid[x][y] == 0 { continue }
                var visited = Array(repeating: Array(repeating: false, count: m), count: n)
                visited[x][y] = true
                dig(x, y, grid[x][y], &visited)
            }
        }

        return maxSum
    }

}
