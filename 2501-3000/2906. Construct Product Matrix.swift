class Solution {

    // Solution by Sergey Leschev
    // 2906. Construct Product Matrix

    func constructProductMatrix(_ grid: [[Int]]) -> [[Int]] {
        let n = grid.count
        let m = grid[0].count
        let mod = 12345

        var ans = Array(repeating: Array(repeating: 0, count: m), count: n)
        var xx = Array(repeating: Array(repeating: 0, count: m), count: n)
        var yy = Array(repeating: Array(repeating: 0, count: m), count: n)

        var p: Int64 = 1

        // Calculate xx matrix
        for i in 0..<n {
            for j in 0..<m {
                xx[i][j] = Int(p)
                p = (p * Int64(grid[i][j])) % Int64(mod)
            }
        }

        p = 1

        // Calculate yy matrix
        for i in (0..<n).reversed() {
            for j in (0..<m).reversed() {
                yy[i][j] = Int(p)
                p = (p * Int64(grid[i][j])) % Int64(mod)
            }
        }

        // Calculate ans matrix
        for i in 0..<n {
            for j in 0..<m {
                let mul = Int64(xx[i][j]) * Int64(yy[i][j])
                ans[i][j] = Int(mul % Int64(mod))
            }
        }

        return ans
    }
}
