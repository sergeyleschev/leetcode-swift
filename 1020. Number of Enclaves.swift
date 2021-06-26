class Solution {

    // 1020. Number of Enclaves
    // You are given an m x n binary matrix grid, where 0 represents a sea cell and 1 represents a land cell.
    // A move consists of walking from one land cell to another adjacent (4-directionally) land cell or walking off the boundary of the grid.
    // Return the number of land cells in grid for which we cannot walk off the boundary of the grid in any number of moves.

    // Example 1:
    // Input: grid = [[0,0,0,0],[1,0,1,0],[0,1,1,0],[0,0,0,0]]
    // Output: 3
    // Explanation: There are three 1s that are enclosed by 0s, and one 1 that is not enclosed because its on the boundary.

    // Example 2:
    // Input: grid = [[0,1,1,0],[0,0,1,0],[0,0,1,0],[0,0,0,0]]
    // Output: 0
    // Explanation: All 1s are either on the boundary or can reach the boundary.

    // Constraints:
    // m == grid.length
    // n == grid[i].length
    // 1 <= m, n <= 500
    // grid[i][j] is either 0 or 1.

    struct Position: Hashable {
        var x: Int
        var y: Int
    }

    typealias Direction = (dx: Int, dy: Int)

    let directions: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    
    
    func numEnclaves(_ A: [[Int]]) -> Int {
        let row = A.count
        let col = A[0].count
        if row == 1 || col == 1 { return 0 }
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: col), count: row)
        var ans = 0


        func valid(_ p: Position) -> Bool { p.x < row && p.x >= 0  && p.y >= 0 && p.y < col && A[p.x][p.y] == 1 && !visited[p.x][p.y] }
        
        func dfs(_ p: Position)  {
            for dir in directions {
                let newP = Position(x: p.x + dir.dx, y: p.y + dir.dy)
                if valid(newP) {
                    visited[newP.x][newP.y] = true
                    dfs(newP)
                }
            }
        }

        for i in 0..<col {
            if A[0][i] == 1 && !visited[0][i] {
                visited[0][i] =  true
                dfs(Position(x: 0, y: i))
            }
            if A[row - 1][i] == 1 && !visited[row - 1][i] {
                visited[row - 1][i] =  true
                dfs(Position(x: row - 1, y: i))
            }
        }

        for i in 0..<row {
            if A[i][0] == 1 && !visited[i][0] {
                visited[i][0] = true
                dfs(Position(x: i, y: 0))
            }
            if A[i][col - 1] == 1 && !visited[i][col - 1] {
                visited[i][col - 1] = true
                dfs(Position(x: i, y: col - 1))
            }
        }

        for i in 0..<row {
            for j in 0..<col where A[i][j] == 1 && !visited[i][j] { ans += 1 }
        }

        return ans
    }

}