class Solution {

    // Solution @ Sergey Leschev

    // 934. Shortest Bridge
    // In a given 2D binary array grid, there are two islands.  (An island is a 4-directionally connected group of 1s not connected to any other 1s.)
    // Now, we may change 0s to 1s so as to connect the two islands together to form 1 island.
    // Return the smallest number of 0s that must be flipped.  (It is guaranteed that the answer is at least 1.)

    // Example 1:
    // Input: grid = [[0,1],[1,0]]
    // Output: 1

    // Example 2:
    // Input: grid = [[0,1,0],[0,0,0],[0,0,1]]
    // Output: 2

    // Example 3:
    // Input: grid = [[1,1,1,1,1],[1,0,0,0,1],[1,0,1,0,1],[1,0,0,0,1],[1,1,1,1,1]]
    // Output: 1

    // Constraints:
    // 2 <= grid.length == grid[0].length <= 100
    // grid[i][j] == 0 or grid[i][j] == 1
    
    func shortestBridge(_ A: [[Int]]) -> Int {
        let m = A.count, n = A[0].count
        let dirs = [(1, 0), (0, 1), (-1, 0), (0, -1)]
        var q = [(Int, Int)] ()
        var A = A
        var found = false
        
        for i in 0..<m {
            if (found) { break }
            for j in 0..<n {
                if (A[i][j] == 0) { continue }
                q = getIsland(&A, i, j, m - 1, n - 1, dirs)
                found = true
                break
            }
        }
        
        var step = 0
        
        while !q.isEmpty {
            var size = q.count
            while size > 0 {
                size -= 1
                let cur = q.removeFirst()
                for dir in dirs {
                    let i = cur.0 + dir.0
                    let j = cur.1 + dir.1
                    
                    if (i >= 0 && j >= 0 && i < m && j < n && A[i][j] != 3) {
                        if (A[i][j] == 1) { return step }
                        q.append((i, j))
                        A[i][j] = 3
                    }
                }
            }
            step += 1
        }
        
        return -1;
    }
    
    
    func getIsland(_ board: inout [[Int]], _ x: Int, _ y: Int,_ height: Int,_ width: Int,_ dirs: [(Int,Int)]) -> [(Int,Int)] {
        var result = [(Int,Int)] ()
        var countMediterranean = 0

        board[x][y] = 3
        
        for dir in dirs {
            let nextX = x + dir.0
            let nextY = y + dir.1
            
            if nextX < 0 || nextY < 0 || nextX > height || nextY > width || board[nextX][nextY] == 3 {
                countMediterranean += 1
                continue
            }
            
            if board[nextX][nextY] == 1 {
                countMediterranean += 1
                result.append(contentsOf: getIsland(&board, nextX, nextY, height, width, dirs))
            }
        }
        
        if countMediterranean < 4 { result.insert((x,y), at: 0) }
        return result
    }
    
}