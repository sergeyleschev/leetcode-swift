class Solution {

    // Solution by Sergey Leschev
    // 2646. Minimize the Total Price of the Trips

    var count = [Int](repeating: 0, count: 100)
    var graph = [[Int]](repeating: [Int](), count: 100)

    func path(_ node1: Int, _ node2: Int, _ p: Int = -1) -> Int {
        if node1 == node2 {
            count[node1] += 1
            return 1
        }

        for it in graph[node1] {
            if it != p {
                if path(it, node2, node1) != 0 {
                    count[node1] += 1
                    return 1
                }
            }
        }

        return 0
    }

    func find(_ node: Int, _ price: [Int], _ parent: Int = -1) -> (Int, Int) {
        var p = (count[node] * price[node], count[node] * price[node] / 2)

        for it in graph[node] {
            if it != parent {
                let current = find(it, price, node)
                p.0 += min(current.0, current.1)
                p.1 += current.0
            }
        }

        return p
    }

    func minimumTotalPrice(_ n: Int, _ edges: [[Int]], _ price: [Int], _ trips: [[Int]]) -> Int {
        for it in edges {
            graph[it[0]].append(it[1])
            graph[it[1]].append(it[0])
        }

        for it in trips {
            _ = path(it[0], it[1])
        }

        let p = find(0, price)
        return min(p.0, p.1)
    }
}
