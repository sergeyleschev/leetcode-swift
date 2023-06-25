class Solution {

    // Solution @ Sergey Leschev

    // 1001. Grid Illumination
    // There is a 2D grid of size n x n where each cell of this grid has a lamp that is initially turned off.
    // You are given a 2D array of lamp positions lamps, where lamps[i] = [rowi, coli] indicates that the lamp at grid[rowi][coli] is turned on. Even if the same lamp is listed more than once, it is turned on.
    // When a lamp is turned on, it illuminates its cell and all other cells in the same row, column, or diagonal.
    // You are also given another 2D array queries, where queries[j] = [rowj, colj]. For the jth query, determine whether grid[rowj][colj] is illuminated or not. After answering the jth query, turn off the lamp at grid[rowj][colj] and its 8 adjacent lamps if they exist. A lamp is adjacent if its cell shares either a side or corner with grid[rowj][colj].
    // Return an array of integers ans, where ans[j] should be 1 if the cell in the jth query was illuminated, or 0 if the lamp was not.

    // Example 1:
    // Input: n = 5, lamps = [[0,0],[4,4]], queries = [[1,1],[1,0]]
    // Output: [1,0]
    // Explanation: We have the initial grid with all lamps turned off. In the above picture we see the grid after turning on the lamp at grid[0][0] then turning on the lamp at grid[4][4].
    // The 0th query asks if the lamp at grid[1][1] is illuminated or not (the blue square). It is illuminated, so set ans[0] = 1. Then, we turn off all lamps in the red square.
    // The 1st query asks if the lamp at grid[1][0] is illuminated or not (the blue square). It is not illuminated, so set ans[1] = 0. Then, we turn off all lamps in the red rectangle.

    // Example 2:
    // Input: n = 5, lamps = [[0,0],[4,4]], queries = [[1,1],[1,1]]
    // Output: [1,1]

    // Example 3:
    // Input: n = 5, lamps = [[0,0],[0,4]], queries = [[0,4],[0,1],[1,4]]
    // Output: [1,1,0]

    // Constraints:
    // 1 <= n <= 10^9
    // 0 <= lamps.length <= 20000
    // 0 <= queries.length <= 20000
    // lamps[i].length == 2
    // 0 <= rowi, coli < n
    // queries[j].length == 2
    // 0 <= rowj, colj < n

    func gridIllumination(_ N: Int, _ lamps: [[Int]], _ queries: [[Int]]) -> [Int] {
        var rowMap = [Int: Int](), colMap = [Int: Int]()
        var diag1Map = [Int: Int](), diag2Map = [Int: Int]()
        var lamps = Set(lamps)
        var answers = [Int]()

        for lamp in lamps {
            let i = lamp[0], j = lamp[1]
            rowMap[i, default: 0] += 1
            colMap[j, default: 0] += 1
            diag1Map[i - j, default: 0] += 1
            diag2Map[i + j, default: 0] += 1
        }

        for query in queries {
            // get answer
            let i = query[0], j = query[1]
            if rowMap[i, default: 0] > 0 || colMap[j, default: 0] > 0 || diag1Map[i - j, default: 0] > 0 || diag2Map[i + j, default: 0] > 0 {
                answers.append(1)
            } else {
                answers.append(0)
            }

            // remove lamps
            for m in i - 1...i + 1 where m >= 0 && m < N {
                for n in j - 1...j + 1 where n >= 0 && n < N {
                    guard lamps.contains([m, n]) else { continue }
                    lamps.remove([m, n])
                    rowMap[m, default: 0] -= 1
                    colMap[n, default: 0] -= 1
                    diag1Map[m - n, default: 0] -= 1 // path \
                    diag2Map[m + n, default: 0] -= 1 // path /
                }
            }
        }
        
        return answers
    }

}