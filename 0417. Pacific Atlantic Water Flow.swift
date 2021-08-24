class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 417. Pacific Atlantic Water Flow
    // You are given an m x n integer matrix heights representing the height of each unit cell in a continent. The Pacific ocean touches the continent's left and top edges, and the Atlantic ocean touches the continent's right and bottom edges.
    // Water can only flow in four directions: up, down, left, and right. Water flows from a cell to an adjacent one with an equal or lower height.
    // Return a list of grid coordinates where water can flow to both the Pacific and Atlantic oceans.

    // Finds the list of grid coordinates where water can flow to both the
    // Pacific and Atlantic oceans.

    // - Parameter matrix: Matrix of non-negative integers.
    // - Returns: The list of grid coordinates.

    // Example 1:
    // Input: heights = [[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]]
    // Output: [[0,4],[1,3],[1,4],[2,2],[3,0],[3,1],[4,0]]

    // Example 2:
    // Input: heights = [[2,1],[1,2]]
    // Output: [[0,0],[0,1],[1,0],[1,1]]

    // Constraints:
    // m == heights.length
    // n == heights[i].length
    // 1 <= m, n <= 200
    // 1 <= heights[i][j] <= 10^5

    // - Complexity:
    //   - time: O(n * m), where n is the number of rows, and m is the number of columns.
    //   - space: O(n * m), where n is the number of rows, and m is the number of columns.

    private let directions: [(row: Int, col: Int)] = [(0, 1), (1, 0), (-1, 0), (0, -1)]
    private var rows = 0
    private var cols = 0
    private var landHeights = [[Int]]()
    
    
    func pacificAtlantic(_ matrix: [[Int]]) -> [[Int]] {
        guard !matrix.isEmpty, !matrix[0].isEmpty else { return [] }
        var ans = [[Int]]()
        rows = matrix.count
        cols = matrix[0].count
        landHeights = matrix
        var pacificReachable = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
        var atlanticReachable = [[Bool]](repeating: [Bool](repeating: false, count: cols), count: rows)
        
        for i in 0..<rows {
            dfs(i, 0, &pacificReachable)
            dfs(i, cols - 1, &atlanticReachable)
        }
        
        for i in 0..<cols {
            dfs(0, i, &pacificReachable)
            dfs(rows - 1, i, &atlanticReachable)
        }
        
        for i in 0..<rows {
            for j in 0..<cols {
                guard pacificReachable[i][j], atlanticReachable[i][j] else { continue }
                ans.append([i, j])
            }
        }
        return ans
    }
    

    private func dfs(_ row: Int, _ col: Int, _ reachable: inout [[Bool]]) {
        reachable[row][col] = true
        
        for direction in directions {
            let newRow = row + direction.row
            let newCol = col + direction.col
            
            guard newRow >= 0, newRow < rows,
                    newCol >= 0, newCol < cols,
                    !reachable[newRow][newCol],
                    landHeights[newRow][newCol] >= landHeights[row][col]
            else { continue }
            dfs(newRow, newCol, &reachable)
        }
    }

}