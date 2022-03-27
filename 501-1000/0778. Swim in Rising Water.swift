class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 778. Swim in Rising Water
    // On an N x N grid, each square grid[i][j] represents the elevation at that point (i,j).
    // Now rain starts to fall. At time t, the depth of the water everywhere is t. You can swim from a square to another 4-directionally adjacent square if and only if the elevation of both squares individually are at most t. You can swim infinite distance in zero time. Of course, you must stay within the boundaries of the grid during your swim.
    // You start at the top left square (0, 0). What is the least time until you can reach the bottom right square (N-1, N-1)?

    // Example 1:
    // Input: [[0,2],[1,3]]
    // Output: 3
    // Explanation:
    // At time 0, you are in grid location (0, 0).
    // You cannot go anywhere else because 4-directionally adjacent neighbors have a higher elevation than t = 0.
    // You cannot reach point (1, 1) until time 3.
    // When the depth of water is 3, we can swim anywhere inside the grid.

    // Example 2:
    // Input: [[0,1,2,3,4],[24,23,22,21,5],[12,13,14,15,16],[11,17,18,19,20],[10,9,8,7,6]]
    // Output: 16
    // Explanation:
    //  0  1  2  3  4
    // 24 23 22 21  5
    // 12 13 14 15 16
    // 11 17 18 19 20
    // 10  9  8  7  6
    // The final route is marked in bold.
    // We need to wait until time 16 so that (0, 0) and (4, 4) are connected.
    // Note:
    // 2 <= N <= 50.
    // grid[i][j] is a permutation of [0, ..., N*N - 1].

    func swimInWater(_ grid: [[Int]]) -> Int {
        guard grid.count > 0 else { return -1 }
        let row = grid.count
        let column = grid[0].count
        let dirs: [[Int]] = [[1, 0], [0, 1]]
        var edges: [[Int]] = []
        var ans = 0
        
        for i in 0..<row {
            for j in 0..<column {
                for dir in dirs {
                    let x = i + dir[0], y = j + dir[1]
                    if 0 <= x && x < row && 0 <= y && y < column {
                        edges.append([i * column + j, x * column + y, max(grid[i][j], grid[x][y])])
                    }
                }
            }
        }

        edges.sort { $0[2] < $1[2] }
        let union = Union(row * column)
        for edge in edges {
            union.unit(edge[0], edge[1])
            if union.find(0) == union.find(row * column - 1) {
                ans = edge[2]
                break
            }
        }

        return ans
    }
    
    
    private class Union {
        private var union: [Int] = []
        

        init(_ n: Int) {
            for i in 0..<n { union.append(i) }
        }
        
        
        func find(_ i: Int) -> Int {
            if union[i] != i { union[i] = find(union[i]) }
            return union[i]
        }
        
        
        func unit(_ i1: Int, _ i2: Int) {
            if find(i1) != find(i2) { union[find(i1)] = find(i2) }
        }

    }

}