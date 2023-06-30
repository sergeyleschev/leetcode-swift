class Solution {

    // Solution by Sergey Leschev

    // 827. Making A Large Island
    // You are given an n x n binary matrix grid. You are allowed to change at most one 0 to be 1.
    // Return the size of the largest island in grid after applying this operation.
    // An island is a 4-directionally connected group of 1s.

    // Example 1:
    // Input: grid = [[1,0],[0,1]]
    // Output: 3
    // Explanation: Change one 0 to 1 and connect two 1s, then we get an island with area = 3.

    // Example 2:
    // Input: grid = [[1,1],[1,0]]
    // Output: 4
    // Explanation: Change the 0 to 1 and make the island bigger, only one island with area = 4.

    // Example 3:
    // Input: grid = [[1,1],[1,1]]
    // Output: 4
    // Explanation: Can't change any 0 to 1, only one island with area = 4.

    // Constraints:
    // n == grid.length
    // n == grid[i].length
    // 1 <= n <= 500
    // grid[i][j] is either 0 or 1.

    func largestIsland(_ grid: [[Int]]) -> Int {
        var space = [[Int]]()
        let rows = grid.endIndex
        let cols = grid[0].endIndex
        var id = 0
        let direction = [0,1,0,-1,0]
        var cellToId = [[Int]: Int]()
        var idToCount = [Int: Int]()
        var res = 0
        var grid = grid

        for i in 0..<rows {
            for j in 0..<cols {
                if grid[i][j] == 0 {
                    space.append([i,j])
                } else if grid[i][j] == 1{
                    var count = 0
                    var queue = [[i,j]]
                    
                    while !queue.isEmpty {
                        let curr = queue.removeFirst()
                        let x = curr[0]
                        let y = curr[1]
                        grid[x][y] = -1
                        cellToId[[x,y]] = id
                        count += 1
                        for k in 0..<4 {
                            let newX = x + direction[k], newY = y + direction[k+1]
                            guard newX >= 0 && newX < rows && newY >= 0 && newY < cols && grid[newX][newY] == 1 else { continue }
                            grid[newX][newY] = -1
                            queue.append([newX,newY])
                        }
                    }
                    idToCount[id] = count
                    res = max(res, count)
                    id += 1
                }
            }
        }
    
        for item in space {
            let x = item[0], y = item[1]
            var idSet = Set<Int>()
            for k in 0..<4 {
                let newX = x + direction[k], newY = y + direction[k+1]
                guard newX >= 0 && newX < rows && newY >= 0 && newY < cols && grid[newX][newY] == -1 else { continue }
                idSet.insert(cellToId[[newX,newY]]!)
            }
            var count = 1
            for id in idSet {
                count += idToCount[id]!
            }
            res = max(res, count)
        }
        
        return res == 0 ? 1 : res   
    }
    
}