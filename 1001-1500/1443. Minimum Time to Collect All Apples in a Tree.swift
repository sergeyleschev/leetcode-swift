class Solution {

    // Solution by Sergey Leschev

    // 1443. Minimum Time to Collect All Apples in a Tree
    // Given an undirected tree consisting of n vertices numbered from 0 to n-1, which has some apples in their vertices. You spend 1 second to walk over one edge of the tree. Return the minimum time in seconds you have to spend to collect all apples in the tree, starting at vertex 0 and coming back to this vertex.
    // The edges of the undirected tree are given in the array edges, where edges[i] = [ai, bi] means that exists an edge connecting the vertices ai and bi. Additionally, there is a boolean array hasApple, where hasApple[i] = true means that vertex i has an apple; otherwise, it does not have any apple.

    // Example 1:
    // Input: n = 7, edges = [[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]], hasApple = [false,false,true,false,true,true,false]
    // Output: 8
    // Explanation: The figure above represents the given tree where red vertices have an apple. One optimal path to collect all apples is shown by the green arrows.

    // Example 2:
    // Input: n = 7, edges = [[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]], hasApple = [false,false,true,false,false,true,false]
    // Output: 6
    // Explanation: The figure above represents the given tree where red vertices have an apple. One optimal path to collect all apples is shown by the green arrows.

    // Example 3:
    // Input: n = 7, edges = [[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]], hasApple = [false,false,false,false,false,false,false]
    // Output: 0

    // Constraints:
    // 1 <= n <= 10^5
    // edges.length == n - 1
    // edges[i].length == 2
    // 0 <= ai < bi <= n - 1
    // fromi < toi
    // hasApple.length == n

    func minTime(_ n: Int, _ edges: [[Int]], _ hasApple: [Bool]) -> Int {
        guard n > 1 && hasApple.contains(true) else { return 0 }
        var tree = [Int: [Int]]()
        var visited = [Bool](repeating: false, count: n)
        var visitedEdges = Set<Int>()

        func update(_ path: [Int]) {
            guard path.count > 1 else { return }

            for idx in stride(from: path.count - 1, through: 1, by: -1) {
                let from = min(path[idx], path[idx - 1])
                let to = max(path[idx], path[idx - 1])
                let e = from << 32 | to
                guard !visitedEdges.contains(e) else { return }
                visitedEdges.insert(e)
            }
        }

        func dfs(_ node: Int, _ curPath: [Int]) {
            guard !visited[node] else { return }
            visited[node] = true
            let newPath = curPath + [node]
            if hasApple[node] { update(newPath) }
            guard let children = tree[node] else { return }

            for ch in children {
                guard !visited[ch] else { continue }
                dfs(ch, newPath)
            }
        }

        for edge in edges {
            tree[edge[0], default: []].append(edge[1])
            tree[edge[1], default: []].append(edge[0])
        }

        dfs(0, [])
        return visitedEdges.count << 1
    }

}
