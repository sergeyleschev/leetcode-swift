class Solution {

    // 695. Max Area of Island
    // You are given an m x n binary matrix grid. An island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.
    // The area of an island is the number of cells with a value 1 in the island.
    // Return the maximum area of an island in grid. If there is no island, return 0.

    // Example 1:
    // Input: grid = [[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]]
    // Output: 6
    // Explanation: The answer is not 11, because the island must be connected 4-directionally.

    // Example 2:
    // Input: grid = [[0,0,0,0,0,0,0,0]]
    // Output: 0

    // Constraints:
    // m == grid.length
    // n == grid[i].length
    // 1 <= m, n <= 50
    // grid[i][j] is either 0 or 1.
    
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        if grid.isEmpty || grid[0].isEmpty { return 0 }
        let m = grid.count
        var n = grid[0].count
        var grid = grid
        var maxArea = 0

        
        func dfs(_ i: Int, _ j: Int) -> Int {
            if i < 0 || i >= m || j < 0 || j >= n { return 0 }
            if grid[i][j] == 0 { return 0 }
            grid[i][j] = 0 // mark as visited
            return 1 + dfs(i - 1, j) + dfs(i + 1, j) + dfs(i, j - 1) + dfs(i, j + 1)
        }
        
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 { maxArea = max(maxArea, dfs(i, j)) }
            }
        }
        
        return maxArea
    }
    
}