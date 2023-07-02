class Solution {

    // Solution by Sergey Leschev

    // 1091. Shortest Path in Binary Matrix
    // Given an n x n binary matrix grid, return the length of the shortest clear path in the matrix. If there is no clear path, return -1.
    // A clear path in a binary matrix is a path from the top-left cell (i.e., (0, 0)) to the bottom-right cell (i.e., (n - 1, n - 1)) such that:
    // All the visited cells of the path are 0.
    // All the adjacent cells of the path are 8-directionally connected (i.e., they are different and they share an edge or a corner).
    // The length of a clear path is the number of visited cells of this path.

    // Finds the length of the shortest clear path from top-left to bottom-right.

    // - Parameter grid: The grid.
    // - Returns: The length of the shortest path, if a path does not exist returns -1.

    // Example 1:
    // Input: grid = [[0,1],[1,0]]
    // Output: 2

    // Example 2:
    // Input: grid = [[0,0,0],[1,1,0],[1,1,0]]
    // Output: 4

    // Example 3:
    // Input: grid = [[1,0,0],[1,1,0],[1,1,0]]
    // Output: -1

    // Constraints:
    // n == grid.length
    // n == grid[i].length
    // 1 <= n <= 100
    // grid[i][j] is 0 or 1

    // - Complexity:
    //   - time: O(n * m), where n is the number of rows in the grid, and m is the number of columns in the grid.
    //   - space: O(n * m), where n is the number of rows in the grid, and m is the number of columns in the grid.

    private let directions: [(x: Int, y: Int)] = [
        (-1, -1), (-1, 0), (-1, 1), (0, -1), (0, 1), (1, -1), (1, 0), (1, 1),
    ]

    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        var grid = grid
        let n = grid.count
        let m = grid[0].count
        guard grid[0][0] == 0, grid[n - 1][m - 1] == 0 else { return -1 }
        var queue = [(x: Int, y: Int)]()
        grid[0][0] = 1
        queue.append((0, 0))

        while !queue.isEmpty {
            let (x, y) = queue.removeFirst()

            guard x != n - 1 || y != m - 1 else { return grid[x][y] }

            for direction in directions {
                let newX = x + direction.x
                let newY = y + direction.y
                guard isValid(newX, newY, n, m, grid) else { continue }
                queue.append((newX, newY))
                grid[newX][newY] = grid[x][y] + 1
            }
        }

        return -1
    }

    private func isValid(_ x: Int, _ y: Int, _ n: Int, _ m: Int, _ grid: [[Int]]) -> Bool {
        x >= 0 && y >= 0 && x < n && y < m && grid[x][y] == 0
    }

}
