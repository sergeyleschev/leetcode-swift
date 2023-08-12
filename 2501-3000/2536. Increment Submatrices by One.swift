class Solution {

    // Solution by Sergey Leschev
    // 2536. Increment Submatrices by One
    // 2-D Range Caching

    func rangeAddQueries(_ n: Int, _ queries: [[Int]]) -> [[Int]] {
        var ans = Array(repeating: Array(repeating: 0, count: n), count: n)

        for query in queries {
            let r1 = query[0]
            let c1 = query[1]
            let r2 = query[2]
            let c2 = query[3]
            ans[r1][c1] += 1
            if r2 + 1 < n { ans[r2 + 1][c1] -= 1 }
            if c2 + 1 < n { ans[r1][c2 + 1] -= 1 }
            if r2 + 1 < n && c2 + 1 < n { ans[r2 + 1][c2 + 1] += 1 }
        }

        for r in 1..<n {
            for c in 0..<n {
                ans[r][c] += ans[r - 1][c]
            }
        }

        for r in 0..<n {
            for c in 1..<n {
                ans[r][c] += ans[r][c - 1]
            }
        }

        return ans
    }
}
