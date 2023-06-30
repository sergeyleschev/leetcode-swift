class Solution {

    // Solution by Sergey Leschev

    // 1284. Minimum Number of Flips to Convert Binary Matrix to Zero Matrix
    // Given a m x n binary matrix mat. In one step, you can choose one cell and flip it and all the four neighbors of it if they exist (Flip is changing 1 to 0 and 0 to 1). A pair of cells are called neighbors if they share one edge.
    // Return the minimum number of steps required to convert mat to a zero matrix or -1 if you cannot.
    // A binary matrix is a matrix with all cells equal to 0 or 1 only.
    // A zero matrix is a matrix with all cells equal to 0.

    // Example 1:
    // Input: mat = [[0,0],[0,1]]
    // Output: 3
    // Explanation: One possible solution is to flip (1, 0) then (0, 1) and finally (1, 1) as shown.

    // Example 2:
    // Input: mat = [[0]]
    // Output: 0
    // Explanation: Given matrix is a zero matrix. We don't need to change it.

    // Example 3:
    // Input: mat = [[1,1,1],[1,0,1],[0,0,0]]
    // Output: 6

    // Example 4:
    // Input: mat = [[1,0,0],[1,0,0]]
    // Output: -1
    // Explanation: Given matrix can't be a zero matrix

    // Constraints:
    // m == mat.length
    // n == mat[i].length
    // 1 <= m, n <= 3
    // mat[i][j] is either 0 or 1.

    // Approach: BFS

    func minFlips(_ mat: [[Int]]) -> Int {
        var visited: Set<[[Int]]> = Set()
        var queue: [[[Int]]] = []
        let offsets = [(0, 0), (0, 1), (0, -1), (1, 0), (-1, 0)]
        let row = mat.count
        let col = mat.first?.count ?? 0
        let target = Array(repeating: Array(repeating: 0, count: col), count: row)
        var steps: Int = -1

        queue.append(mat)
        visited.insert(mat)

        while !queue.isEmpty {
            steps += 1

            for _ in 0..<queue.count {
                let cur = queue.removeFirst()
                if cur == target { return steps }
                for i in 0..<row {
                    for j in 0..<col {
                        var flipped = cur

                        for offset in offsets {
                            let r = i + offset.0
                            let c = j + offset.1
                            if r >= 0 && r < row && c >= 0 && c < col { flipped[r][c] = (flipped[r][c] + 1) % 2 }
                        }

                        if !visited.contains(flipped) {
                            queue.append(flipped)
                            visited.insert(flipped)
                        }
                    }
                }
            }
        }
        
        return -1
    }

}