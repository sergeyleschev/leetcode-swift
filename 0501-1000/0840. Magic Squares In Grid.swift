class Solution {

    // Solution by Sergey Leschev

    // 840. Magic Squares In Grid
    // A 3 x 3 magic square is a 3 x 3 grid filled with distinct numbers from 1 to 9 such that each row, column, and both diagonals all have the same sum.
    // Given a row x col grid of integers, how many 3 x 3 "magic square" subgrids are there?  (Each subgrid is contiguous).

    // Example 1:
    // Input: grid = [[4,3,8,4],[9,5,1,9],[2,7,6,2]]
    // Output: 1
    // Explanation: 
    // The following subgrid is a 3 x 3 magic square:
    // while this one is not:
    // In total, there is only one magic square inside the given grid.

    // Example 2:
    // Input: grid = [[8]]
    // Output: 0

    // Example 3:
    // Input: grid = [[4,4],[3,3]]
    // Output: 0

    // Example 4:
    // Input: grid = [[4,7,8],[9,5,1],[2,3,6]]
    // Output: 0

    // Constraints:
    // row == grid.length
    // col == grid[i].length
    // 1 <= row, col <= 10
    // 0 <= grid[i][j] <= 15

    func numMagicSquaresInside(_ grid: [[Int]]) -> Int {
        var count = 0
        let len = 3
        let iLen = grid.count
        let jLen = grid[0].count

        if iLen < len || jLen < len { return 0 }
        
        for i in 0 ... iLen - len {
            for j in 0 ... jLen - len {
                var rowSum = 0, columnSum = 0, slashSum1 = 0, slashSum2 = 0
                let targetSet: Set = [1, 2, 3, 4, 5, 6, 7, 8, 9]
                var currentSet = Set<Int>()
                var equal = false
                
                for k in 0 ..< len {
                    slashSum1 += grid[i + k][j + k]
                    slashSum2 += grid[i + len - k - 1][j + k]
                }

                if slashSum1 != slashSum2 { continue }
                
                for row in 0 ..< len {
                    var newRowSum = 0, newColumnSum = 0
                    for column in 0 ..< len {
                        let num = grid[i + row][j + column]
                        if num < 1 || num > 9 { continue }
                        currentSet.insert(num)
                        
                        newRowSum += grid[i + row][j + column]
                        newColumnSum += grid[i + column][j + row]
                    }
                    
                    if row == 0 {
                        rowSum = newRowSum
                        columnSum = newColumnSum
                    }
                    
                    if rowSum == newRowSum  &&
                        columnSum == newColumnSum &&
                        rowSum == columnSum {
                        equal = true
                    } else {
                        equal = false
                        break
                    }
                }
                
                if equal && currentSet == targetSet { count += 1 }
            }
        }
        
        return count
    }

}