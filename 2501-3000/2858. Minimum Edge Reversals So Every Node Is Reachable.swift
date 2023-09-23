class Solution {

    // Solution by Sergey Leschev
    // 2858. Minimum Edge Reversals So Every Node Is Reachable

    var graph = [[Int]]()
    var revGraph = [[Int]]()
    var dp = [String: Int]()

    func dfs(_ node: Int, _ parent: Int) -> Int {
        let key = "\(node)-\(parent)"

        if let cached = dp[key] {
            return cached
        }

        var ans = 0

        for x in graph[node] {
            if x != parent {
                ans += dfs(x, node)
            }
        }

        for x in revGraph[node] {
            if x != parent {
                ans += dfs(x, node) + 1
            }
        }

        dp[key] = ans
        return ans
    }

    func minEdgeReversals(_ n: Int, _ edges: [[Int]]) -> [Int] {
        graph = Array(repeating: [Int](), count: n)
        revGraph = Array(repeating: [Int](), count: n)
        dp = [String: Int]()

        for x in edges {
            graph[x[0]].append(x[1])
            revGraph[x[1]].append(x[0])
        }

        var ans = [Int]()
        for i in 0..<n {
            ans.append(dfs(i, -1))
        }

        return ans
    }
}
