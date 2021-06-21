class Solution {

    // 861. Score After Flipping Matrix
    // We have a two dimensional matrix grid where each value is 0 or 1.
    // A move consists of choosing any row or column, and toggling each value in that row or column: changing all 0s to 1s, and all 1s to 0s.
    // After making any number of moves, every row of this matrix is interpreted as a binary number, and the score of the matrix is the sum of these numbers.
    // Return the highest possible score.

    // Example 1:
    // Input: grid = [[0,0,1,1],[1,0,1,0],[1,1,0,0]]
    // Output: 39
    // Explanation:
    // Toggled to [[1,1,1,1],[1,0,0,1],[1,1,1,1]].
    // 0b1111 + 0b1001 + 0b1111 = 15 + 9 + 15 = 39

    // Note:
    // 1 <= grid.length <= 20
    // 1 <= grid[0].length <= 20
    // grid[i][j] is 0 or 1.

    func matrixScore(_ A: [[Int]]) -> Int {
        guard !A.isEmpty else { return 0 }
        let row = A.count
        let column = A[0].count
        var A = A
        var ans = 0
        
        for i in 0..<A.count {
            if A[i][0] == 1 { continue } 
            else { for j in 0..<A[i].count { A[i][j] = abs(A[i][j] - 1) } }
        }
        
        for i in 1..<column {
            let sum = A.reduce(0) { (res, arr) -> Int in res + arr[i] }
            if sum * 2 < row { for j in 0..<row { A[j][i] = abs(A[j][i] - 1) } }
        }
        
        for arr in A { ans += b2d(arr) }
        return ans
    }
    
    
    func b2d(_ arr: [Int]) -> Int {
        var ans = 0
        for i in 0..<arr.count { ans += (arr[i] << (arr.count - i - 1)) }
        return ans
    }
    
}