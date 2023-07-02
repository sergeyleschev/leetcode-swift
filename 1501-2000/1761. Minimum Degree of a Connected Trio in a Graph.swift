class Solution {

    // Solution by Sergey Leschev

    // 1761. Minimum Degree of a Connected Trio in a Graph
    // You are given an undirected graph. You are given an integer n which is the number of nodes in the graph and an array edges, where each edges[i] = [ui, vi] indicates that there is an undirected edge between ui and vi.
    // A connected trio is a set of three nodes where there is an edge between every pair of them.
    // The degree of a connected trio is the number of edges where one endpoint is in the trio, and the other is not.

    // Return the minimum degree of a connected trio in the graph, or -1 if the graph has no connected trios.

    // Example 1:
    // Input: n = 6, edges = [[1,2],[1,3],[3,2],[4,1],[5,2],[3,6]]
    // Output: 3
    // Explanation: There is exactly one trio, which is [1,2,3]. The edges that form its degree are bolded in the figure above.

    // Example 2:
    // Input: n = 7, edges = [[1,3],[4,1],[4,3],[2,5],[5,6],[6,7],[7,5],[2,6]]
    // Output: 0
    // Explanation: There are exactly three trios:
    // 1) [1,4,3] with degree 0.
    // 2) [2,5,6] with degree 2.
    // 3) [5,6,7] with degree 2.

    // Constraints:
    // 2 <= n <= 400
    // edges[i].length == 2
    // 1 <= edges.length <= n * (n-1) / 2
    // 1 <= ui, vi <= n
    // ui != vi
    // There are no repeated edges.

    func minTrioDegree(_ n: Int, _ edges: [[Int]]) -> Int {
        var graph = [[Bool]](repeating: [Bool](repeating: false, count: n + 1), count: n + 1)
        var cnt = [Int](repeating: 0, count: n + 1)
        var ans = Int.max
        var i = 1
        for edge in edges {
            graph[edge[0]][edge[1]] = true
            graph[edge[1]][edge[0]] = true
            cnt[edge[0]] += 1
            cnt[edge[1]] += 1
        }

        while i <= n - 2 {
            var j = i + 1
            while j <= n - 1 {
                if graph[i][j] {
                    var k = j + 1
                    while k <= n {
                        if graph[j][k] && graph[i][k] {
                            ans = min(ans, cnt[i] + cnt[j] + cnt[k] - 6)
                        }
                        k += 1
                    }
                }
                j += 1
            }
            i += 1
        }
        return ans == Int.max ? -1 : ans
    }

}
