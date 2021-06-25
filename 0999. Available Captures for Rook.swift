class Solution {

    // 999. Available Captures for Rook
    // On an 8 x 8 chessboard, there is exactly one white rook 'R' and some number of white bishops 'B', black pawns 'p', and empty squares '.'.
    // When the rook moves, it chooses one of four cardinal directions (north, east, south, or west), then moves in that direction until it chooses to stop, reaches the edge of the board, captures a black pawn, or is blocked by a white bishop. A rook is considered attacking a pawn if the rook can capture the pawn on the rook's turn. The number of available captures for the white rook is the number of pawns that the rook is attacking.
    // Return the number of available captures for the white rook.

    // Example 1:
    // Input: board = [[".",".",".",".",".",".",".","."],[".",".",".","p",".",".",".","."],[".",".",".","R",".",".",".","p"],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."],[".",".",".","p",".",".",".","."],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."]]
    // Output: 3
    // Explanation: In this example, the rook is attacking all the pawns.

    // Example 2:
    // Input: board = [[".",".",".",".",".",".",".","."],[".","p","p","p","p","p",".","."],[".","p","p","B","p","p",".","."],[".","p","B","R","B","p",".","."],[".","p","p","B","p","p",".","."],[".","p","p","p","p","p",".","."],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."]]
    // Output: 0
    // Explanation: The bishops are blocking the rook from attacking any of the pawns.

    // Example 3:
    // Input: board = [[".",".",".",".",".",".",".","."],[".",".",".","p",".",".",".","."],[".",".",".","p",".",".",".","."],["p","p",".","R",".","p","B","."],[".",".",".",".",".",".",".","."],[".",".",".","B",".",".",".","."],[".",".",".","p",".",".",".","."],[".",".",".",".",".",".",".","."]]
    // Output: 3
    // Explanation: The rook is attacking the pawns at positions b5, d6, and f5.

    // Constraints:
    // board.length == 8
    // board[i].length == 8
    // board[i][j] is either 'R', '.', 'B', or 'p'
    // There is exactly one cell with board[i][j] == 'R'

    func numRookCaptures(_ board: [[Character]]) -> Int {
        if board.count == 0 { return 0 }
        let row = board.count
        let col = board[0].count
        var r = 0
        var c = 0
        var res = 0
        
        for i in 0..<row {
            for j in 0..<col {
                if board[i][j] == "R" {
                    r = i
                    c = j
                }
            }
        }
        var top = r - 1
        var bottom = r + 1
        var left = c - 1
        var right = c + 1

        while top >= 0 {
            let v = board[top][c]
            if v == "B" { break }
            if v == "p" { res += 1; break }
            top -= 1
        }
        while bottom < row {
            let v = board[bottom][c]
            if v == "B" { break }
            if v == "p" { res += 1; break }
            bottom += 1
        }
        while left >= 0 {
            let v = board[r][left]
            if v == "B" { break }
            if v == "p" { res += 1; break }
            left -= 1
        }
        while right < col {
            let v = board[r][right]
            if v == "B" { break }
            if v == "p" { res += 1; break }
            right += 1
        }
        return res
    }
    
}