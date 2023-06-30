class Solution {

    // Solution by Sergey Leschev

    // 1034. Coloring A Border
    // Given a 2-dimensional grid of integers, each value in the grid represents the color of the grid square at that location.
    // Two squares belong to the same connected component if and only if they have the same color and are next to each other in any of the 4 directions.
    // The border of a connected component is all the squares in the connected component that are either 4-directionally adjacent to a square not in the component, or on the boundary of the grid (the first or last row or column).
    // Given a square at location (r0, c0) in the grid and a color, color the border of the connected component of that square with the given color, and return the final grid.

    // Example 1:
    // Input: grid = [[1,1],[1,2]], r0 = 0, c0 = 0, color = 3
    // Output: [[3, 3], [3, 2]]

    // Example 2:
    // Input: grid = [[1,2,2],[2,3,2]], r0 = 0, c0 = 1, color = 3
    // Output: [[1, 3, 3], [2, 3, 3]]

    // Example 3:
    // Input: grid = [[1,1,1],[1,1,1],[1,1,1]], r0 = 1, c0 = 1, color = 2
    // Output: [[2, 2, 2], [2, 1, 2], [2, 2, 2]]

    // Note:
    // 1 <= grid.length <= 50
    // 1 <= grid[0].length <= 50
    // 1 <= grid[i][j] <= 1000
    // 0 <= r0 < grid.length
    // 0 <= c0 < grid[0].length
    // 1 <= color <= 1000

    private let dx = [0, 0, 1, -1]
    private let dy = [1, -1, 0, 0]


    func colorBorder(_ grid: [[Int]], _ r0: Int, _ c0: Int, _ color: Int) -> [[Int]] {
        let M = grid.count
        let N = grid[0].count
        var ans = grid
        let targetColor = grid[r0][c0]
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: M)


        func valid(_ x: Int,_ y: Int) -> Bool { x >= 0 &&  y >= 0 && x < M  &&  y < N }
        

        func isToBeColoured(_ x: Int,_ y: Int)  -> Bool {
            if x == 0 || y == 0 || x == M - 1 || y == N - 1 { return  true }
            for i in 0..<4 where grid[x  + dx[i]][y + dy[i]] != targetColor { return true }
            return false
        }

        
        func dfs(_ x: Int,_ y: Int) {
            if isToBeColoured(x,y) { ans[x][y] = color }
            for i in 0..<4 {
                let nextX = x + dx[i]
                let nextY = y + dy[i]
                if valid(nextX,nextY) && targetColor ==  grid[nextX][nextY] && !visited[nextX][nextY]{
                    visited[nextX][nextY] = true
                    dfs(nextX, nextY)
                }
            }
        }
        
        dfs(r0, c0)
        return ans
    }

 }