class Solution {

    // Solution by Sergey Leschev

    // 886. Possible Bipartition
    // Given a set of n people (numbered 1, 2, ..., n), we would like to split everyone into two groups of any size.
    // Each person may dislike some other people, and they should not go into the same group.
    // Formally, if dislikes[i] = [a, b], it means it is not allowed to put the people numbered a and b into the same group.
    // Return true if and only if it is possible to split everyone into two groups in this way.

    // Example 1:
    // Input: n = 4, dislikes = [[1,2],[1,3],[2,4]]
    // Output: true
    // Explanation: group1 [1,4], group2 [2,3]

    // Example 2:
    // Input: n = 3, dislikes = [[1,2],[1,3],[2,3]]
    // Output: false

    // Example 3:
    // Input: n = 5, dislikes = [[1,2],[2,3],[3,4],[4,5],[1,5]]
    // Output: false

    // Constraints:
    // 1 <= n <= 2000
    // 0 <= dislikes.length <= 10000
    // dislikes[i].length == 2
    // 1 <= dislikes[i][j] <= n
    // dislikes[i][0] < dislikes[i][1]
    // There does not exist i != j for which dislikes[i] == dislikes[j].

    // - Approach: DFS

    // - Complexity:
    //   - time: O(N+E), where E is the length of dislikes.
    //   - space: O(N+E).

    func possibleBipartition(_ N: Int, _ dislikes: [[Int]]) -> Bool {
        var graph = Array(repeating: [Int](), count: N + 1)
        var colors = Array(repeating: 0, count: N + 1)

        for d in dislikes {
            graph[d[0]].append(d[1])
            graph[d[1]].append(d[0])
        }

        for i in 1...N where !dfs(i, &colors, graph) { return false }
        return true
    }

    private func dfs(_ node: Int, _ colors: inout [Int], _ graph: [[Int]]) -> Bool {
        for neightbor in graph[node] {
            if colors[neightbor] != 0 {
                if colors[neightbor] == colors[node] { return false }
            } else {
                colors[neightbor] = colors[node] == 1 ? -1 : 1
                if !dfs(neightbor, &colors, graph) { return false }
            }
        }
        return true
    }

    private func bfs(_ node: Int, _ colors: inout [Int], _ graph: [[Int]]) -> Bool {
        var graph = graph
        var queue = [node]

        while !queue.isEmpty {
            let first = queue.removeFirst()
            for neighbor in graph[first] {
                if colors[neighbor] != 0 {
                    if colors[neighbor] == colors[first] { return false }
                } else {
                    colors[neighbor] = colors[first] == 1 ? -1 : 1
                    queue.append(neighbor)
                }
            }
        }
        return true
    }

}
