class Solution {

    // Solution by Sergey Leschev
    // 2920. Maximum Points After Collecting Coins From All Nodes

    // For each node, we have 15 states for v from 0 to 14.

    // Time complexity: O(15n)
    // Space complexity: O(15n)

    var G: [[Int]] = []
    var vis: [[Bool]] = Array(repeating: Array(repeating: false, count: 14), count: 100001)

    func dfs(_ i: Int, _ p: Int, _ A: [Int], _ k: Int, _ v: Int) -> Int {
        if v > 13 {
            return 0
        }

        if vis[i][v] {
            return 0
        }

        vis[i][v] = true

        var op1 = (A[i] >> v) - k
        var op2 = A[i] >> (v + 1)

        for j in G[i] {
            if j == p {
                continue
            }

            op1 += dfs(j, i, A, k, v)
            op2 += dfs(j, i, A, k, v + 1)
        }

        return max(op1, op2)
    }

    func maximumPoints(_ edges: [[Int]], _ coins: [Int], _ k: Int) -> Int {
        let n = edges.count + 1
        G = Array(repeating: [], count: n)

        for e in edges {
            G[e[0]].append(e[1])
            G[e[1]].append(e[0])
        }

        return dfs(0, -1, coins, k, 0)
    }
}
