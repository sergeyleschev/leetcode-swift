class Solution {

    // Solution by Sergey Leschev
    // 1916. Count Ways to Build Rooms in an Ant Colony

    func waysToBuildRooms(_ prevRoom: [Int]) -> Int {
        let MOD = 1_000_000_007
        let n = prevRoom.count

        var inv = [Int](repeating: 0, count: n + 1)
        var fac = [Int](repeating: 0, count: n + 1)
        var ifac = [Int](repeating: 0, count: n + 1)

        inv[0] = 1
        inv[1] = 1
        fac[0] = 1
        ifac[0] = 1

        for i in 2...n {
            inv[i] = (MOD - MOD / i) * inv[MOD % i] % MOD
        }

        for i in 1...n {
            fac[i] = fac[i - 1] * i % MOD
            ifac[i] = ifac[i - 1] * inv[i] % MOD
        }

        func combine(_ n: Int, _ m: Int) -> Int {
            return fac[n] * ifac[m] % MOD * ifac[n - m] % MOD
        }

        var graph = [[Int]](repeating: [], count: n + 1)
        var size = [Int](repeating: 0, count: n + 1)
        var dp = [Int](repeating: 1, count: n + 1)

        for i in 1..<n {
            graph[prevRoom[i]].append(i)
        }

        func dfs(_ u: Int, _ fa: Int) -> Int {
            for v in graph[u] {
                dfs(v, u)
                dp[u] = dp[u] * dp[v] % MOD
                dp[u] = dp[u] * combine(size[u] + size[v], size[v]) % MOD
                size[u] += size[v]
            }
            size[u] += 1
            return dp[u]
        }

        return dfs(0, -1)
    }
}
