class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1129. Shortest Path with Alternating Colors
    // Consider a directed graph, with nodes labelled 0, 1, ..., n-1.  In this graph, each edge is either red or blue, and there could be self-edges or parallel edges.
    // Each [i, j] in red_edges denotes a red directed edge from node i to node j.  Similarly, each [i, j] in blue_edges denotes a blue directed edge from node i to node j.
    // Return an array answer of length n, where each answer[X] is the length of the shortest path from node 0 to node X such that the edge colors alternate along the path (or -1 if such a path doesn't exist).

    // Example 1:
    // Input: n = 3, red_edges = [[0,1],[1,2]], blue_edges = []
    // Output: [0,1,-1]

    // Example 2:
    // Input: n = 3, red_edges = [[0,1]], blue_edges = [[2,1]]
    // Output: [0,1,-1]

    // Example 3:
    // Input: n = 3, red_edges = [[1,0]], blue_edges = [[2,1]]
    // Output: [0,-1,-1]

    // Example 4:
    // Input: n = 3, red_edges = [[0,1]], blue_edges = [[1,2]]
    // Output: [0,1,2]

    // Example 5:
    // Input: n = 3, red_edges = [[0,1],[0,2]], blue_edges = [[1,0]]
    // Output: [0,1,1]

    // Constraints:
    // 1 <= n <= 100
    // red_edges.length <= 400
    // blue_edges.length <= 400
    // red_edges[i].length == blue_edges[i].length == 2
    // 0 <= red_edges[i][j], blue_edges[i][j] < n

    struct ColouredNode: Hashable {
        var node: Int
        var colour: Int
    }


    func shortestAlternatingPaths(_ n: Int, _ red_edges: [[Int]], _ blue_edges: [[Int]]) -> [Int] {
        var distanceTo = [Int](repeating: Int.max, count: n)
        let graph = builgGraph(vertexNumber: n, redEdges: red_edges, blueEdges: blue_edges)
        var queue = [ColouredNode]()
        var pathLength = 0
        var visited = Set<ColouredNode>()

        distanceTo[0] = 0
        queue.append(ColouredNode(node: 0, colour: 1))
        queue.append(ColouredNode(node: 0, colour: -1))
        
        while !queue.isEmpty {
            let size = queue.count
            pathLength += 1
            for _ in 0..<size {
                let colouredNode = queue.removeFirst()
                let node = colouredNode.node
                let color = colouredNode.colour
                let oppositeColor = -color
                for j in 1..<n {
                    if graph[node][j] == oppositeColor || graph[node][j] == 0 {
                        let nextColouredNode = ColouredNode(node: j, colour: oppositeColor)
                        if  !visited.contains(nextColouredNode) {
                            queue.append(nextColouredNode)
                            distanceTo[j] = min(distanceTo[j], pathLength)
                            visited.insert(nextColouredNode)
                        }
                    }
                }
            }
        }

        for i in 1..<n where distanceTo[i] == Int.max { distanceTo[i] = -1 }
        return distanceTo
    }
    

    private func builgGraph(vertexNumber: Int, redEdges: [[Int]], blueEdges: [[Int]]) ->  [[Int]] {
        var graph = [[Int]](repeating: [Int](repeating: Int.min, count: vertexNumber), count: vertexNumber)
        
        for redEdge in redEdges { graph[redEdge[0]][redEdge[1]] = 1 }
        for blueEdge in blueEdges {
            let from = blueEdge[0]
            let to = blueEdge[1]
            graph[from][to] = graph[from][to] == 1 ? 0 : -1
        }
        
        return graph
    }

}