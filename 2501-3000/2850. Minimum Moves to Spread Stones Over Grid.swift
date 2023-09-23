class Solution {

    // Solution by Sergey Leschev
    // 2850. Minimum Moves to Spread Stones Over Grid
    // DFS

    func minimumMoves(_ grid: [[Int]]) -> Int {
        var memo = [String: Int]()

        func computeString(_ g: [[Int]]) -> String {
            var res = ""
            for i in 0..<3 {
                for j in 0..<3 {
                    res += String(g[i][j])
                }
            }
            return res
        }

        func dfs(_ grid: inout [[Int]]) -> Int {
            let gridS = computeString(grid)
            if let cachedResult = memo[gridS] {
                return cachedResult
            }

            var nonZero = true
            for i in 0..<3 {
                for j in 0..<3 {
                    if grid[i][j] == 0 {
                        nonZero = false
                    }
                }
            }

            if nonZero {
                memo[gridS] = 0
                return 0
            }

            var res = Int.max
            for i in 0..<3 {
                for j in 0..<3 {
                    if grid[i][j] == 0 {
                        for x in 0..<3 {
                            for y in 0..<3 {
                                if grid[x][y] > 1 {
                                    let dist = abs(i - x) + abs(j - y)
                                    grid[i][j] += 1
                                    grid[x][y] -= 1
                                    res = min(res, dist + dfs(&grid))
                                    grid[i][j] -= 1
                                    grid[x][y] += 1
                                }
                            }
                        }
                    }
                }
            }

            memo[gridS] = res
            return res
        }

        var mutableGrid = grid
        return dfs(&mutableGrid)
    }
}
