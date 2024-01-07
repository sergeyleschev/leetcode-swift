class Solution {

    // Solution by Sergey Leschev
    // 2976. Minimum Cost to Convert String I
    // BFS/Djikstra

    func minimumCost(
        _ source: String, _ target: String, _ original: [Character], _ changed: [Character],
        _ cost: [Int]
    ) -> Int {
        var graph = [Character: [(Character, Int)]]()

        // Initializing the graph in the node schema: {parent, {(child, cost)}}
        for i in 0..<original.count {
            if graph[original[i]] == nil {
                graph[original[i]] = [(changed[i], cost[i])]
            } else {
                graph[original[i]]!.append((changed[i], cost[i]))
            }
        }

        // Distance array required will only need 26*26 space.
        var distances = Array(repeating: Array(repeating: Int.max, count: 26), count: 26)

        // Running BFS from every node of the original string.
        for char in original {
            bfs(graph, char, &distances)
        }

        var ans = 0
        for i in source.indices {
            // No need to add anything to the answer if source and target are the same.
            if source[i] == target[i] {
                continue
            }

            // If the distance is infinite, the target is not achievable, and hence return -1.
            if distances[Int(source[i].asciiValue! - Character("a").asciiValue!)][
                Int(target[i].asciiValue! - Character("a").asciiValue!)] == Int.max
            {
                return -1
            }

            // Otherwise, add the corresponding value in the distances array.
            ans +=
                distances[Int(source[i].asciiValue! - Character("a").asciiValue!)][
                    Int(target[i].asciiValue! - Character("a").asciiValue!)]
        }

        return ans
    }

    private func bfs(
        _ graph: [Character: [(Character, Int)]], _ source: Character, _ distances: inout [[Int]]
    ) {
        var queue = [(Character, Int)]()
        queue.append((source, 0))

        while !queue.isEmpty {
            let (node, distance) = queue.removeFirst()

            for child in graph[node] ?? [] {
                if distances[Int(source.asciiValue! - Character("a").asciiValue!)][
                    Int(child.0.asciiValue! - Character("a").asciiValue!)] > distance + child.1
                {
                    distances[Int(source.asciiValue! - Character("a").asciiValue!)][
                        Int(child.0.asciiValue! - Character("a").asciiValue!)] = distance + child.1
                    queue.append((child.0, distance + child.1))
                }
            }
        }
    }
}
