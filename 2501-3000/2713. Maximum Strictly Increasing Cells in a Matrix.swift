class Solution {

    // Solution by Sergey Leschev
    // 2713. Maximum Strictly Increasing Cells in a Matrix

    func maxIncreasingCells(_ mat: [[Int]]) -> Int {
        let m = mat.count
        let n = mat[0].count

        var A: [Int: [[Int]]] = [:]
        for i in 0..<m {
            for j in 0..<n {
                let val = mat[i][j]
                if A[val] == nil {
                    A[val] = [[Int]]()
                }
                A[val]?.append([i, j])
            }
        }

        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
        var res = Array(repeating: 0, count: n + m)

        for a in A.keys.sorted() {
            if let positions = A[a] {
                for pos in positions {
                    let i = pos[0]
                    let j = pos[1]
                    dp[i][j] = max(res[i], res[m + j]) + 1
                }

                for pos in positions {
                    let i = pos[0]
                    let j = pos[1]
                    res[m + j] = max(res[m + j], dp[i][j])
                    res[i] = max(res[i], dp[i][j])
                }
            }
        }

        var ans = 0
        for a in res {
            ans = max(ans, a)
        }

        return ans
    }
}
