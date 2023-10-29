class Solution {

    // Solution by Sergey Leschev
    // 2876. Count Visited Nodes in a Directed Graph

    // Time complexity: O(n)
    // Space complexity: O(n)

    func countVisitedNodes(_ edges: [Int]) -> [Int] {
        let n = edges.count
        var indegree = [Int](repeating: 0, count: n)
        var result = [Int](repeating: 0, count: n)
        var visited = [Bool](repeating: false, count: n)
        var queue = [Int]()
        var stack = [Int]()

        // Calculate indegree of each node
        for e in edges {
            indegree[e] += 1
        }

        // Find nodes with indegree 0 and add them to the queue
        for i in 0..<n {
            if indegree[i] == 0 {
                queue.append(i)
            }
        }

        // Topological sort
        while !queue.isEmpty {
            let x = queue.removeFirst()
            stack.append(x)
            visited[x] = true

            // Reduce indegree of the connected node
            indegree[edges[x]] -= 1

            if indegree[edges[x]] == 0 {
                queue.append(edges[x])
            }
        }

        // Handle nodes that are part of a cycle
        for i in 0..<n {
            if !visited[i] {
                fillCycle(edges: edges, visited: &visited, result: &result, start: i)
            }
        }

        // Calculate the result
        while !stack.isEmpty {
            let x = stack.removeLast()
            result[x] = result[edges[x]] + 1
        }

        return result
    }

    private func fillCycle(edges: [Int], visited: inout [Bool], result: inout [Int], start: Int) {
        var length = 0
        var x = start

        while !visited[x] {
            visited[x] = true
            length += 1
            x = edges[x]
        }

        result[start] = length

        x = edges[start]
        while x != start {
            result[x] = length
            x = edges[x]
        }
    }
}
