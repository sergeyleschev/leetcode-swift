class Solution {

    // Solution by Sergey Leschev

    // 37. Sudoku Solver
    // Write a program to solve a Sudoku puzzle by filling the empty cells.

    // A sudoku solution must satisfy all of the following rules:

    // Each of the digits 1-9 must occur exactly once in each row.
    // Each of the digits 1-9 must occur exactly once in each column.
    // Each of the digits 1-9 must occur exactly once in each of the 9 3x3 sub-boxes of the grid.
    // The '.' character indicates empty cells.

    // Example 1:
    // Input: board = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
    // Output: [["5","3","4","6","7","8","9","1","2"],["6","7","2","1","9","5","3","4","8"],["1","9","8","3","4","2","5","6","7"],["8","5","9","7","6","1","4","2","3"],["4","2","6","8","5","3","7","9","1"],["7","1","3","9","2","4","8","5","6"],["9","6","1","5","3","7","2","8","4"],["2","8","7","4","1","9","6","3","5"],["3","4","5","2","8","6","1","7","9"]]
    // Explanation: The input board is shown above and the only valid solution is shown below:

    // Constraints:
    // board.length == 9
    // board[i].length == 9
    // board[i][j] is a digit or '.'.
    // It is guaranteed that the input board has only one solution.

    func solveSudoku(_ board: inout [[Character]]) {
        func backtrack(_ path: [Character], _ input: [[Character]], _ index: Int) {
            if path.count == 81 {
                if isValidSudoku(input) { board = input }
                return
            }
            let x = index / 9
            let y = index % 9
            let chars = available(input, x, y)
            var path = path
            var input = input
            let tmp = input[x][y]

            for c in chars {
                path.append(c)
                input[x][y] = c
                backtrack(path, input, index + 1)
                input[x][y] = tmp
                path.remove(at: path.count - 1)
            }
        }

        //  1.
        var loop = false
        repeat {
            var tmp = false
            for x in 0..<9 {
                for y in 0..<9 {
                    if board[x][y] != "." { continue }
                    tmp = tmp || fill(&board, x, y)
                }
            }
            loop = tmp
        } while loop

        //  2.
        backtrack([], board, 0)
    }

    func fill(_ board: inout [[Character]], _ x: Int, _ y: Int) -> Bool {
        let chars = available(board, x, y)
        if chars.count == 1 {
            board[x][y] = chars[0]
            return true
        } else {
            return false
        }
    }

    func available(_ board: [[Character]], _ x: Int, _ y: Int) -> [Character] {
        if board[x][y] != "." { return [board[x][y]] }

        // [[0, 1, 2],
        //  [3, 4, 5],
        //  [6, 7, 8],]
        let j = (x / 3) * 3 + (y / 3)
        var res: [Character] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        var c: Character

        for i in 0..<9 {
            c = board[x][i]
            if let index = res.firstIndex(of: c) { res.remove(at: index) }

            c = board[i][y]
            if let index = res.firstIndex(of: c) { res.remove(at: index) }

            let x = (j / 3) * 3 + i / 3
            let y = (j % 3) * 3 + i % 3

            c = board[x][y]
            if let index = res.firstIndex(of: c) { res.remove(at: index) }
        }

        return res
    }

    func isValidSudoku(_ board: [[Character]]) -> Bool {
        func isInvalid(_ box: [Character]) -> Bool {
            var chars: [Character] = []
            for c in box where c != "." {
                if chars.contains(c) { return true } else { chars.append(c) }
            }
            return false
        }

        for i in 0..<9 {
            if isInvalid(board[i]) { return false }
            if isInvalid(board.map({ $0[i] })) { return false }
            let col = (i % 3) * 3
            let row = (i / 3) * 3
            let box =
                Array(board[row][col..<col + 3]) + Array(board[row + 1][col..<col + 3])
                + Array(board[row + 2][col..<col + 3])
            if isInvalid(box) { return false }
        }
        return true
    }

}
