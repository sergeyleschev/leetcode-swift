class Solution {

    // Solution by Sergey Leschev

    // 1504. Count Submatrices With All Ones
    // Given a rows * columns matrix mat of ones and zeros, return how many submatrices have all ones.

    // Example 1:
    // Input: mat = [[1,0,1],
    //               [1,1,0],
    //               [1,1,0]]
    // Output: 13
    // Explanation:
    // There are 6 rectangles of side 1x1.
    // There are 2 rectangles of side 1x2.
    // There are 3 rectangles of side 2x1.
    // There is 1 rectangle of side 2x2. 
    // There is 1 rectangle of side 3x1.
    // Total number of rectangles = 6 + 2 + 3 + 1 + 1 = 13.

    // Example 2:
    // Input: mat = [[0,1,1,0],
    //               [0,1,1,1],
    //               [1,1,1,0]]
    // Output: 24
    // Explanation:
    // There are 8 rectangles of side 1x1.
    // There are 5 rectangles of side 1x2.
    // There are 2 rectangles of side 1x3. 
    // There are 4 rectangles of side 2x1.
    // There are 2 rectangles of side 2x2. 
    // There are 2 rectangles of side 3x1. 
    // There is 1 rectangle of side 3x2. 
    // Total number of rectangles = 8 + 5 + 2 + 4 + 2 + 2 + 1 = 24.

    // Example 3:
    // Input: mat = [[1,1,1,1,1,1]]
    // Output: 21

    // Example 4:
    // Input: mat = [[1,0,1],[0,1,0],[1,0,1]]
    // Output: 5

    // Constraints:
    // 1 <= rows <= 150
    // 1 <= columns <= 150
    // 0 <= mat[i][j] <= 1

    func numSubmat(_ mat: [[Int]]) -> Int {
        guard !mat.isEmpty && !mat[0].isEmpty  else { return 0 }
        let M = mat.count
        let N = mat[0].count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: N), count: M)
        var ans = 0

        for i in 0..<M {
            for j in 0..<N where mat[i][j] == 1 {
                if j == 0 {
                    dp[i][j] = 1
                } else {
                    dp[i][j] = dp[i][j - 1] + 1
                }
                var temp = Int.max
                for k in stride(from: i, through: 0, by: -1) {
                    temp = min(temp, dp[k][j])
                    guard temp > 0 else { break }
                    ans += temp
                }
            }
        }
        
        return ans
    }

}