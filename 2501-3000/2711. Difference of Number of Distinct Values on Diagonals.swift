class Solution {

    // Solution by Sergey Leschev
    // 2711. Difference of Number of Distinct Values on Diagonals

    func differenceOfDistinctValues(_ grid: [[Int]]) -> [[Int]] {
        var ans = Array(repeating: Array(repeating: 0, count: grid[0].count), count: grid.count)

        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                var x = i + 1
                var y = j + 1
                var p = i - 1
                var q = j - 1
                var bottomRight = Set<Int>()
                var topLeft = Set<Int>()

                while x < grid.count && y < grid[0].count {
                    bottomRight.insert(grid[x][y])
                    x += 1
                    y += 1
                }

                while p >= 0 && q >= 0 {
                    topLeft.insert(grid[p][q])
                    p -= 1
                    q -= 1
                }

                ans[i][j] = abs(bottomRight.count - topLeft.count)
            }
        }

        return ans
    }
}
