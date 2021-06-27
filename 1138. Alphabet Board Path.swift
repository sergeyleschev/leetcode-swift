class Solution {

    // 1138. Alphabet Board Path
    // On an alphabet board, we start at position (0, 0), corresponding to character board[0][0].
    // Here, board = ["abcde", "fghij", "klmno", "pqrst", "uvwxy", "z"], as shown in the diagram below.
    // We may make the following moves:
    // 'U' moves our position up one row, if the position exists on the board;
    // 'D' moves our position down one row, if the position exists on the board;
    // 'L' moves our position left one column, if the position exists on the board;
    // 'R' moves our position right one column, if the position exists on the board;
    // '!' adds the character board[r][c] at our current position (r, c) to the answer.
    // (Here, the only positions that exist on the board are positions with letters on them.)
    // Return a sequence of moves that makes our answer equal to target in the minimum number of moves.  You may return any path that does so.

    // Example 1:
    // Input: target = "leet"
    // Output: "DDR!UURRR!!DDD!"

    // Example 2:
    // Input: target = "code"
    // Output: "RR!DDRR!UUL!R!"

    // Constraints:
    // 1 <= target.length <= 100
    // target consists only of English lowercase letters.

    func alphabetBoardPath(_ target: String) -> String {
        let boardArray = ["abcde", "fghij", "klmno", "pqrst", "uvwxy", "z"].map { Array($0).map { String($0) } }
        let targetArray = Array(target).map { String($0) }
        var currentTargetIndex = 0
        var queue = [(Int, Int, String)]()
        var visitedSet = Set<String>()
        var result = ""
        
        queue.append((0, 0, ""))
        visitedSet.insert(boardArray[0][0])
        
        while queue.isEmpty == false {
            var (row, col, path) = queue.removeFirst()
            
            if boardArray[row][col] == targetArray[currentTargetIndex] {
                path += "!"
                currentTargetIndex += 1
                visitedSet.removeAll()
                queue.removeAll()
                visitedSet.insert(boardArray[row][col])
                queue.append((row, col, path))
                
                if currentTargetIndex >= targetArray.count {
                    result = path
                    break
                } else { continue }
            }
            
            for neighbor in [ (-1,0,"U"), (0,1,"R"), (1,0,"D"), (0,-1,"L") ] {
                let (newRow, newCol, direction) = (row + neighbor.0, col + neighbor.1, neighbor.2)
                if newRow < boardArray.count &&
                    newRow >= 0 &&
                    newCol < boardArray[newRow].count &&
                    newCol >= 0 &&
                    !visitedSet.contains(boardArray[newRow][newCol]) {
                        
                        visitedSet.insert(boardArray[newRow][newCol])
                        queue.append((newRow, newCol, path + direction))
                }
            }
        }

        return result
    }
    
}