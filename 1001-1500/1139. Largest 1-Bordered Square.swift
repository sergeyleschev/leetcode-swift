class Solution {

    // Solution @ Sergey Leschev

    // 1139. Largest 1-Bordered Square
    // Given a 2D grid of 0s and 1s, return the number of elements in the largest square subgrid that has all 1s on its border, or 0 if such a subgrid doesn't exist in the grid.

    // Example 1:
    // Input: grid = [[1,1,1],[1,0,1],[1,1,1]]
    // Output: 9

    // Example 2:
    // Input: grid = [[1,1,0,0]]
    // Output: 1

    // Constraints:
    // 1 <= grid.length <= 100
    // 1 <= grid[0].length <= 100
    // grid[i][j] is 0 or 1

    func largest1BorderedSquare(_ grid: [[Int]]) -> Int {
        var length = min(grid.count, grid[0].count)

        while length > 0 {
            for i in 0 ... grid.count - length {
                for j in 0 ... grid[0].count - length {
                    var det = true
                    for k in 0 ..< length {
                        if grid[i + k][j] == 0 || grid[i][j + k] == 0 || grid[i + length - 1][j + k] == 0 || grid[i + k][j + length - 1] == 0 {
                            det = false
                            break
                        }
                    }
                    if det { return length * length }
                }
            }
            
            length -= 1
        }

        return 0
    }

}