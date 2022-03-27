class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1727. Largest Submatrix With Rearrangements
    // You are given a binary matrix matrix of size m x n, and you are allowed to rearrange the columns of the matrix in any order.

    // Return the area of the largest submatrix within matrix where every element of the submatrix is 1 after reordering the columns optimally.

    // Example 1:
    // Input: matrix = [[0,0,1],[1,1,1],[1,0,1]]
    // Output: 4
    // Explanation: You can rearrange the columns as shown above.
    // The largest submatrix of 1s, in bold, has an area of 4.

    // Example 2:
    // Input: matrix = [[1,0,1,0,1]]
    // Output: 3
    // Explanation: You can rearrange the columns as shown above.
    // The largest submatrix of 1s, in bold, has an area of 3.

    // Example 3:
    // Input: matrix = [[1,1,0],[1,0,1]]
    // Output: 2
    // Explanation: Notice that you must rearrange entire columns, and there is no way to make a submatrix of 1s larger than an area of 2.

    // Example 4:
    // Input: matrix = [[0,0],[0,0]]
    // Output: 0
    // Explanation: As there are no 1s, no submatrix of 1s can be formed and the area is 0.

    // Constraints:
    // m == matrix.length
    // n == matrix[i].length
    // 1 <= m * n <= 10^5
    // matrix[i][j] is 0 or 1.
    
    func largestSubmatrix(_ matrix: [[Int]]) -> Int {
        let m = matrix.count
        let n = matrix[0].count
        var countOnes = 0
        for r in 0..<m {
            for c in 0..<n { countOnes += matrix[r][c] }
        }
        guard countOnes < m * n else { return countOnes }
        guard countOnes > 0 else { return 0 }
        var counter = [[Int: Int]](repeating: [:], count: m + 1)
        var maxArea = 0
        
        for r in 0..<m {
            for c in 0..<n where matrix[r][c] == 1 {
                var r1 = r
                while r1 >= 0 && matrix[r1][c] == 1 {
                    let l = r - r1  + 1
                    let key = r << 32 | r1
                    counter[l][key, default: 0] += 1
                    maxArea = max(maxArea, l * counter[l][key]!)
                    guard maxArea < countOnes else { return maxArea }
                    r1 -= 1
                }
            }
        }
        return maxArea
    }

}