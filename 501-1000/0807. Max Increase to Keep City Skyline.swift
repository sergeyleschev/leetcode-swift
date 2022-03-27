class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 807. Max Increase to Keep City Skyline
    // You are given an n x n integer matrix grid where grid[i][j] represents the height of a building located there. We are allowed to increase the height of any number of buildings, by any amount (the amounts can be different for different buildings). Height 0 is considered to be a building as well.
    // In the end, the skyline when viewed from all four directions of the grid (i.e., top, bottom, left, and right) must be the same as the skyline of the original grid. A city's skyline is the outer contour of the rectangles formed by all the buildings when viewed from a distance.
    // Return the maximum total sum that the height of the buildings can be increased.
    // Note that all buildings in grid[i][j] occupy the entire grid cell: that is, they are a 1 x 1 x grid[i][j] rectangular prism.

    // Example 1:
    // Input: grid = [[3,0,8,4],[2,4,5,7],[9,2,6,3],[0,3,1,0]]
    // Output: 35
    // Explanation: 
    // The skyline viewed from top or bottom is: [9, 4, 8, 7]
    // The skyline viewed from left or right is: [8, 7, 9, 3]
    // The grid after increasing the height of buildings without affecting skylines is:
    // gridNew = [ [8, 4, 8, 7],
    //             [7, 4, 7, 7],
    //             [9, 4, 8, 7],
    //             [3, 3, 3, 3] ]

    // Example 2:
    // Input: grid = [[0,0,0],[0,0,0],[0,0,0]]
    // Output: 0

    // Constraints:
    // n == grid.length
    // n == grid[i].length
    // 2 <= n <= 50
    // 0 <= grid[i][j] <= 100

    func maxIncreaseKeepingSkyline(_ grid: [[Int]]) -> Int {
        guard grid.count != 0 else { return 0 }
        let m = grid.count
        let n = grid[0].count
        var topBot = [Int](repeatElement(0, count: n))
        var leftRight = [Int](repeatElement(0, count: m))
        var res = 0
        
        for i in 0..<topBot.count {
            for j in 0..<grid[i].count { topBot[i] = max(topBot[i], grid[i][j]) }
        }
        
        for i in 0..<leftRight.count {
            for j in 0..<grid[i].count { leftRight[i] = max(grid[j][i], leftRight[i]) }
        }
        
        var dp = [[Int]](repeatElement([Int](repeatElement(0, count: n)), count: m))
        
        for i in 0..<m {
            for j in 0..<n {
                dp[i][j] = min(topBot[j], leftRight[i])
                res += (dp[i][j] - grid[i][j])
            }
        }
        
        return res
    }

}