class Solution {

    // Solution @ Sergey Leschev, Belarusian State University
    
    // 1074. Number of Submatrices That Sum to Target
    // Given a matrix and a target, return the number of non-empty submatrices that sum to target.
    // A submatrix x1, y1, x2, y2 is the set of all cells matrix[x][y] with x1 <= x <= x2 and y1 <= y <= y2.
    // Two submatrices (x1, y1, x2, y2) and (x1', y1', x2', y2') are different if they have some coordinate that is different: for example, if x1 != x1'.

    // Example 1:
    // Input: matrix = [[0,1,0],[1,1,1],[0,1,0]], target = 0
    // Output: 4
    // Explanation: The four 1x1 submatrices that only contain 0.

    // Example 2:
    // Input: matrix = [[1,-1],[-1,1]], target = 0
    // Output: 5
    // Explanation: The two 1x2 submatrices, plus the two 2x1 submatrices, plus the 2x2 submatrix.

    // Example 3:
    // Input: matrix = [[904]], target = 0
    // Output: 0

    // Constraints:
    // 1 <= matrix.length <= 100
    // 1 <= matrix[0].length <= 100
    // -1000 <= matrix[i] <= 1000
    // -10^8 <= target <= 10^8

    func numSubmatrixSumTarget(_ matrix: [[Int]], _ target: Int) -> Int {
        let M = matrix.count
        let N = matrix[0].count
        var prefixSum = matrix
        var ans = 0

        for i in 0..<M {
            for j in 1..<N { prefixSum[i][j] += prefixSum[i][j - 1] }
        }
        
        for c1 in 0..<N {
            for c2 in c1..<N {
                var map: [Int: Int] = [0: 1]
                var cur = 0
                for r in 0..<M {
                    cur += prefixSum[r][c2] - (c1 > 0 ? prefixSum[r][c1 - 1] : 0)
                    ans += map[cur - target] ?? 0
                    map.updateValue((map[cur] ?? 0 ) + 1, forKey: cur)
                }
            }
        }

        return ans
    }

}