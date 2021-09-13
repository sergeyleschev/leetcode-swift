class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1377. Frog Position After T Seconds
    // Given an undirected tree consisting of n vertices numbered from 1 to n. A frog starts jumping from vertex 1. In one second, the frog jumps from its current vertex to another unvisited vertex if they are directly connected. The frog can not jump back to a visited vertex. In case the frog can jump to several vertices, it jumps randomly to one of them with the same probability. Otherwise, when the frog can not jump to any unvisited vertex, it jumps forever on the same vertex.
    // The edges of the undirected tree are given in the array edges, where edges[i] = [ai, bi] means that exists an edge connecting the vertices ai and bi.
    // Return the probability that after t seconds the frog is on the vertex target.

    // Example 1:
    // Input: n = 7, edges = [[1,2],[1,3],[1,7],[2,4],[2,6],[3,5]], t = 2, target = 4
    // Output: 0.16666666666666666 
    // Explanation: The figure above shows the given graph. The frog starts at vertex 1, jumping with 1/3 probability to the vertex 2 after second 1 and then jumping with 1/2 probability to vertex 4 after second 2. Thus the probability for the frog is on the vertex 4 after 2 seconds is 1/3 * 1/2 = 1/6 = 0.16666666666666666. 

    // Example 2:
    // Input: n = 7, edges = [[1,2],[1,3],[1,7],[2,4],[2,6],[3,5]], t = 1, target = 7
    // Output: 0.3333333333333333
    // Explanation: The figure above shows the given graph. The frog starts at vertex 1, jumping with 1/3 = 0.3333333333333333 probability to the vertex 7 after second 1. 

    // Example 3:
    // Input: n = 7, edges = [[1,2],[1,3],[1,7],[2,4],[2,6],[3,5]], t = 20, target = 6
    // Output: 0.16666666666666666

    // Constraints:
    // 1 <= n <= 100
    // edges.length == n - 1
    // edges[i].length == 2
    // 1 <= ai, bi <= n
    // 1 <= t <= 50
    // 1 <= target <= n
    // Answers within 10-5 of the actual value will be accepted as correct.

    func frogPosition(_ n: Int, _ edges: [[Int]], _ t: Int, _ target: Int) -> Double {
        var ans: Double = 0.0
        var tree = [Int: [Int]]()
        var visited = Set<Int>()


        func dfs(_ root: Int, _ probablity: Double, _ time: Int ) {
            guard root != target else {
                if time == t {
                    ans += probablity
                } else if time < t {
                    var nextPosition = -1
                    if let nextPositions = tree[root] {
                        for p in nextPositions where !visited.contains(p) { nextPosition = p; break }
                    }
                    if nextPosition == -1 { ans += probablity }
                }
                return
            }
            guard time < t else { return }
            guard let possibleNextPositions = tree[root] else { return }
            let nextPositions = possibleNextPositions.filter { !visited.contains($0) }
            let currentP = 1.0 / Double(nextPositions.count)

            for p in nextPositions {
                visited.insert(p)
                dfs(p, probablity * currentP, time + 1)
                visited.remove(p)
            }
  
        }

        for edge in edges {
            if nil == tree[edge[0]] { tree[edge[0]] = [] }
            if nil == tree[edge[1]] { tree[edge[1]] = [] }
            tree[edge[0]]?.append(edge[1])
            tree[edge[1]]?.append(edge[0])
        }
        
        visited.insert(1)
        dfs(1, 1.0, 0)
        return ans
    }

}