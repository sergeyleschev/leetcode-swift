class Solution {

    // Solution by Sergey Leschev

    // 419. Battleships in a Board
    // Given an m x n matrix board where each cell is a battleship 'X' or empty '.', return the number of the battleships on board.
    // Battleships can only be placed horizontally or vertically on board. In other words, they can only be made of the shape 1 x k (1 row, k columns) or k x 1 (k rows, 1 column), where k can be of any size. At least one horizontal or vertical cell separates between two battleships (i.e., there are no adjacent battleships).

    // Example 1:
    // Input: board = [["X",".",".","X"],[".",".",".","X"],[".",".",".","X"]]
    // Output: 2

    // Example 2:
    // Input: board = [["."]]
    // Output: 0

    // Constraints:
    // m == board.length
    // n == board[i].length
    // 1 <= m, n <= 200
    // board[i][j] is either '.' or 'X'.

    func countBattleships(_ board: [[Character]]) -> Int {
        var count = 0
        
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                if board[i][j] == "X" {
                    if i != 0 {
                        if board[i - 1][j] == "X" { continue }
                    }
                    if j != 0 {
                        if board[i][j - 1] == "X" { continue }
                    }
                    count += 1
                }
            }
        }
        
        return count
    }

}