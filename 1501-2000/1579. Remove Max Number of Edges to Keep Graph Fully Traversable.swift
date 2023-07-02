class Solution {

    // Solution by Sergey Leschev

    // 1579. Remove Max Number of Edges to Keep Graph Fully Traversable
    // Alice and Bob have an undirected graph of n nodes and 3 types of edges:
    // Type 1: Can be traversed by Alice only.
    // Type 2: Can be traversed by Bob only.
    // Type 3: Can by traversed by both Alice and Bob.
    // Given an array edges where edges[i] = [type(i), u(i), v(i)] represents a bidirectional edge of type type(i) between nodes u(i) and v(i), find the maximum number of edges you can remove so that after removing the edges, the graph can still be fully traversed by both Alice and Bob. The graph is fully traversed by Alice and Bob if starting from any node, they can reach all other nodes.

    // Return the maximum number of edges you can remove, or return -1 if it's impossible for the graph to be fully traversed by Alice and Bob.

    // Example 1:
    // Input: n = 4, edges = [[3,1,2],[3,2,3],[1,1,3],[1,2,4],[1,1,2],[2,3,4]]
    // Output: 2
    // Explanation: If we remove the 2 edges [1,1,2] and [1,1,3]. The graph will still be fully traversable by Alice and Bob. Removing any additional edge will not make it so. So the maximum number of edges we can remove is 2.

    // Example 2:
    // Input: n = 4, edges = [[3,1,2],[3,2,3],[1,1,4],[2,1,4]]
    // Output: 0
    // Explanation: Notice that removing any edge will not make the graph fully traversable by Alice and Bob.

    // Example 3:
    // Input: n = 4, edges = [[3,2,3],[1,1,2],[2,3,4]]
    // Output: -1
    // Explanation: In the current graph, Alice cannot reach node 4 from the other nodes. Likewise, Bob cannot reach 1. Therefore it's impossible to make the graph fully traversable.

    // Constraints:
    // 1 <= n <= 10^5
    // 1 <= edges.length <= min(10^5, 3 * n * (n-1) / 2)
    // edges[i].length == 3
    // 1 <= edges[i][0] <= 3
    // 1 <= edges[i][1] < edges[i][2] <= n
    // All tuples (type(i), u(i), v(i)) are distinct.

    func maxNumEdgesToRemove(_ n: Int, _ edges: [[Int]]) -> Int {
        let union = Union(n)
        var ans: Int = 0

        for i in 0..<edges.count {
            let edge = edges[i]
            if edge[0] == 3 {
                let result = union.unit(edge[1], edge[2])
                if !result { ans += 1 }
            }
        }

        let unionA = union.copy()
        let unionB = union.copy()

        for i in 0..<edges.count {
            let edge = edges[i]
            if edge[0] == 1 {
                let result = unionA.unit(edge[1], edge[2])
                if !result { ans += 1 }
            }
            if edge[0] == 2 {
                let result = unionB.unit(edge[1], edge[2])
                if !result { ans += 1 }
            }
        }

        if unionA.setCount > 1 || unionB.setCount > 1 { return -1 }
        return ans
    }

    private class Union {
        private var union: [Int] = [0]
        var setCount: Int

        init(_ n: Int) {
            for i in 1...n { union.append(i) }
            setCount = n
        }

        init(_ obj: Union) {
            self.union = obj.union
            self.setCount = obj.setCount
        }

        func copy() -> Union {
            let union = Union(self)
            return union
        }

        func unit(_ i1: Int, _ i2: Int) -> Bool {
            if find(i1) != find(i2) {
                union[find(i1)] = find(i2)
                setCount -= 1
                return true
            }
            return false
        }

        func find(_ i: Int) -> Int {
            if union[i] != i { union[i] = find(union[i]) }
            return union[i]
        }
    }

}
