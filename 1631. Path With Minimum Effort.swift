class Solution {

    // 1631. Path With Minimum Effort
    // You are a hiker preparing for an upcoming hike. You are given heights, a 2D array of size rows x columns, where heights[row][col] represents the height of cell (row, col). You are situated in the top-left cell, (0, 0), and you hope to travel to the bottom-right cell, (rows-1, columns-1) (i.e., 0-indexed). You can move up, down, left, or right, and you wish to find a route that requires the minimum effort.
    // A route's effort is the maximum absolute difference in heights between two consecutive cells of the route.

    // Return the minimum effort required to travel from the top-left cell to the bottom-right cell.

    // - Parameter heights: The heights of cells.
    // - Returns: The minimum effort.

    // Example 1:
    // Input: heights = [[1,2,2],[3,8,2],[5,3,5]]
    // Output: 2
    // Explanation: The route of [1,3,5,3,5] has a maximum absolute difference of 2 in consecutive cells.
    // This is better than the route of [1,2,2,2,5], where the maximum absolute difference is 3.

    // Example 2:
    // Input: heights = [[1,2,3],[3,8,4],[5,3,5]]
    // Output: 1
    // Explanation: The route of [1,2,3,4,5] has a maximum absolute difference of 1 in consecutive cells, which is better than route [1,3,5,3,5].

    // Example 3:
    // Input: heights = [[1,2,1,1,1],[1,2,1,2,1],[1,2,1,2,1],[1,2,1,2,1],[1,1,1,2,1]]
    // Output: 0
    // Explanation: This route does not require any effort.

    // Constraints:
    // rows == heights.length
    // columns == heights[i].length
    // 1 <= rows, columns <= 100
    // 1 <= heights[i][j] <= 10^6

    // - Complexity:
    //   - time: O(n * m), where n is the number of rows in the matrix height, and m is the number of columns in the matrix height.
    //   - space: O(n * m), where n is the number of rows in the matrix height, and m is the number of columns in the matrix height.

    private let directions: [(x: Int, y: Int)] = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    
    
    func minimumEffortPath(_ heights: [[Int]]) -> Int {
        let n = heights.count
        let m = heights[0].count
        var left = 0
        var right = 1_000_000
        var ans = right
        
        while left <= right {
            let mid = left + (right - left) / 2
            var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
            if dfs(0, 0, heights, &visited, n, m, mid) {
                ans = min(ans, mid)
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return ans
    }
    

    private func dfs(_ x: Int, _ y: Int, _ heights: [[Int]], _ visited: inout [[Bool]], _ row: Int, _ col: Int, _ mid: Int) -> Bool {
        guard x != row - 1 || y != col - 1 else { return true }
        
        visited[x][y] = true
        for direction in directions {
            let adjacentX = x + direction.x
            let adjacentY = y + direction.y
            
            guard isValidCell(adjacentX, adjacentY, row, col), !visited[adjacentX][adjacentY] else { continue }
                
            var diff = abs(heights[adjacentX][adjacentY] - heights[x][y])
            guard diff <= mid, dfs(adjacentX, adjacentY, heights, &visited, row, col, mid) else { continue }
            return true
        }
        return false
    }
    
    private func isValidCell(_ x: Int, _ y: Int, _ row: Int, _ col: Int) -> Bool { x >= 0 && x < row && y >= 0 && y < col }

}