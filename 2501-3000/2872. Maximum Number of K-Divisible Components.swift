class Solution {

    // Solution by Sergey Leschev
    // 2872. Maximum Number of K-Divisible Components

    // DFS
    // Prefix Sum

    // Time complexity: O(n)

    var dp: [Int] = []
    var cnt: Int = 0

    func dfs(_ adj: [[Int]], _ s: Int, _ vis: inout [Int], _ values: [Int], _ k: Int) -> Int {
        vis[s] = 1
        for nbr in adj[s] {
            if vis[nbr] == 0 {
                dp[s] += dfs(adj, nbr, &vis, values, k)
            }
        }

        if dp[s] % k == 0 {
            cnt += 1
            return 0
        }

        return dp[s]
    }

    func maxKDivisibleComponents(_ n: Int, _ edges: [[Int]], _ values: [Int], _ k: Int) -> Int {
        cnt = 0
        dp = Array(repeating: 0, count: n)

        for i in 0..<n {
            dp[i] = values[i]
        }

        var adj: [[Int]] = Array(repeating: [], count: n)
        for e in edges {
            adj[e[0]].append(e[1])
            adj[e[1]].append(e[0])
        }

        var vis: [Int] = Array(repeating: 0, count: n)
        dfs(adj, 0, &vis, values, k)

        return cnt
    }
}
