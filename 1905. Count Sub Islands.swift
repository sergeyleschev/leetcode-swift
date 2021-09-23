class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1905. Count Sub Islands
    // You are given two m x n binary matrices grid1 and grid2 containing only 0's (representing water) and 1's (representing land). An island is a group of 1's connected 4-directionally (horizontal or vertical). Any cells outside of the grid are considered water cells.
    // An island in grid2 is considered a sub-island if there is an island in grid1 that contains all the cells that make up this island in grid2.

    // Return the number of islands in grid2 that are considered sub-islands.

    // Example 1:
    // Input: grid1 = [[1,1,1,0,0],[0,1,1,1,1],[0,0,0,0,0],[1,0,0,0,0],[1,1,0,1,1]], grid2 = [[1,1,1,0,0],[0,0,1,1,1],[0,1,0,0,0],[1,0,1,1,0],[0,1,0,1,0]]
    // Output: 3
    // Explanation: In the picture above, the grid on the left is grid1 and the grid on the right is grid2.
    // The 1s colored red in grid2 are those considered to be part of a sub-island. There are three sub-islands.

    // Example 2:
    // Input: grid1 = [[1,0,1,0,1],[1,1,1,1,1],[0,0,0,0,0],[1,1,1,1,1],[1,0,1,0,1]], grid2 = [[0,0,0,0,0],[1,1,1,1,1],[0,1,0,1,0],[0,1,0,1,0],[1,0,0,0,1]]
    // Output: 2 
    // Explanation: In the picture above, the grid on the left is grid1 and the grid on the right is grid2.
    // The 1s colored red in grid2 are those considered to be part of a sub-island. There are two sub-islands.

    // Constraints:
    // m == grid1.length == grid2.length
    // n == grid1[i].length == grid2[i].length
    // 1 <= m, n <= 500
    // grid1[i][j] and grid2[i][j] are either 0 or 1.

    private typealias Direction = (dr:Int ,dc: Int)
    private let directions: [Direction] = [(-1,0),(1,0),(0,-1),(0,1)]
    
    
    func countSubIslands(_ grid1: [[Int]], _ grid2: [[Int]]) -> Int {
        let R = grid1.count
        let C = grid1[0].count
        var islandId = 2
        var grid1Copy = grid1
        var ans = 0
        
        func dfs1(_ r: Int, _ c: Int) {
            grid1Copy[r][c] = islandId
            for (dr,dc) in directions {
                let newR = r + dr
                guard newR >= 0 && newR < R else { continue }
                let newC = c + dc
                guard newC >= 0 && newC < C else { continue }
                guard grid1Copy[newR][newC] == 1 else { continue }
                dfs1(newR, newC)
            }
        }
        
        func dfs2(_ r: Int, _ c: Int, _ positions: inout [Int])  {
            grid2Visited[r][c] = true
            positions.append(r << 16 | c)
            for (dr,dc) in directions {
                let newR = r + dr
                guard newR >= 0 && newR < R else { continue }
                let newC = c + dc
                guard newC >= 0 && newC < C else { continue }
                guard grid2[newR][newC] == 1 && !grid2Visited[newR][newC] else { continue }
                dfs2(newR, newC, &positions)
            }
        }
        
        func check(_ positions: [Int]) -> Bool {
            let target = grid1Copy[positions[0] >> 16][positions[0] & 0xffff]
            guard target >= 2 else { return false }
            for position in positions {
                let r = position >> 16
                let c = position & 0xffff
                guard grid1Copy[r][c] == target else { return false }
            }
            return true
        }

        
        for r in 0..<R {
            for c in 0..<C where grid1Copy[r][c] == 1 {
                islandId += 1
                dfs1(r, c)
            }
        }
        
        var grid2Visited = [[Bool]](repeating: [Bool](repeating: false, count: C), count: R)
        
        for r in 0..<R {
            for c in 0..<C {
                if grid2[r][c] == 1 && !grid2Visited[r][c] {
                    var islandsPositions = [Int]()
                    dfs2(r, c, &islandsPositions)
                    if check(islandsPositions) { ans += 1 }
                }
            }
        }
        return ans
    }

}