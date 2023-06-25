class Solution {

    // Solution @ Sergey Leschev

    // 794. Valid Tic-Tac-Toe State
    // Given a Tic-Tac-Toe board as a string array board, return true if and only if it is possible to reach this board position during the course of a valid tic-tac-toe game.
    // The board is a 3 x 3 array that consists of characters ' ', 'X', and 'O'. The ' ' character represents an empty square.
    // Here are the rules of Tic-Tac-Toe:
    // Players take turns placing characters into empty squares ' '.
    // The first player always places 'X' characters, while the second player always places 'O' characters.
    // 'X' and 'O' characters are always placed into empty squares, never filled ones.
    // The game ends when there are three of the same (non-empty) character filling any row, column, or diagonal.
    // The game also ends if all squares are non-empty.
    // No more moves can be played if the game is over.

    // Example 1:
    // Input: board = ["O  ","   ","   "]
    // Output: false
    // Explanation: The first player always plays "X".

    // Example 2:
    // Input: board = ["XOX"," X ","   "]
    // Output: false
    // Explanation: Players take turns making moves.

    // Example 3:
    // Input: board = ["XXX","   ","OOO"]
    // Output: false

    // Example 4:
    // Input: board = ["XOX","O O","XOX"]
    // Output: true

    // Constraints:
    // board.length == 3
    // board[i].length == 3
    // board[i][j] is either 'X', 'O', or ' '.

    var gameBoard: [[String]] = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
    var numberOfX: Int = 0
    var numberOfO: Int = 0


    func validTicTacToe(_ board: [String]) -> Bool {
        initGameBoard(board)

        // X goes first
        if numberOfO > numberOfX { return false }
        // Players take turns placing characters
        if numberOfX - numberOfO > 1 { return false }
        // Both Players can't win
        if didPlayerWins(with: "X") && didPlayerWins(with: "O") { return false }
        // X wins only, but wrong O numbers
        if didPlayerWins(with: "X") && numberOfX == numberOfO { return false }
        // O wins only, but wrong X numbers
        if didPlayerWins(with: "O") && numberOfX > numberOfO { return false }

        return true
    }


    func initGameBoard(_ board: [String]) {
        gameBoard.reserveCapacity(3)
        
        for i in 0...2 {
            for j in 0...2 {
                let char: String = String(Array(board[i])[j])
                gameBoard[i][j] = char
                if char == "X" { numberOfX += 1 }
                if char == "O" { numberOfO += 1 }
            }
        }
    }


    func didPlayerWins(with char: String) -> Bool {
        func didRowHasSame(_ char: String) -> Bool {
            for i in 0...2 where gameBoard[i][0] == char && gameBoard[i][1] == char && gameBoard[i][2] == char { return true }
            return false
        }

        func didColumnHasSame(_ char: String) -> Bool {
            for i in 0...2 where gameBoard[0][i] == char && gameBoard[1][i] == char && gameBoard[2][i] == char { return true }
            return false
        }

        func didDiagnolHasSame(_ char: String) -> Bool {
            if gameBoard[0][0] == char && gameBoard[1][1] == char && gameBoard[2][2] == char { return true }
            if gameBoard[0][2] == char && gameBoard[1][1] == char && gameBoard[2][0] == char { return true }
            return false
        }

        if didRowHasSame(char) { return true }
        if didColumnHasSame(char) { return true }
        if didDiagnolHasSame(char) { return true }

        return false
    }

}