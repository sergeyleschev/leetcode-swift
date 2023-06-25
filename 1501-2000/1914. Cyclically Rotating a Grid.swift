class Solution {

    // Solution @ Sergey Leschev

    // 1914. Cyclically Rotating a Grid
    // You are given an m x n integer matrix grid, where m and n are both even integers, and an integer k.
    // The matrix is composed of several layers, which is shown in the below image, where each color is its own layer:
    // A cyclic rotation of the matrix is done by cyclically rotating each layer in the matrix. To cyclically rotate a layer once, each element in the layer will take the place of the adjacent element in the counter-clockwise direction. An example rotation is shown below:

    // Return the matrix after applying k cyclic rotations to it.

    // Example 1:
    // Input: grid = [[40,10],[30,20]], k = 1
    // Output: [[10,20],[40,30]]
    // Explanation: The figures above represent the grid at every state.

    // Example 2:
    // Input: grid = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]], k = 2
    // Output: [[3,4,8,12],[2,11,10,16],[1,7,6,15],[5,9,13,14]]
    // Explanation: The figures above represent the grid at every state.

    // Constraints:
    // m == grid.length
    // n == grid[i].length
    // 2 <= m, n <= 50
    // Both m and n are even integers.
    // 1 <= grid[i][j] <= 5000
    // 1 <= k <= 10^9

    func rotateGrid(_ grid: [[Int]], _ k: Int) -> [[Int]] {
        let m = grid.count
        let n = grid[0].count
        let cyclesCnt = min(m, n) >> 1
        var ans = grid

        for cycle in 0..<cyclesCnt {
            var rows = [Int]()
            var cols = [Int]()
            var values = [Int]()
            
            for i in cycle..<(m - 1 - cycle) {
                rows.append(i)
                cols.append(cycle)
                values.append(grid[i][cycle])
            }
            for j in cycle..<(n - cycle - 1) {
                rows.append(m - cycle - 1)
                cols.append(j)
                values.append(grid[m - cycle - 1][j])
            }
            for i in stride(from: m - cycle - 1, to: cycle, by: -1) {
                rows.append(i)
                cols.append(n - cycle - 1)
                values.append(grid[i][n - cycle - 1])
            }
            for j in stride(from: n - cycle - 1, to: cycle, by: -1) {
                rows.append(cycle)
                cols.append(j)
                values.append(grid[cycle][j])
            }
            
            let total = values.count
            let kk = k % total
            for i in 0..<total {
                let idx = (i + total - kk) % total
                ans[rows[i]][cols[i]] = values[idx]
            }
        }
        return ans
    }

}