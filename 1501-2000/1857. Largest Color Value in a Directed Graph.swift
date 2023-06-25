class Solution {

    // Solution @ Sergey Leschev

    // 1857. Largest Color Value in a Directed Graph
    // There is a directed graph of n colored nodes and m edges. The nodes are numbered from 0 to n - 1.
    // You are given a string colors where colors[i] is a lowercase English letter representing the color of the ith node in this graph (0-indexed). You are also given a 2D array edges where edges[j] = [aj, bj] indicates that there is a directed edge from node aj to node bj.
    // A valid path in the graph is a sequence of nodes x1 -> x2 -> x3 -> ... -> xk such that there is a directed edge from xi to xi+1 for every 1 <= i < k. The color value of the path is the number of nodes that are colored the most frequently occurring color along that path.

    // Return the largest color value of any valid path in the given graph, or -1 if the graph contains a cycle.

    // Example 1:
    // Input: colors = "abaca", edges = [[0,1],[0,2],[2,3],[3,4]]
    // Output: 3
    // Explanation: The path 0 -> 2 -> 3 -> 4 contains 3 nodes that are colored "a" (red in the above image).

    // Example 2:
    // Input: colors = "a", edges = [[0,0]]
    // Output: -1
    // Explanation: There is a cycle from 0 to 0.

    // Constraints:
    // n == colors.length
    // m == edges.length
    // 1 <= n <= 10^5
    // 0 <= m <= 10^5
    // colors consists of lowercase English letters.
    // 0 <= aj, bj < n

    func largestPathValue(_ colors: String, _ edges: [[Int]]) -> Int {
        let nodesCount = colors.count
        let colorsArr = colors.map { Int($0.asciiValue! - 97) }
        var graph = [[Int]](repeating: [], count: nodesCount)
        var cnt = [[Int]](repeating: [Int](repeating: 0, count: 26), count: nodesCount)
        var visited = [Int](repeating: 0, count: nodesCount)
        var ans = 0


        func dfs(_ node: Int) -> Bool {
            if visited[node] == 0 {
                visited[node] = 1
                for ch in graph[node] {
                    if !dfs(ch) { return false }
                    var temp = cnt[node]
                    for idx in 0..<26 { temp[idx] = max(temp[idx], cnt[ch][idx]) }
                    cnt[node] = temp
                }
                cnt[node][colorsArr[node]] += 1
                visited[node] = 2
            }
            return visited[node] == 2
        }

        for e in edges { graph[e[0]].append(e[1]) }

        for node in 0..<nodesCount {
            if !dfs(node) { return -1 }
            ans = max(ans, cnt[node].max()!)
        }
        return ans
    }

}