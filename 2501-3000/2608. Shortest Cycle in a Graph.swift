class Solution {

    // Solution by Sergey Leschev
    // 2608. Shortest Cycle in a Graph
    
    // BFS

    func findShortestCycle(_ n: Int, _ edges: [[Int]]) -> Int {
        var ans = Int.max

        func bfs(_ src: Int, _ adj: [[Int]], _ n: Int) {
            var distance = [Int](repeating: Int.max, count: n)
            var parent = [Int](repeating: -1, count: n)
            var queue = [Int]()

            distance[src] = 0
            queue.append(src)

            while !queue.isEmpty {
                let node = queue.removeFirst()

                for neigh in adj[node] {
                    if distance[neigh] == Int.max {
                        distance[neigh] = 1 + distance[node]
                        parent[neigh] = node
                        queue.append(neigh)
                    } else if parent[node] != neigh && parent[neigh] != node {
                        ans = min(ans, distance[neigh] + distance[node] + 1)
                    }
                }
            }
        }

        var adj = [[Int]](repeating: [Int](), count: n)

        for edge in edges {
            let u = edge[0]
            let v = edge[1]

            adj[u].append(v)
            adj[v].append(u)
        }

        for i in 0..<n {
            bfs(i, adj, n)
        }

        if ans == Int.max {
            return -1
        }

        return ans
    }
}
