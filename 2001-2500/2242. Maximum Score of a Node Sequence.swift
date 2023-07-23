class Solution {

    // Solution by Sergey Leschev
    // 2242. Maximum Score of a Node Sequence

    func maximumScore(_ scores: [Int], _ edges: [[Int]]) -> Int {
        let n = scores.count
        var graph = [[Int]](repeating: [], count: n)

        func add(_ node: Int, _ child: Int) {
            var children = graph[node]
            guard children.count >= 3 else {
                children.append(child)
                if children.count == 3 {
                    children.sort { scores[$0] < scores[$1] }
                }
                graph[node] = children
                return
            }

            guard scores[child] > scores[children[0]] else { return }
            if let idx = children.firstIndex(where: { scores[$0] > scores[child] }) {
                children.insert(child, at: idx)
            } else {
                children.append(child)
            }
            children.removeFirst()
            graph[node] = children
        }

        for e in edges {
            add(e[0], e[1])
            add(e[1], e[0])
        }

        var ans = -1

        for e in edges {
            guard !graph[e[0]].isEmpty && !graph[e[1]].isEmpty else { continue }
            let s = scores[e[0]] + scores[e[1]]
            for lastNode in graph[e[0]] {
                for nextNode in graph[e[1]] {
                    guard lastNode != nextNode && lastNode != e[1] && nextNode != e[0] else {
                        continue
                    }
                    ans = max(ans, s + scores[lastNode] + scores[nextNode])
                }
            }
        }

        return ans
    }
}