class Solution {

    // Solution by Sergey Leschev
    
    // 1970. Last Day Where You Can Still Cross

    func latestDayToCross(_ row: Int, _ col: Int, _ cells: [[Int]]) -> Int {
        var left = 1
        var right = cells.count
        var ans = 0

        while left <= right {
            let mid = left + (right - left) / 2
            if canWalk(cells, row, col, mid) {
                ans = mid  // Update current answer so far
                left = mid + 1  // Try to find a larger day
            } else {
                right = mid - 1  // Try to find a smaller day
            }
        }

        return ans
    }

    let dir = [0, 1, 0, -1, 0]

    func canWalk(_ cells: [[Int]], _ row: Int, _ col: Int, _ dayAt: Int) -> Bool {
        var grid = [[Bool]](repeating: [Bool](repeating: false, count: col), count: row)  // Create grid in the `dayAt` th date

        for i in 0..<dayAt {
            grid[cells[i][0] - 1][cells[i][1] - 1] = true
        }

        var bfs = [(Int, Int)]()

        for c in 0..<col {
            if grid[0][c] == false {  // Add all valid start cells in the top row
                bfs.append((0, c))
                grid[0][c] = true  // Mark as visited
            }
        }

        var currentIndex = 0

        while currentIndex < bfs.count {
            let (r, c) = bfs[currentIndex]

            if r == row - 1 {
                return true  // Reached bottom -> Return valid
            }

            for i in 0..<4 {
                let nr = r + dir[i]
                let nc = c + dir[i + 1]

                if nr < 0 || nr == row || nc < 0 || nc == col || grid[nr][nc] == true {
                    continue
                }

                grid[nr][nc] = true  // Mark as visited
                bfs.append((nr, nc))
            }

            currentIndex += 1
        }

        return false
    }
}
