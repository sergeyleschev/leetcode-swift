class Solution {

    // Solution @ Sergey Leschev

    // 1895. Largest Magic Square
    // A k x k magic square is a k x k grid filled with integers such that every row sum, every column sum, and both diagonal sums are all equal. The integers in the magic square do not have to be distinct. Every 1 x 1 grid is trivially a magic square.
    // Given an m x n integer grid, return the size (i.e., the side length k) of the largest magic square that can be found within this grid.

    // Example 1:
    // Input: grid = [[7,1,4,5,6],[2,5,1,6,4],[1,5,4,3,2],[1,2,7,3,4]]
    // Output: 3
    // Explanation: The largest magic square has a size of 3.
    // Every row sum, column sum, and diagonal sum of this magic square is equal to 12.
    // - Row sums: 5+1+6 = 5+4+3 = 2+7+3 = 12
    // - Column sums: 5+5+2 = 1+4+7 = 6+3+3 = 12
    // - Diagonal sums: 5+4+3 = 6+4+2 = 12

    // Example 2:
    // Input: grid = [[5,1,3,1],[9,3,3,1],[1,3,3,8]]
    // Output: 2

    // Constraints:
    // m == grid.length
    // n == grid[i].length
    // 1 <= m, n <= 50
    // 1 <= grid[i][j] <= 10^6

    func largestMagicSquare(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var colsPreffix = [[Int]]()
        var rowsPreffix = [[Int]](repeating: [Int](repeating: 0, count: n), count: m + 1)
        var ans = 1
        

        func check(_ r: Int, _ c: Int, _ length: Int) -> Bool {
            let up = colsPreffix[r][c + length] - colsPreffix[r][c]
            let MaxRow =  r + length - 1
            var row = r + 1
            while  row <= MaxRow {
                guard colsPreffix[row][c + length] - colsPreffix[row][c] == up else { return false }
                row += 1
            }
            let left = rowsPreffix[r + length ][c] - rowsPreffix[r][c]
            guard left == up else { return false }
            let maxCol = c + length - 1
            var col = c + 1
            while col <= maxCol {
                guard rowsPreffix[r + length][col] - rowsPreffix[r][col]  == up else { return false }
                col += 1
            }
            var pie = 0
            var na = 0
            var r1 = r
            var c1 = c
            var c2 = c + length - 1
            for _ in 0..<length {
                pie += grid[r1][c1]
                na += grid[r1][c2]
                r1 += 1
                c1 += 1
                c2 -= 1
            }
            guard pie == up && na == up else { return false }
            return true
        }
        
        func getMaxLengthOf(r : Int, _ c: Int) -> Int?{
            let maxLength = min(m - r, n - c)
            var l = maxLength
            while l > ans {
                if check(r, c, l) { return l }
                l -= 1
            }
            return nil
        }

        for r in 0..<m {
            var newRow = [0]
            for c in 0..<n {
                rowsPreffix[r + 1][c] = grid[r][c] + rowsPreffix[r][c]
                newRow.append(newRow.last! + grid[r][c])
            }
            colsPreffix.append(newRow)
        }

        for r in 0..<m {
            for c in 0..<n {
                if let l = getMaxLengthOf(r: r, c) { ans = max(ans, l) }
            }
        }
        return ans
    }
}