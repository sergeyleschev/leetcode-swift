class Solution {

    // Solution @ Sergey Leschev

    // 685. Redundant Connection II
    // In this problem, a rooted tree is a directed graph such that, there is exactly one node (the root) for which all other nodes are descendants of this node, plus every node has exactly one parent, except for the root node which has no parents.
    // The given input is a directed graph that started as a rooted tree with n nodes (with distinct values from 1 to n), with one additional directed edge added. The added edge has two different vertices chosen from 1 to n, and was not an edge that already existed.
    // The resulting graph is given as a 2D-array of edges. Each element of edges is a pair [ui, vi] that represents a directed edge connecting nodes ui and vi, where ui is a parent of child vi.
    // Return an edge that can be removed so that the resulting graph is a rooted tree of n nodes. If there are multiple answers, return the answer that occurs last in the given 2D-array.

    // Example 1:
    // Input: edges = [[1,2],[1,3],[2,3]]
    // Output: [2,3]

    // Example 2:
    // Input: edges = [[1,2],[2,3],[3,4],[4,1],[1,5]]
    // Output: [4,1]

    // Constraints:
    // n == edges.length
    // 3 <= n <= 1000
    // edges[i].length == 2
    // 1 <= ui, vi <= n
    // ui != vi

    // There are implicitly three wrong situations:
    // 1. HAS 2-parent, NO cycle
    // 2. NO 2-parent, HAS cycle
    // 3. HAS 2-parent, HAS cycle

    var parents = [Int: Int]()
    var candidate1 = [-1, -1]
    var candidate2 = [-1, -1]

    
    func findRedundantDirectedConnection(_ edges: [[Int]]) -> [Int] {
        var edges = edges
        var foundEdge: [Int]?

        // 1. HAS 2-parent
        for i in 0..<edges.count {
            let parent = edges[i][0]
            let child = edges[i][1]
            if let existedParent = parents[child] {
                candidate1 = [existedParent, child]
                candidate2 = edges[i]
                edges[i][1] = -1
            } else {
                parents[child] = parent
            }
        }

        parents = [Int: Int]()

        for edge in edges {
            guard edge[1] != -1 else { continue }
            if let foundEdge = union(edge[0], edge[1]) { return foundEdge }
        }

        // If we reach this point, that means we previously invalidated the corrent "wrong" edge and there is no cycle,
        // which is situation 1, just return candidate2.
        return candidate2
    }
    

    private func union(_ x: Int, _ y: Int) -> [Int]? {
        let xParent = find(x)
        let yParent = find(y)
        guard xParent != yParent else {
            if candidate1[0] == -1 {
                return [x, y]
            } else {
                return candidate1
            }
        }
        parents[yParent] = xParent
        return nil
    }
    

    private func find(_ x: Int) -> Int {
        if parents[x] == nil { return x }
        return find(parents[x]!)
    }

}