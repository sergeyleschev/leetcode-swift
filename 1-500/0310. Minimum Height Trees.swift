class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 310. Minimum Height Trees
    // A tree is an undirected graph in which any two vertices are connected by exactly one path. In other words, any connected graph without simple cycles is a tree.
    // Given a tree of n nodes labelled from 0 to n - 1, and an array of n - 1 edges where edges[i] = [ai, bi] indicates that there is an undirected edge between the two nodes ai and bi in the tree, you can choose any node of the tree as the root. When you select a node x as the root, the result tree has height h. Among all possible rooted trees, those with minimum height (i.e. min(h))  are called minimum height trees (MHTs).
    // Return a list of all MHTs' root labels. You can return the answer in any order.
    // The height of a rooted tree is the number of edges on the longest downward path between the root and a leaf.

    // Finds a list of all minimum height trees root labels.

    // - Parameters:
    //   - n: The number of nodes in the graph.
    //   - edges: An array of edges.
    // - Returns: The list of all minimum height trees roots labels.

    // Example 1:
    // Input: n = 4, edges = [[1,0],[1,2],[1,3]]
    // Output: [1]
    // Explanation: As shown, the height of the tree is 1 when the root is the node with label 1 which is the only MHT.

    // Example 2:
    // Input: n = 6, edges = [[3,0],[3,1],[3,2],[3,4],[5,4]]
    // Output: [3,4]

    // Example 3:
    // Input: n = 1, edges = []
    // Output: [0]

    // Example 4:
    // Input: n = 2, edges = [[0,1]]
    // Output: [0,1]

    // Constraints:
    // 1 <= n <= 2 * 10^4
    // edges.length == n - 1
    // 0 <= ai, bi < n
    // ai != bi
    // All the pairs (ai, bi) are distinct.
    // The given input is guaranteed to be a tree and there will be no repeated edges.

    // - Complexity:
    //   - time: O(n), where n is the number of nodes in the graph.
    //   - space: O(n), where n is the number of nodes in the graph.

    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        guard n > 1 else { return [0] }
        var n = n
        var neighbors = Array(repeating: Set<Int>(), count: n)
        var inDegrees = Array(repeating: 0, count: n)
        var leaves = [Int]()

        for edge in edges {
            neighbors[edge[0]].insert(edge[1])
            neighbors[edge[1]].insert(edge[0])
            inDegrees[edge[0]] += 1
            inDegrees[edge[1]] += 1
        }

        for (node, degree) in inDegrees.enumerated() {
            guard degree == 1 else { continue }
            leaves.append(node)
        }

        while n > 2 {
            n -= leaves.count

            var newLeaves = [Int]()
            for leaf in leaves {
                guard let neighbor = neighbors[leaf].first else { continue }

                neighbors[neighbor].remove(leaf)
                inDegrees[leaf] -= 1
                inDegrees[neighbor] -= 1

                guard inDegrees[neighbor] == 1 else { continue }
                newLeaves.append(neighbor)
            }

            leaves = newLeaves
        }

        return leaves
    }

}