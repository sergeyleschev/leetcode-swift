class Solution {

    // Solution @ Sergey Leschev

    // 797. All Paths From Source to Target
    // Given a directed acyclic graph (DAG) of n nodes labeled from 0 to n - 1, find all possible paths from node 0 to node n - 1, and return them in any order.
    // The graph is given as follows: graph[i] is a list of all nodes you can visit from node i (i.e., there is a directed edge from node i to node graph[i][j]).

    // Finds all possible paths from node 0 to node N-1.

    // - Parameter graph: The graph.
    // - Returns: All possible paths from node 0 to node N-1.

    // Example 1:
    // Input: graph = [[1,2],[3],[3],[]]
    // Output: [[0,1,3],[0,2,3]]
    // Explanation: There are two paths: 0 -> 1 -> 3 and 0 -> 2 -> 3.

    // Example 2:
    // Input: graph = [[4,3,1],[3,2,4],[3],[4],[]]
    // Output: [[0,4],[0,3,4],[0,1,3,4],[0,1,2,3,4],[0,1,4]]

    // Example 3:
    // Input: graph = [[1],[]]
    // Output: [[0,1]]

    // Example 4:
    // Input: graph = [[1,2,3],[2],[3],[]]
    // Output: [[0,1,2,3],[0,2,3],[0,3]]

    // Example 5:
    // Input: graph = [[1,3],[2],[3],[]]
    // Output: [[0,1,2,3],[0,3]]

    // Constraints:
    // n == graph.length
    // 2 <= n <= 15
    // 0 <= graph[i][j] < n
    // graph[i][j] != i (i.e., there will be no self-loops).
    // The input graph is guaranteed to be a DAG.

    // - Complexity:
    //   - time: O(V + E), where V represents the number of vertices and E represents the number of edges.
    //   - space: O(V * 2^V), where V represents the number of vertices.
    
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var dict = [Int: [[Int]]]()
        return dfs(graph, node: 0, dict: &dict)
    }


    private func dfs(_ graph: [[Int]], node: Int, dict: inout [Int: [[Int]]]) -> [[Int]] {
        if let path = dict[node] { return path }
        var ans = [[Int]]()

        if node == graph.count - 1 {
            ans.append([node])
        } else {
            for nextNode in graph[node] {
                let paths = dfs(graph, node: nextNode, dict: &dict)
                for var path in paths {
                    path.insert(node, at: 0)
                    ans.append(path)
                }
            }
        }

        dict[node] = ans
        return ans
    }

}