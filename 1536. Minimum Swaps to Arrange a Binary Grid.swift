class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1536. Minimum Swaps to Arrange a Binary Grid
    // Given an n x n binary grid, in one step you can choose two adjacent rows of the grid and swap them.
    // A grid is said to be valid if all the cells above the main diagonal are zeros.

    // Return the minimum number of steps needed to make the grid valid, or -1 if the grid cannot be valid.

    // The main diagonal of a grid is the diagonal that starts at cell (1, 1) and ends at cell (n, n).

    // Example 1:
    // Input: grid = [[0,0,1],[1,1,0],[1,0,0]]
    // Output: 3

    // Example 2:
    // Input: grid = [[0,1,1,0],[0,1,1,0],[0,1,1,0],[0,1,1,0]]
    // Output: -1
    // Explanation: All rows are similar, swaps have no effect on the grid.

    // Example 3:
    // Input: grid = [[1,0,0],[1,1,0],[1,1,1]]
    // Output: 0

    // Constraints:
    // n == grid.length
    // n == grid[i].length
    // 1 <= n <= 200
    // grid[i][j] is 0 or 1

    // Solution 1:
    // Idea
    // - get right[i], grid[i]'s right zero count
    // - start from 0, find how many swaps required to make current ith row valid

    // - Complexity:
    //   - time: O(n^2)
    //   - space: O(n^2)

    func minSwaps(_ grid: [[Int]]) -> Int {
        let n = grid.count
        if n == 1 { return 0 }
        var right = Array(repeating: 0, count: n) // right[i] means grid[i]'s right zero count
        var swap = 0

        for i in 0..<n {
            var j = n - 1
            while j >= 0, grid[i][j] == 0 { j -= 1 }
            right[i] = n - j - 1
        }

        for i in 0..<n {
            if right[i] < n - i - 1 {
                var j = i
                while j < n, right[j] < n - i - 1 { j += 1 }
                if j == n { return -1 } // cannot find any number >= n - i - 1
                let val = right.remove(at: j) // swap right[j] with j - 1, j - 2, ... until i + 1
                right.insert(val, at: i)
                swap += j - i
            }
        }

        return swap
    }

}