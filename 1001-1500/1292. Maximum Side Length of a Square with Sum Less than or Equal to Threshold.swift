class Solution {

    // Solution by Sergey Leschev

    // 1292. Maximum Side Length of a Square with Sum Less than or Equal to Threshold
    // Given a m x n matrix mat and an integer threshold. Return the maximum side-length of a square with a sum less than or equal to threshold or return 0 if there is no such square.

    // Example 1:
    // Input: mat = [[1,1,3,2,4,3,2],[1,1,3,2,4,3,2],[1,1,3,2,4,3,2]], threshold = 4
    // Output: 2
    // Explanation: The maximum side length of square with sum less than 4 is 2 as shown.

    // Example 2:
    // Input: mat = [[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2],[2,2,2,2,2]], threshold = 1
    // Output: 0

    // Example 3:
    // Input: mat = [[1,1,1,1],[1,0,0,0],[1,0,0,0],[1,0,0,0]], threshold = 6
    // Output: 3

    // Example 4:
    // Input: mat = [[18,70],[61,1],[25,85],[14,40],[11,96],[97,96],[63,45]], threshold = 40184
    // Output: 2

    // Constraints:
    // 1 <= m, n <= 300
    // m == mat.length
    // n == mat[i].length
    // 0 <= mat[i][j] <= 10000
    // 0 <= threshold <= 10^5

    func maxSideLength(_ mat: [[Int]], _ threshold: Int) -> Int {
        var curr = mat
        if !test(curr, 1, threshold) { return 0 }
        var l = 1

        while next(&curr, l + 1, mat), test(curr, l + 1, threshold) { l = l + 1 }
        return l
    }
    

    func next(_ mat: inout [[Int]], _ l: Int, _ omat: [[Int]]) -> Bool {
        let rCount = mat.count
        let cCount = mat[0].count
        guard l <= rCount, l <= cCount else { return false }
        var hasNext = false
        
        for r in 0...(rCount - l) {
            for c in 0...(cCount - l) {
                let lastCol = (c + l) - 1
                let lastRow = (r + l) - 1
                var colSum = 0
                var rowSum = 0

                for rp in r...lastRow { colSum += omat[rp][lastCol] }
                for cp in c..<lastCol {  rowSum += omat[lastRow][cp] }
                mat[r][c] = mat[r][c] + colSum + rowSum
                hasNext = true
            }
        }
        
        return hasNext
    }
    

    func test(_ mat: [[Int]], _ l: Int, _ threshold: Int) -> Bool {
        let rCount = mat.count
        let cCount = mat[0].count
        
        for r in 0...(rCount - l) {
            for c in 0...(cCount - l) where mat[r][c] <= threshold { return true }
        }
        
        return false
    }

}