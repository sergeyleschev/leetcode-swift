class Solution {

    // Solution by Sergey Leschev

    // 1886. Determine Whether Matrix Can Be Obtained By Rotation
    // Given two n x n binary matrices mat and target, return true if it is possible to make mat equal to target by rotating mat in 90-degree increments, or false otherwise.

    // Example 1:
    // Input: mat = [[0,1],[1,0]], target = [[1,0],[0,1]]
    // Output: true
    // Explanation: We can rotate mat 90 degrees clockwise to make mat equal target.

    // Example 2:
    // Input: mat = [[0,1],[1,1]], target = [[1,0],[0,1]]
    // Output: false
    // Explanation: It is impossible to make mat equal to target by rotating mat.

    // Example 3:
    // Input: mat = [[0,0,0],[0,1,0],[1,1,1]], target = [[1,1,1],[0,1,0],[0,0,0]]
    // Output: true
    // Explanation: We can rotate mat 90 degrees clockwise two times to make mat equal target.

    // Constraints:
    // n == mat.length == target.length
    // n == mat[i].length == target[i].length
    // 1 <= n <= 10
    // mat[i][j] and target[i][j] are either 0 or 1.

    func findRotation(_ m: [[Int]], _ t: [[Int]]) -> Bool {
        let f = rotate(m)
        let s = rotate(f)
        let t1 = rotate(s)
        
        return m == t || f == t || s == t || t1 == t
    }


    private func rotate(_ mat: [[Int]]) -> [[Int]] {
        let n = mat.count
        var ans = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        var r = 0

        while r < n {
            let c = n - r - 1
            var j = 0
            while j < n {
                ans[j][c] = mat[r][j]
                j += 1
            }
            r += 1
        }
        return ans
    }

}