class Solution {

    // Solution @ Sergey Leschev

    // 764. Largest Plus Sign
    // You are given an integer n. You have an n x n binary grid grid with all values initially 1's except for some indices given in the array mines. The ith element of the array mines is defined as mines[i] = [xi, yi] where grid[xi][yi] == 0.
    // Return the order of the largest axis-aligned plus sign of 1's contained in grid. If there is none, return 0.
    // An axis-aligned plus sign of 1's of order k has some center grid[r][c] == 1 along with four arms of length k - 1 going up, down, left, and right, and made of 1's. Note that there could be 0's or 1's beyond the arms of the plus sign, only the relevant area of the plus sign is checked for 1's.

    // Example 1:
    // Input: n = 5, mines = [[4,2]]
    // Output: 2
    // Explanation: In the above grid, the largest plus sign can only be of order 2. One of them is shown.

    // Example 2:
    // Input: n = 1, mines = [[0,0]]
    // Output: 0
    // Explanation: There is no plus sign, so return 0.

    // Constraints:
    // 1 <= n <= 500
    // 1 <= mines.length <= 5000
    // 0 <= xi, yi < n
    // All the pairs (xi, yi) are unique.

    typealias Position = (x: Int, y: Int)
    

    func orderOfLargestPlusSign(_ N: Int, _ mines: [[Int]]) -> Int {
        guard N * N != mines.count else { return 0 }
        var grid = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: N), count: N)
        for p in mines { grid[p[0]][p[1]] = true }
        var maxPlusSignArmLength = 1
        

        func valid(plusSignCenter p: Position,armLength: Int) -> Bool {
            for delta in 0..<armLength {
                if grid[p.x + delta][p.y] || grid[p.x - delta][p.y] || grid[p.x ][p.y + delta] || grid[p.x ][p.y - delta] { return  false }
            }
            return true
        }
        

        func getMaxArmLength(plusSignCenter p: Position) -> Int? {
            let currentMaxLength = min(p.x + 1, N - p.x, p.y + 1, N - p.y)
            guard currentMaxLength > maxPlusSignArmLength else {
                return nil
            }
            guard valid(plusSignCenter: p, armLength: maxPlusSignArmLength + 1) else {
                return nil
            }
            var armLength = maxPlusSignArmLength + 2
            while armLength <= currentMaxLength {
                let delta = armLength - 1
                if grid[p.x + delta][p.y] || grid[p.x - delta][p.y] || grid[p.x ][p.y + delta] || grid[p.x ][p.y - delta]  {
                    break
                }
                armLength += 1
            }
            return armLength - 1
        }
        

        for i in 0..<N {
            for j in 0..<N {
                if i != 0 && i != N - 1 && j != 0 && j != N - 1 && !grid[i][j] {
                    if let armLength = getMaxArmLength(plusSignCenter: Solution.Position(i,j))  {
                        maxPlusSignArmLength = armLength
                    }
                }
            }
        }
        
        return maxPlusSignArmLength
    }

 }