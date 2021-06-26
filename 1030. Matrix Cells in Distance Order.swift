class Solution {

    // 1030. Matrix Cells in Distance Order
    // We are given a matrix with rows rows and cols columns has cells with integer coordinates (r, c), where 0 <= r < rows and 0 <= c < cols.
    // Additionally, we are given a cell in that matrix with coordinates (rCenter, cCenter).
    // Return the coordinates of all cells in the matrix, sorted by their distance from (rCenter, cCenter) from smallest distance to largest distance.  Here, the distance between two cells (r1, c1) and (r2, c2) is the Manhattan distance, |r1 - r2| + |c1 - c2|.  (You may return the answer in any order that satisfies this condition.)

    // Example 1:
    // Input: rows = 1, cols = 2, rCenter = 0, cCenter = 0
    // Output: [[0,0],[0,1]]
    // Explanation: The distances from (0, 0) to other cells are: [0,1]

    // Example 2:
    // Input: rows = 2, cols = 2, rCenter = 0, cCenter = 1
    // Output: [[0,1],[0,0],[1,1],[1,0]]
    // Explanation: The distances from (0, 1) to other cells are: [0,1,1,2]
    // The answer [[0,1],[1,1],[0,0],[1,0]] would also be accepted as correct.

    // Example 3:
    // Input: rows = 2, cols = 3, rCenter = 1, cCenter = 2
    // Output: [[1,2],[0,2],[1,1],[0,1],[1,0],[0,0]]
    // Explanation: The distances from (1, 2) to other cells are: [0,1,1,2,2,3]
    // There are other answers that would also be accepted as correct, such as [[1,2],[1,1],[0,2],[1,0],[0,1],[0,0]].

    // Note:
    // 1 <= rows <= 100
    // 1 <= cols <= 100
    // 0 <= rCenter < rows
    // 0 <= cCenter < cols

    func allCellsDistOrder(_ R: Int, _ C: Int, _ r0: Int, _ c0: Int) -> [[Int]] {
        let numOfBuckets = max(r0, R - r0 - 1) + max(c0, C - c0 - 1) + 1
        var buckets = Array(repeating: [[Int]](), count: numOfBuckets)
        
        for i in 0..<R {
            for j in 0..<C {
                let index = abs(i - r0) + abs(j - c0)
                buckets[index].append([i, j])
            }
        }
        
        let ans = buckets.reduce([[Int]]()) { (res, bucket) -> [[Int]] in res + bucket }
        return ans
    }
    
}