class Solution {

    // Solution by Sergey Leschev

    // 1192. Critical Connections in a Network
    // There are n servers numbered from 0 to n - 1 connected by undirected server-to-server connections forming a network where connections[i] = [ai, bi] represents a connection between servers ai and bi. Any server can reach other servers directly or indirectly through the network.
    // A critical connection is a connection that, if removed, will make some servers unable to reach some other server.
    // Return all critical connections in the network in any order.

    // Example 1:
    // Input: n = 4, connections = [[0,1],[1,2],[2,0],[1,3]]
    // Output: [[1,3]]
    // Explanation: [[3,1]] is also accepted.

    // Constraints:
    // 2 <= n <= 10^5
    // n - 1 <= connections.length <= 10^5
    // 0 <= ai, bi <= n - 1
    // ai != bi
    // There are no repeated connections.

    // Solution: DFS
    // edge is critical, if and only if it is not in a circle
    // - How to find edge in circle
    //   - use DFS to find cycles and decide whether or not discard them
    //   - define rank of a node: depth of a node during DFS, starting node has rank 0
    //   - only we've started but not finish visiting have ranks, 0 <= rank < n
    //   - if node not visited yet, special rank -2
    //   - if fully completed visit node, special rank n
    // - How can rank help removing circle
    //   - have a current path of length k during a DFS. The nodes on the path has increasing ranks from 0 to kand incrementing by 1. Surprisingly, your next visit finds a node that has a rank of p where 0 <= p < k. Why does it happen? Aha! You found a node that is on the current search path!
    //   - How does the upper level of search knows, if you backtrack? Let's make use of the return value of DFS: dfs function returns the minimum rank it finds. During a step of search from node u to its neighbor v, if dfs(v) returns something smaller than or equal to rank(u), then u knows its neighbor v helped it to find a cycle back to u or u's ancestor. So u knows it should discard the edge (u, v) which is in a cycle.
    
    // - Complexity:
    //   - time: O(V + E)
    //   - space: O(E)

    func criticalConnections(_ n: Int, _ connections: [[Int]]) -> [[Int]] {
        var graph = [Int: [Int]]()

        for c in connections {
            graph[c[0], default: [Int]()].append(c[1])
            graph[c[1], default: [Int]()].append(c[0])
        }

        var setc: Set<[Int]> = Set(connections)
        var rank = Array(repeating: -2, count: n)

        dfs(graph, 0, 0, n, &rank, &setc)

        return Array(setc)
    }


    func dfs(_ graph: [Int: [Int]], _ node: Int, _ depth: Int, _ n: Int, _ rank: inout [Int], _ setc: inout Set<[Int]>) -> Int {
        if rank[node] >= 0 { return rank[node] } // visited node
        rank[node] = depth
        var minDepth = n

        if let list = graph[node] {
            for next in list {
                if rank[next] == depth - 1 { continue } // ignore parent
                let temp = dfs(graph, next, depth + 1, n, &rank, &setc)
                
                if temp <= depth {
                    // try to remove both possible combinations
                    setc.remove([node, next])
                    setc.remove([next, node])
                }
                
                minDepth = min(minDepth, temp)
            }
        }

        return minDepth
    }
    
}