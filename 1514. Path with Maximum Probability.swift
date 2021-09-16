class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1514. Path with Maximum Probability
    // You are given an undirected weighted graph of n nodes (0-indexed), represented by an edge list where edges[i] = [a, b] is an undirected edge connecting the nodes a and b with a probability of success of traversing that edge succProb[i].
    // Given two nodes start and end, find the path with the maximum probability of success to go from start to end and return its success probability.
    // If there is no path from start to end, return 0. Your answer will be accepted if it differs from the correct answer by at most 1e-5.

    // Example 1:
    // Input: n = 3, edges = [[0,1],[1,2],[0,2]], succProb = [0.5,0.5,0.2], start = 0, end = 2
    // Output: 0.25000
    // Explanation: There are two paths from start to end, one having a probability of success = 0.2 and the other has 0.5 * 0.5 = 0.25.

    // Example 2:
    // Input: n = 3, edges = [[0,1],[1,2],[0,2]], succProb = [0.5,0.5,0.3], start = 0, end = 2
    // Output: 0.30000

    // Example 3:
    // Input: n = 3, edges = [[0,1]], succProb = [0.5], start = 0, end = 2
    // Output: 0.00000
    // Explanation: There is no path between 0 and 2.

    // Constraints:
    // 2 <= n <= 10^4
    // 0 <= start, end < n
    // start != end
    // 0 <= a, b < n
    // a != b
    // 0 <= succProb.length == edges.length <= 2*10^4
    // 0 <= succProb[i] <= 1
    // There is at most one edge between every two nodes.

    // Solution: BFS + Queue

    var visited = [Int]()
    var maxProb: Double = 0

    
    func maxProbability(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start: Int, _ end: Int) -> Double {
        var path = [[(Int, Double)]](repeating: [(Int, Double)](), count: n)
        var probs = [Double](repeating: 0, count: edges.count)
        var queue = [(Int, Double)]()
        
        for i in 0..<edges.count {
            let edge = edges[i]
            path[edge[0]].append((edge[1], succProb[i]))
            path[edge[1]].append((edge[0], succProb[i]))
        }
        
        queue.append((start, 1.0))

        while queue.count > 0 {
            let (vertex, prob) = queue.removeFirst()
            if path[vertex].count == 0 { return 0 }

            for (next, nextProb) in path[vertex] {
                let p = prob * nextProb
                if next >= probs.count { return 0 }
                if probs[next] >= p { continue }
                queue.append((next, p))
                probs[next] = p
            }
        }
        
        return probs[end]
    }


    func maxProbability_fail(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start: Int, _ end: Int) -> Double {        
        for _ in 0..<n  { visited.append(0) }
        dfs(start, n, edges, succProb, end, 1)
        return maxProb
    }

    
    func dfs(_ vertex:Int, _ n:Int, _ edges: [[Int]], _ succProb: [Double],_ end:Int,_ last:Double)-> Double {
        var prob: Double = 0
        let edgeN = edges.count
        
        visited[vertex] = 1
        
        for i in 0..<edgeN {    
            var next = -1
            if edges[i][0] == vertex { next = edges[i][1] }
            if edges[i][1] == vertex { next = edges[i][0] }
            if next != -1 && visited[next] == 0 {
                prob = succProb[i]
                if next == end {
                    maxProb = max(maxProb, prob*last)
                    return prob * last
                } 
                else { dfs(next, n, edges, succProb, end,prob) }
            }
        }

        return prob
    }

}