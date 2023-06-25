class Solution {

    // Solution @ Sergey Leschev

    // 289. Game of Life
    // According to Wikipedia's article: "The Game of Life, also known simply as Life, is a cellular automaton devised by the British mathematician John Horton Conway in 1970."
    // The board is made up of an m x n grid of cells, where each cell has an initial state: live (represented by a 1) or dead (represented by a 0). Each cell interacts with its eight neighbors (horizontal, vertical, diagonal) using the following four rules (taken from the above Wikipedia article):
    // Any live cell with fewer than two live neighbors dies as if caused by under-population.
    // Any live cell with two or three live neighbors lives on to the next generation.
    // Any live cell with more than three live neighbors dies, as if by over-population.
    // Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.
    // The next state is created by applying the above rules simultaneously to every cell in the current state, where births and deaths occur simultaneously. Given the current state of the m x n grid board, return the next state.

    // Finds the next state.
    // - Parameter board: The board.

    // Example 1:
    // Input: board = [[0,1,0],[0,0,1],[1,1,1],[0,0,0]]
    // Output: [[0,0,0],[1,0,1],[0,1,1],[0,1,0]]

    // Example 2:
    // Input: board = [[1,1],[1,0]]
    // Output: [[1,1],[1,1]]
     
    // Constraints:
    // m == board.length
    // n == board[i].length
    // 1 <= m, n <= 25
    // board[i][j] is 0 or 1.

    // Follow up:
    // Could you solve it in-place? Remember that the board needs to be updated simultaneously: You cannot update some cells first and then use their updated values to update other cells.
    // In this question, we represent the board using a 2D array. In principle, the board is infinite, which would cause problems when the active area encroaches upon the border of the array (i.e., live cells reach the border). How would you address these problems?

    // - Complexity:
    //   - time: O(m * n), where m is the number of rows of the `board`, and the n is the number of columns of the `board`.
    //   - space: O(1), only constant space is used.

    func gameOfLife(_ board: inout [[Int]]) {
        let neighbors = [0, 1, -1]
        let rows = board.count
        let cols = board[0].count
        
        for row in 0..<rows {
            for col in 0..<cols {
                var liveNeighbors = 0
                
                for i in 0..<3 {
                    for j in 0..<3 {
                        guard !(neighbors[i] == 0 && neighbors[j] == 0) else { continue }
                        let r = row + neighbors[i]
                        let c = col + neighbors[j]
                        
                        guard r < rows, r >= 0, c < cols, c >= 0, abs(board[r][c]) == 1 else { continue }
                        liveNeighbors += 1
                    }
                }
                
                if board[row][col] == 1, (liveNeighbors < 2 || liveNeighbors > 3) {
                    board[row][col] = -1
                }
                
                if board[row][col] == 0, liveNeighbors == 3 {
                    board[row][col] = 2
                }
            }
        }
        
        for row in 0..<rows {
            for col in 0..<cols {
                board[row][col] = board[row][col] > 0 ? 1 : 0
            }
        }
    }

}