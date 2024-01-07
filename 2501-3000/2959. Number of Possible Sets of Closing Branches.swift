class Solution {

    // Solution by Sergey Leschev
    // 2959. Number of Possible Sets of Closing Branches

    // Time complexity: O(2^n . N^3)
    // Space complexity: O(N^2)

    func numberOfSets(_ n: Int, _ maxDistance: Int, _ roads: [[Int]]) -> Int {
        var ans = 0

        // Iterate through all subsets of nodes (1 << n) using bitmasking
        for i in 0..<(1 << n) {
            // Create an adjacency matrix to represent the graph
            var g = [[Int]](repeating: [Int](repeating: 1_000_000_000, count: n), count: n)

            // Update the graph based on the selected nodes in the subset
            for it in roads {
                let x = it[0]
                let y = it[1]
                let w = it[2]
                if (i >> x & 1) == 1 && (i >> y & 1) == 1 {
                    g[x][y] = min(g[x][y], w)
                    g[y][x] = min(g[y][x], w)
                }
            }

            // Set diagonal elements to 0
            for j in 0..<n {
                g[j][j] = 0
            }

            // Floyd-Warshall algorithm for finding the shortest paths
            for p in 0..<n {
                for q in 0..<n {
                    for k in 0..<n {
                        g[q][k] = min(g[q][k], g[q][p] + g[p][k])
                    }
                }
            }

            // Check if the selected nodes in the subset form a valid set
            var ok = 1
            for j in 0..<n {
                for k in 0..<n {
                    if (i >> j & 1) == 1 && (i >> k & 1) == 1 {
                        ok &= (g[j][k] <= maxDistance ? 1 : 0)
                    }
                }
            }

            // Increment the answer if the subset forms a valid set
            ans += ok
        }
        return ans
    }
}
