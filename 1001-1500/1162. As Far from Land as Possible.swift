class Solution {

    // Solution by Sergey Leschev

    // 1162. As Far from Land as Possible
    // Given an n x n grid containing only values 0 and 1, where 0 represents water and 1 represents land, find a water cell such that its distance to the nearest land cell is maximized, and return the distance. If no land or water exists in the grid, return -1.
    // The distance used in this problem is the Manhattan distance: the distance between two cells (x0, y0) and (x1, y1) is |x0 - x1| + |y0 - y1|.

    // Example 1:
    // Input: grid = [[1,0,1],[0,0,0],[1,0,1]]
    // Output: 2
    // Explanation: The cell (1, 1) is as far as possible from all the land with distance 2.

    // Example 2:
    // Input: grid = [[1,0,0],[0,0,0],[0,0,0]]
    // Output: 4
    // Explanation: The cell (2, 2) is as far as possible from all the land with distance 4.

    // Constraints:
    // n == grid.length
    // n == grid[i].length
    // 1 <= n <= 100
    // grid[i][j] is 0 or 1

    func maxDistance(_ grid: [[Int]]) -> Int {
        if grid.count == 0 { return -1 }
        let row = grid.count
        let col = grid[0].count
        var queue = [[Int]]()
        var distance = -1
        let directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]

        for i in 0..<row {
            for j in 0..<col where grid[i][j] == 1 { queue.append([i, j]) }
        }
        
        if queue.count == 0 || queue.count == row * col { return -1 }
        var arr = grid

        while queue.count > 0 {
            distance += 1
            var size = queue.count
            while size > 0 {
                let x = queue[0][0]
                let y = queue[0][1]
                queue.removeFirst()
                for i in 0..<4 {
                    let mx = x + directions[i][0]
                    let my = y + directions[i][1]
                    if mx < 0 || mx >= row || my < 0 || my >= col || arr[mx][my] != 0 { continue }
                    arr[mx][my] = 2
                    queue.append([mx, my])
                }
                size -= 1
            }
        }
        
        return distance
    }

}