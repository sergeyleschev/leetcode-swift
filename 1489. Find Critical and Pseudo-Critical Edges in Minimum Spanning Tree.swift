class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1489. Find Critical and Pseudo-Critical Edges in Minimum Spanning Tree
    // Given a weighted undirected connected graph with n vertices numbered from 0 to n - 1, and an array edges where edges[i] = [ai, bi, weighti] represents a bidirectional and weighted edge between nodes ai and bi. A minimum spanning tree (MST) is a subset of the graph's edges that connects all vertices without cycles and with the minimum possible total edge weight.
    // Find all the critical and pseudo-critical edges in the given graph's minimum spanning tree (MST). An MST edge whose deletion from the graph would cause the MST weight to increase is called a critical edge. On the other hand, a pseudo-critical edge is that which can appear in some MSTs but not all.
    // Note that you can return the indices of the edges in any order.

    // Example 1:
    // Input: n = 5, edges = [[0,1,1],[1,2,1],[2,3,2],[0,3,2],[0,4,3],[3,4,3],[1,4,6]]
    // Output: [[0,1],[2,3,4,5]]
    // Explanation: The figure above describes the graph.
    // The following figure shows all the possible MSTs:
    // Notice that the two edges 0 and 1 appear in all MSTs, therefore they are critical edges, so we return them in the first list of the output.
    // The edges 2, 3, 4, and 5 are only part of some MSTs, therefore they are considered pseudo-critical edges. We add them to the second list of the output.

    // Example 2:
    // Input: n = 4, edges = [[0,1,1],[1,2,1],[2,3,1],[0,3,1]]
    // Output: [[],[0,1,2,3]]
    // Explanation: We can observe that since all 4 edges have equal weight, choosing any 3 edges from the given 4 will yield an MST. Therefore all 4 edges are pseudo-critical.

    // Constraints:
    // 2 <= n <= 100
    // 1 <= edges.length <= min(200, n * (n - 1) / 2)
    // edges[i].length == 3
    // 0 <= ai < bi < n
    // 1 <= weighti <= 1000
    // All pairs (ai, bi) are distinct.

    struct Edges: Hashable {
        var firstNode: Int
        var weight: Int
        var secondNode: Int
    }

    
    func findCriticalAndPseudoCriticalEdges(_ n: Int, _ edges: [[Int]]) -> [[Int]] {
        let sortedEdges = edges.sorted{a, b in a[2] < b[2] } // ascending edge weight to find the minumum overall weight
        var positionDictionary: [(Edges): Int] = [:]        
        // indicies must be returned in the initial order, so we store these edges and their order
        for e in 0..<edges.count { positionDictionary[(Edges(firstNode: edges[e][0], weight: edges[e][1], secondNode: edges[e][2]))] = e }
        let minWeight = dist(n: n, edges: sortedEdges, edge: -1, exclude: -1) // Calculate MST
        var output: [[Int]] = [[],[]]
        
        for e in 0..<sortedEdges.count { // for each edge
            let index = positionDictionary[(Edges(firstNode: sortedEdges[e][0], weight: sortedEdges[e][1], secondNode: sortedEdges[e][2]))]! // we use the original (sorted index)
            if dist(n: n, edges: sortedEdges, edge: -1, exclude: e) > minWeight { output[0].append(index) } 
            else if dist(n: n, edges: sortedEdges, edge: e, exclude: -1) == minWeight { output[1].append(index) }
        }
        
        return output
    }
    

    private func dist(n: Int, edges: [[Int]], edge: Int, exclude: Int) -> Int { // nodes, edges (ordered), chosen edge, exclude
        var parents: [Int] = Array(0...n)
        var cost = 0
        var count = 0

        if (edge != -1) {
            let pick = edges[edge]
            parents[pick[0]] = parents[pick[1]]
            cost += pick[2]
            count += 1
        }
        
        for i in 0..<edges.count { // for each edge
            if (i == exclude) { continue }  // do not take into account the excluded edge
            let root1 = find(p: parents, j: edges[i][0])
            let root2 = find(p: parents, j: edges[i][1])
            if (root1 != root2) {
                parents[root1] = root2
                count += 1
                cost += edges[i][2] // the cost if the node is not part of the network
            }
        }
        
        if (count == n - 1) { return cost } else { return Int.max }
    }
    
    
    private func find(p: [Int], j: Int) -> Int {
        if (p[j] != j) { return find(p: p, j: p[j]) } // basic union find
        return j
    }

}