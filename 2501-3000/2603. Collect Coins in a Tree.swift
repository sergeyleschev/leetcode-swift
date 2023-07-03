class Solution {

    // Solution by Sergey Leschev
    // 2603. Collect Coins in a Tree

    // Time complexity: O(N)
    // Space complexity: O(N)

    func collectTheCoins(_ coins: [Int], _ edges: [[Int]]) -> Int {
        let n = coins.count
        var g = [Set<Int>?](repeating: nil, count: n)

        for edge in edges {
            if g[edge[0]] == nil {
                g[edge[0]] = Set<Int>()
            }
            g[edge[0]]?.insert(edge[1])

            if g[edge[1]] == nil {
                g[edge[1]] = Set<Int>()
            }
            g[edge[1]]?.insert(edge[0])
        }

        var leaves = [Int]()
        var totalEdges = edges.count * 2
        var deleted = 0

        // Add the leaves which don't have any coins
        for i in 0..<n {
            if let neighbors = g[i], neighbors.count == 1, coins[i] == 0 {
                leaves.append(i)
            }
        }

        while !leaves.isEmpty {
            let leaf = leaves.removeFirst()

            if let neighbors = g[leaf], !neighbors.isEmpty {
                let p = neighbors.first!  // Parent

                g[p]?.remove(leaf)
                deleted += 1
                g[leaf]?.remove(p)
                deleted += 1

                if let parentNeighbors = g[p], parentNeighbors.count == 1, coins[p] == 0 {
                    leaves.append(p)
                }
            }
        }

        // Now the leaves would be having the coins
        for i in 0..<n {
            if let neighbors = g[i], neighbors.count == 1 {
                leaves.append(i)
            }
        }

        // Now I need to remove the leaf nodes and their immediate parents
        var step = 2  // 1 for parent and 1 for children
        while step > 0 {
            var sz = leaves.count
            while sz > 0 {
                let leaf = leaves.removeFirst()

                if let neighbors = g[leaf], !neighbors.isEmpty {
                    let p = neighbors.first!  // Only parent would be there in the leaf

                    g[p]?.remove(leaf)
                    deleted += 1
                    g[leaf]?.remove(p)
                    deleted += 1

                    if let parentNeighbors = g[p], parentNeighbors.count == 1 {
                        leaves.append(p)
                    }
                }

                sz -= 1
            }

            step -= 1
        }

        return totalEdges - deleted
    }
}
