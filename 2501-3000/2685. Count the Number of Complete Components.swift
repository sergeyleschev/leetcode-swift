class Solution {

    // Solution by Sergey Leschev
    // 2685. Count the Number of Complete Components
    // DFS
    // Time complexity: O(n + m)
    // Space complexity: O(n + m)

    private func dfs(_ x: Int, _ con: [[Int]], _ mark: inout [Bool], _ a: inout Int, _ b: inout Int)
    {
        if mark[x] {
            return
        }
        mark[x] = true
        a += 1
        b += con[x].count
        for y in con[x] {
            dfs(y, con, &mark, &a, &b)
        }
    }

    func countCompleteComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        var con = [[Int]](repeating: [], count: n)
        for e in edges {
            con[e[0]].append(e[1])
            con[e[1]].append(e[0])
        }

        var mark = [Bool](repeating: false, count: n)
        var result = 0
        for i in 0..<n {
            if !mark[i] {
                var x = 0
                var y = 0
                dfs(i, con, &mark, &x, &y)
                result += x * (x - 1) == y ? 1 : 0
            }
        }
        return result
    }
}
