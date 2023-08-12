class Solution {

    // Solution by Sergey Leschev
    // 2812. Find the Safest Path in a Grid
    // Binary Search, BFS

    func maximumSafenessFactor(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let rowDir = [-1, 1, 0, 0]
        let colDir = [0, 0, -1, 1]

        func isValid(_ visited: [[Bool]], _ i: Int, _ j: Int) -> Bool {
            if i < 0 || j < 0 || i == visited.count || j == visited[0].count || visited[i][j] {
                return false
            }
            return true
        }

        func isSafe(_ distToThief: [[Int]], _ safeDist: Int) -> Bool {
            var q: [(Int, Int)] = []
            if distToThief[0][0] < safeDist {
                return false
            }
            q.append((0, 0))
            var visited = Array(repeating: Array(repeating: false, count: n), count: n)
            visited[0][0] = true

            while !q.isEmpty {
                let (currRow, currCol) = q.removeFirst()
                if currRow == n - 1 && currCol == n - 1 {
                    return true
                }
                for dirIdx in 0..<4 {
                    let newRow = currRow + rowDir[dirIdx]
                    let newCol = currCol + colDir[dirIdx]
                    if isValid(visited, newRow, newCol) {
                        if distToThief[newRow][newCol] < safeDist {
                            continue
                        }
                        visited[newRow][newCol] = true
                        q.append((newRow, newCol))
                    }
                }
            }
            return false
        }

        var q: [(Int, Int)] = []
        var visited = Array(repeating: Array(repeating: false, count: n), count: n)
        var distToThief = Array(repeating: Array(repeating: -1, count: n), count: n)

        // Add all the thieves to the queue
        for i in 0..<n {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    visited[i][j] = true
                    q.append((i, j))
                }
            }
        }

        // BFS to fill the "distToThief" 2D array
        var dist = 0
        while !q.isEmpty {
            let size = q.count
            for _ in 0..<size {
                let (currRow, currCol) = q.removeFirst()
                distToThief[currRow][currCol] = dist
                for dirIdx in 0..<4 {
                    let newRow = currRow + rowDir[dirIdx]
                    let newCol = currCol + colDir[dirIdx]
                    if isValid(visited, newRow, newCol) {
                        visited[newRow][newCol] = true
                        q.append((newRow, newCol))
                    }
                }
            }
            dist += 1
        }

        // Binary Search
        var low = 0
        var high = Int.max
        var ans = 0
        while low <= high {
            let mid = low + (high - low) / 2
            if isSafe(distToThief, mid) {
                ans = mid
                low = mid + 1
            } else {
                high = mid - 1
            }
        }

        return ans
    }
}
