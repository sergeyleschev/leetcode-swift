class Solution {

    // Solution @ Sergey Leschev

    // 773. Sliding Puzzle
    // On a 2x3 board, there are 5 tiles represented by the integers 1 through 5, and an empty square represented by 0.
    // A move consists of choosing 0 and a 4-directionally adjacent number and swapping it.
    // The state of the board is solved if and only if the board is [[1,2,3],[4,5,0]].
    // Given a puzzle board, return the least number of moves required so that the state of the board is solved. If it is impossible for the state of the board to be solved, return -1.

    // Examples:
    // Input: board = [[1,2,3],[4,0,5]]
    // Output: 1
    // Explanation: Swap the 0 and the 5 in one move.
    // Input: board = [[1,2,3],[5,4,0]]
    // Output: -1
    // Explanation: No number of moves will make the board solved.
    // Input: board = [[4,1,2],[5,0,3]]
    // Output: 5
    // Explanation: 5 is the smallest number of moves that solves the board.
    // An example path:
    // After move 0: [[4,1,2],[5,0,3]]
    // After move 1: [[4,1,2],[0,5,3]]
    // After move 2: [[0,1,2],[4,5,3]]
    // After move 3: [[1,0,2],[4,5,3]]
    // After move 4: [[1,2,0],[4,5,3]]
    // After move 5: [[1,2,3],[4,5,0]]
    // Input: board = [[3,2,4],[1,5,0]]
    // Output: 14
    // Note:
    // board will be a 2 x 3 array as described above.
    // board[i][j] will be a permutation of [0, 1, 2, 3, 4, 5].

    func slidingPuzzle(_ board: [[Int]]) -> Int {
        let answer = [1,2,3,4,5,0]
        var firstGuess = [Int](board[0])
        firstGuess.append(contentsOf: board[1])
        guard firstGuess != answer else { return 0  }
        var visited = Set<[Int]>()
        visited.insert(firstGuess)
        var potentialAnswers = [firstGuess]
        var depth = 0
        
        while !potentialAnswers.isEmpty {
            let count = potentialAnswers.count
            depth += 1
            for _ in 0..<count {
                let guess = potentialAnswers.removeFirst()
                let nextLevelGuesses = createNextLevelArrarys(guess)
                for nextLevelGuess in nextLevelGuesses {
                    if nextLevelGuess == answer {
                        return depth
                    }
                    if !visited.contains(nextLevelGuess) {
                        visited.insert(nextLevelGuess)
                        potentialAnswers.append(nextLevelGuess)
                    }
                }
            }
        }
        return -1
    }


    private func createNextLevelArrarys(_ arr: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        let zeroIndex = arr.firstIndex(of: 0)!
        //up or down
        var temp = arr

        temp.swapAt(zeroIndex, zeroIndex - 3 >= 0 ? zeroIndex - 3 : zeroIndex + 3)
        ans.append(temp)
        
        //left
        if zeroIndex != 0 && zeroIndex != 3 {
            temp = arr
            temp.swapAt(zeroIndex, zeroIndex - 1)
            ans.append(temp)
        }
        
        //right
        if zeroIndex != 2  && zeroIndex != 5 {
            temp = arr
            temp.swapAt(zeroIndex, zeroIndex + 1)
            ans.append(temp)
        }
        
        return ans
    }

}