class Solution {

    // Solution @ Sergey Leschev

    // 542. 01 Matrix
    // Given an m x n binary matrix mat, return the distance of the nearest 0 for each cell.
    // The distance between two adjacent cells is 1.

    // Example 1:
    // Input: mat = [[0,0,0],[0,1,0],[0,0,0]]
    // Output: [[0,0,0],[0,1,0],[0,0,0]]

    // Example 2:
    // Input: mat = [[0,0,0],[0,1,0],[1,1,1]]
    // Output: [[0,0,0],[0,1,0],[1,2,1]]

    // Constraints:
    // m == mat.length
    // n == mat[i].length
    // 1 <= m, n <= 10^4
    // 1 <= m * n <= 10^4
    // mat[i][j] is either 0 or 1.
    // There is at least one 0 in mat.

    // BFS

    func updateMatrix(_ matrix: [[Int]]) -> [[Int]] {
        let m = matrix.count
        let n = matrix[0].count
        var matrix = matrix
        var queue: [(Int, Int)] = []
        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        var distance = 1
        
        for i in 0..<m {
            for j in 0..<n {
                if matrix[i][j] == 0 {
                    queue.append((i, j))
                } else {
                    matrix[i][j] = -1 // use -1 to identify cells that have not been visited yet
                }
            }
        }
        
        while !queue.isEmpty {
            let count = queue.count
            for _ in 0..<count {
                let (i, j) = queue.removeFirst()
                
                for direction in directions {
                    let x = i + direction.0
                    let y = j + direction.1
                    if x < 0 || x >= m || y < 0 || y >= n || matrix[x][y] != -1 {
                        continue
                    }
                    matrix[x][y] = distance
                    queue.append((x, y))
                }
            }
            
            distance += 1
        }
        
        return matrix
    }

}