class Solution {

    // Solution by Sergey Leschev
    // 2392. Build a Matrix With Conditions

    private var color = [Int]()
    private var visited = [Bool]()

    private func dfs(_ v: Int, _ graph: [[Int]]) -> Bool {
        color[v] = 1
        for u in graph[v] {
            if color[u] == 0 {
                if dfs(u, graph) {
                    return true
                }
            } else if color[u] == 1 {
                return true
            }
        }
        color[v] = 2
        return false
    }

    private func findCycle(_ graph: [[Int]], _ n: Int) -> Bool {
        color = Array(repeating: 0, count: n)
        for v in 0..<n {
            if color[v] == 0 && dfs(v, graph) {
                return true
            }
        }
        return false
    }

    private func dfs2(_ v: Int, _ graph: [[Int]], _ ans: inout [Int]) {
        visited[v] = true
        for u in graph[v] {
            if !visited[u] {
                dfs2(u, graph, &ans)
            }
        }
        ans.append(v)
    }

    private func topologicalSort(_ graph: [[Int]], _ n: Int, _ ans: inout [Int]) {
        visited = Array(repeating: false, count: n)
        ans.removeAll()
        for i in 0..<n {
            if !visited[i] {
                dfs2(i, graph, &ans)
            }
        }
        ans.reverse()
    }

    func buildMatrix(_ k: Int, _ rowConditions: [[Int]], _ colConditions: [[Int]]) -> [[Int]] {
        var graph1 = [[Int]](repeating: [], count: k)
        var graph2 = [[Int]](repeating: [], count: k)

        for x in rowConditions {
            graph1[x[0] - 1].append(x[1] - 1)
        }
        for x in colConditions {
            graph2[x[0] - 1].append(x[1] - 1)
        }

        if findCycle(graph1, k) || findCycle(graph2, k) {
            return [[Int]]()
        }

        var ans1 = [Int]()
        var ans2 = [Int]()
        topologicalSort(graph1, k, &ans1)
        topologicalSort(graph2, k, &ans2)

        var ans = [[Int]](repeating: [Int](repeating: 0, count: k), count: k)
        var m = [Int: Int]()

        for i in 0..<k {
            m[ans2[i]] = i
        }

        for i in 0..<k {
            ans[i][m[ans1[i]]!] = ans1[i] + 1
        }

        return ans
    }
}
