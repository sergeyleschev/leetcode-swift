class Solution {

    // Solution by Sergey Leschev

    // 1878. Get Biggest Three Rhombus Sums in a Grid
    // You are given an m x n integer matrix grid.
    // A rhombus sum is the sum of the elements that form the border of a regular rhombus shape in grid. The rhombus must have the shape of a square rotated 45 degrees with each of the corners centered in a grid cell. Below is an image of four valid rhombus shapes with the corresponding colored cells that should be included in each rhombus sum:
    // Note that the rhombus can have an area of 0, which is depicted by the purple rhombus in the bottom right corner.

    // Return the biggest three distinct rhombus sums in the grid in descending order. If there are less than three distinct values, return all of them.

    // Example 1:
    // Input: grid = [[3,4,5,1,3],[3,3,4,2,3],[20,30,200,40,10],[1,5,5,4,1],[4,3,2,2,5]]
    // Output: [228,216,211]
    // Explanation: The rhombus shapes for the three biggest distinct rhombus sums are depicted above.
    // - Blue: 20 + 3 + 200 + 5 = 228
    // - Red: 200 + 2 + 10 + 4 = 216
    // - Green: 5 + 200 + 4 + 2 = 211

    // Example 2:
    // Input: grid = [[1,2,3],[4,5,6],[7,8,9]]
    // Output: [20,9,8]
    // Explanation: The rhombus shapes for the three biggest distinct rhombus sums are depicted above.
    // - Blue: 4 + 2 + 6 + 8 = 20
    // - Red: 9 (area 0 rhombus in the bottom right corner)
    // - Green: 8 (area 0 rhombus in the bottom middle)

    // Example 3:
    // Input: grid = [[7,7,7]]
    // Output: [7]
    // Explanation: All three possible rhombus sums are the same, so return [7].

    // Constraints:
    // m == grid.length
    // n == grid[i].length
    // 1 <= m, n <= 50
    // 1 <= grid[i][j] <= 10^5

    func getBiggestThree(_ grid: [[Int]]) -> [Int] {
        var ans = Set<Int>()
        let m = grid.count
        let n = grid[0].count


        func updateAns(_ sum: Int) {
            guard ans.count >= 3 else { ans.insert(sum); return }
            guard !ans.contains(sum) else { return }
            let minEle = ans.min()!
            guard sum > minEle else { return }
            ans.insert(sum)
            ans.remove(minEle)
        }

        func getSum(_ r: Int, _ c: Int,_ length: Int) -> Int? {
            guard r + 2 * length - 2 < m else { return nil }
            var sum = 0
            let maxRow =  r + 2 * length - 2
            for delta in 0..<length { sum += grid[r + delta][c - delta] + grid[r + delta][c + delta] + grid[maxRow - delta][c + delta] + grid[maxRow - delta][c - delta] }
            sum -= (grid[r][c] + grid[maxRow][c] + grid[r + length - 1][c - length + 1] + grid[r + length - 1][c + length - 1])
            return sum
        }

        func update(_ r: Int, _ c: Int) {
            let maxLength = min(c + 1, n - c)
            updateAns(grid[r][c])
            var length = 2
            while length <= maxLength {
                if let s = getSum(r, c, length) { updateAns(s) }
                length += 1
            }
            
        }

        for r in 0..<grid.count {
            for c in 0..<grid[0].count { update(r, c) }
        }
        return ans.sorted { $0 > $1 }
    }

}