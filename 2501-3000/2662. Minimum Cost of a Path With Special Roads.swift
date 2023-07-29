class Solution {

    // Solution by Sergey Leschev
    // 2662. Minimum Cost of a Path With Special Roads
    // Dijkstra's Algorithm with roads as edges

    func minimumCost(_ start: [Int], _ target: [Int], _ specialRoads: [[Int]]) -> Int {
        var specialRoads = specialRoads.filter { road in
            let x = road[4]
            return x < abs(start[0] - road[2]) + abs(start[1] - road[3])
        }
        var dist = [Int: Int]()
        var heap = [(Int, Int, Int)]()

        dist[start[0] << 16 | start[1]] = 0
        heap.append((0, start[0], start[1]))

        while !heap.isEmpty {
            heap.sort { $0.0 < $1.0 }
            let (currdist, x, y) = heap.removeFirst()

            for road in specialRoads {
                let (a, b, c, d, cost) = (road[0], road[1], road[2], road[3], road[4])
                let newDist = currdist + abs(x - a) + abs(y - b) + cost
                let newKey = c << 16 | d

                if dist[newKey] == nil || dist[newKey]! > newDist {
                    dist[newKey] = newDist
                    heap.append((newDist, c, d))
                }
            }
        }

        var res = abs(target[0] - start[0]) + abs(target[1] - start[1])
        for road in specialRoads {
            let (a, b, c, d, cost) = (road[0], road[1], road[2], road[3], road[4])
            let specialDist = dist[c << 16 | d] ?? Int.max
            res = min(res, specialDist + abs(target[0] - c) + abs(target[1] - d))
        }

        return res
    }
}
