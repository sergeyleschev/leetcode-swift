class Solution {

    // 1203. Sort Items by Groups Respecting Dependencies
    // There are n items each belonging to zero or one of m groups where group[i] is the group that the i-th item belongs to and it's equal to -1 if the i-th item belongs to no group. The items and the groups are zero indexed. A group can have no item belonging to it.
    // Return a sorted list of the items such that:
    // The items that belong to the same group are next to each other in the sorted list.
    // There are some relations between these items where beforeItems[i] is a list containing all the items that should come before the i-th item in the sorted array (to the left of the i-th item).
    // Return any solution if there is more than one solution and return an empty list if there is no solution.

    // Example 1:
    // Input: n = 8, m = 2, group = [-1,-1,1,0,0,1,0,-1], beforeItems = [[],[6],[5],[6],[3,6],[],[],[]]
    // Output: [6,3,4,1,5,2,0,7]

    // Example 2:
    // Input: n = 8, m = 2, group = [-1,-1,1,0,0,1,0,-1], beforeItems = [[],[6],[5],[6],[3],[],[4],[]]
    // Output: []
    // Explanation: This is the same as example 1 except that 4 needs to be before 6 in the sorted list.

    // Constraints:
    // 1 <= m <= n <= 3 * 10^4
    // group.length == beforeItems.length == n
    // -1 <= group[i] <= m - 1
    // 0 <= beforeItems[i].length <= n - 1
    // 0 <= beforeItems[i][j] <= n - 1
    // i != beforeItems[i][j]
    // beforeItems[i] does not contain duplicates elements.

    func sortItems(_ n: Int, _ m: Int, _ group: [Int], _ beforeItems: [[Int]]) -> [Int] {
        let N = n + m // add some pseudo-vertex to represent group
        var adj = [[Int]](repeating: [], count: N)
        var inDegree = [Int](repeating: 0, count: N)

        for (v, g) in group.enumerated() where g >= 0 {
            adj[n + g].append(v)
            inDegree[v] += 1
        }

        for v in 0..<n {
            for u in beforeItems[v] {
                let gu = group[u] >= 0 ? n + group[u] : u
                let gv = group[v] >= 0 ? n + group[v] : v
                if gu == gv {
                    adj[u].append(v) // in-group prerequisites => attach on normal vertices
                    inDegree[v] += 1
                } else {
                    adj[gu].append(gv) // inter-group prerequisites => attach on group vertices
                    inDegree[gv] += 1
                }
            }
        }

        // KEY we must generate topological sequence by dfs
        var topo = [Int]()
        func dfs(_ u: Int) {
            topo.append(u)
            inDegree[u] = -1 // visited
            for v in adj[u] {
                inDegree[v] -= 1
                if inDegree[v] == 0 { dfs(v) }
            }
        }

        for u in 0..<N where inDegree[u] == 0 { dfs(u) }
        return topo.count == N ? topo.filter { $0 < n } : []
    }

}