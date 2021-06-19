class Solution {

    // 743. Network Delay Time
    // You are given a network of n nodes, labeled from 1 to n. You are also given times, a list of travel times as directed edges times[i] = (ui, vi, wi), where ui is the source node, vi is the target node, and wi is the time it takes for a signal to travel from source to target.
    // We will send a signal from a given node k. Return the time it takes for all the n nodes to receive the signal. If it is impossible for all the n nodes to receive the signal, return -1.

    // Example 1:
    // Input: times = [[2,1,1],[2,3,1],[3,4,1]], n = 4, k = 2
    // Output: 2

    // Example 2:
    // Input: times = [[1,2,1]], n = 2, k = 1
    // Output: 1

    // Example 3:
    // Input: times = [[1,2,1]], n = 2, k = 2
    // Output: -1

    // Constraints:
    // 1 <= k <= n <= 100
    // 1 <= times.length <= 6000
    // times[i].length == 3
    // 1 <= ui, vi <= n
    // ui != vi
    // 0 <= wi <= 100
    // All the pairs (ui, vi) are unique. (i.e., no multiple edges.)

    // Bellman Ford

    func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
        typealias Node = Int
        typealias Weight = Int
        let inf = Weight.max / 3 // avoid overflow
        var adj = [[(node: Node, weight: Weight)]](repeating: [], count: N + 1)
        times.forEach { adj[$0[0]].append((node: $0[1], weight: $0[2])) }

        var dist = [Weight](repeating: inf, count: N + 1)
        dist[K] = 0
        var updated = [Bool](repeating: true, count: N + 1)

        for _ in 1...(N - 1) {
            var newUpdated = [Bool](repeating: false, count: N + 1)
            for u in 1...N {
                guard updated[u] else { continue }
                adj[u].forEach { v, weight in
                    if dist[v] > dist[u] + weight {
                        dist[v] = dist[u] + weight
                        newUpdated[v] = true
                    }
                }
            }
            if newUpdated.allSatisfy({ $0 == false }) { break }
            else { updated = newUpdated }
        }

        let ans = dist.dropFirst().max()! // v = 0 is not used
        return ans == inf ? -1 : ans
    }
    
}