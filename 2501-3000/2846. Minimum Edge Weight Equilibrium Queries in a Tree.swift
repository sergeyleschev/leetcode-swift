class Solution {

    // Solution by Sergey Leschev
    // 2846. Minimum Edge Weight Equilibrium Queries in a Tree
    // Time complexity: O(n log n + q(C + log n))
    // Space complexity: O(n log n)

    func minOperationsQueries(_ n: Int, _ edges: [[Int]], _ queries: [[Int]]) -> [Int] {
        let m = Int(log2(Double(n))) + 1
        let C = 27

        var g = Array(repeating: [(Int, Int)](), count: n)
        for e in edges {
            g[e[0]].append((e[1], e[2]))
            g[e[1]].append((e[0], e[2]))
        }

        var fa = Array(repeating: Array(repeating: 0, count: n), count: m)
        var w = Array(repeating: Array(repeating: 0, count: C), count: n)
        var d = Array(repeating: 0, count: n)

        func dfs(_ x: Int, _ f: Int, _ dep: Int) {
            fa[0][x] = f
            d[x] = dep
            for (c, weight) in g[x] {
                if f == c { continue }
                w[c] = w[x]
                w[c][weight] += 1
                dfs(c, x, dep + 1)
            }
        }

        w[0] = Array(repeating: 0, count: C)
        dfs(0, 0, 0)

        for i in 1..<m {
            for j in 0..<n {
                fa[i][j] = fa[i - 1][fa[i - 1][j]]
            }
        }

        func lca(_ x: Int, _ y: Int) -> Int {
            var x = x
            var y = y
            if d[x] > d[y] { swap(&x, &y) }
            for p in 0..<(1 << m) where (1 << p) <= d[y] - d[x] {
                if (1 << p) & (d[y] - d[x]) != 0 { y = fa[p][y] }
            }
            for p in stride(from: m - 1, through: 0, by: -1) {
                if fa[p][x] != fa[p][y] {
                    x = fa[p][x]
                    y = fa[p][y]
                }
            }
            return x == y ? x : fa[0][x]
        }

        var res = [Int]()
        for q in queries {
            let x = q[0]
            let y = q[1]
            let l = lca(x, y)
            let len = d[x] + d[y] - 2 * d[l]
            var maxZ = 0
            for z in 1..<C {
                let numZ = w[x][z] + w[y][z] - w[l][z] * 2
                maxZ = max(maxZ, numZ)
            }
            res.append(len - maxZ)
        }
        return res
    }
}
