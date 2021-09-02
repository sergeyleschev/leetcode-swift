class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 847. Shortest Path Visiting All Nodes
    // You have an undirected, connected graph of n nodes labeled from 0 to n - 1. You are given an array graph where graph[i] is a list of all the nodes connected with node i by an edge.
    // Return the length of the shortest path that visits every node. You may start and stop at any node, you may revisit nodes multiple times, and you may reuse edges.

    // Example 1:
    // Input: graph = [[1,2,3],[0],[0],[0]]
    // Output: 4
    // Explanation: One possible path is [1,0,2,0,3]

    // Example 2:
    // Input: graph = [[1],[0,2,4],[1,3,4],[2],[1,2]]
    // Output: 4
    // Explanation: One possible path is [0,1,4,2,3]

    // Constraints:
    // n == graph.length
    // 1 <= n <= 12
    // 0 <= graph[i].length < n
    // graph[i] does not contain i.
    // If graph[a] contains b, then graph[b] contains a.
    // The input graph is always connected.

    private struct State: Hashable {
        var visited: UInt16
        var node: Int
    }


    private let one: UInt16 = 1
    

    func shortestPathLength(_ graph: [[Int]]) -> Int {
        let allNodes: UInt16 = one << graph.count - 1        
        var queue = [State]()
        var visited = Set<State>()
        var depth = 0

        for node in 0..<graph.count {
            let startState = State(visited: one << node, node: node)
            queue.append(startState)
            visited.insert(startState)
        }

        while !queue.isEmpty {
            depth += 1
            var nextLevel = [State]()
            for state in queue {
                for node in graph[state.node] {
                    let v = state.visited | (one << node)
                    guard v != allNodes else { return depth }
                    let next = State(visited: v, node: node)
                    if !visited.contains(next) {
                        visited.insert(next)
                        nextLevel.append(next)
                    }
                }
            }
            queue = nextLevel
        }
        
        return 0
    }

}