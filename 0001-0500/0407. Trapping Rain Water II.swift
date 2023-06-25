class Solution {

    // Solution @ Sergey Leschev

    // 407. Trapping Rain Water II
    // Given an m x n integer matrix heightMap representing the height of each unit cell in a 2D elevation map, return the volume of water it can trap after raining.

    // Example 1:
    // Input: heightMap = [[1,4,3,1,3,2],[3,2,1,3,2,4],[2,3,3,2,3,1]]
    // Output: 4
    // Explanation: After the rain, water is trapped between the blocks.
    // We have two small pounds 1 and 3 units trapped.
    // The total volume of water trapped is 4.

    // Example 2:
    // Input: heightMap = [[3,3,3,3,3],[3,2,2,2,3],[3,2,1,2,3],[3,2,2,2,3],[3,3,3,3,3]]
    // Output: 10
     
    // Constraints:
    // m == heightMap.length
    // n == heightMap[i].length
    // 1 <= m, n <= 200
    // 0 <= heightMap[i][j] <= 2 * 10^4

    private typealias Direction = (dx:Int,dy:Int)
    private let directions: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    

    private struct Cell: Comparable {
        var row: Int
        var col: Int
        var height: Int
    
        init(_ r: Int, _ c: Int, _ h: Int) {
            row = r
            col = c
            height = h
        }
    
        static func < (lhs: Solution.Cell, rhs: Solution.Cell) -> Bool {
            return lhs.height < rhs.height
        }
    }

     
    func trapRainWater(_ heightMap: [[Int]]) -> Int {
        let M = heightMap.count
        guard M > 2 else { return 0 }
        let N = heightMap[0].count
        guard N > 2 else { return 0 }
        var queue = Array<Cell>()
        var visited = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: N), count: M)
        var ans = 0

        for i in 0..<N {
            queue.append(Solution.Cell(0, i, heightMap[0][i]))
            queue.append(Solution.Cell(M - 1, i, heightMap[M - 1][i]))
            visited[0][i] = true
            visited[M - 1][i] = true
        }
        
        for i in 1..<(M - 1) {
            queue.append(Solution.Cell(i, 0, heightMap[i][0]))
            queue.append(Solution.Cell(i, N - 1, heightMap[i][N - 1]))
            visited[i][0] = true
            visited[i][N - 1] = true
        }
        
        queue.sort()

        while !queue.isEmpty {
            let cur = queue.removeFirst()
            for dir in directions {
                let r = cur.row + dir.dx
                let c = cur.col + dir.dy
                if r > 0 && r < M - 1 && c > 0 && c < N - 1 && !visited[r][c] {
                    visited[r][c] = true
                    ans += max(0, cur.height - heightMap[r][c])
                    let newCell = Cell(r, c, max(cur.height, heightMap[r][c]))
                    if let index = queue.firstIndex(where: {$0 > newCell}) {
                        queue.insert(newCell, at: index)
                    } else {
                        queue.append(newCell)
                    }
                }
            }
        }
        
        return ans
     }

 }