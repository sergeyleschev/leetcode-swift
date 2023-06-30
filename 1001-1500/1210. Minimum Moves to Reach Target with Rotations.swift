class Solution {

    // Solution by Sergey Leschev

    // 1210. Minimum Moves to Reach Target with Rotations
    // In an n*n grid, there is a snake that spans 2 cells and starts moving from the top left corner at (0, 0) and (0, 1). The grid has empty cells represented by zeros and blocked cells represented by ones. The snake wants to reach the lower right corner at (n-1, n-2) and (n-1, n-1).
    // In one move the snake can:
    // Move one cell to the right if there are no blocked cells there. This move keeps the horizontal/vertical position of the snake as it is.
    // Move down one cell if there are no blocked cells there. This move keeps the horizontal/vertical position of the snake as it is.
    // Rotate clockwise if it's in a horizontal position and the two cells under it are both empty. In that case the snake moves from (r, c) and (r, c+1) to (r, c) and (r+1, c).
    // Rotate counterclockwise if it's in a vertical position and the two cells to its right are both empty. In that case the snake moves from (r, c) and (r+1, c) to (r, c) and (r, c+1).
    // Return the minimum number of moves to reach the target.
    // If there is no way to reach the target, return -1.

    // Example 1:
    // Input: grid = [[0,0,0,0,0,1],
    //                [1,1,0,0,1,0],
    //                [0,0,0,0,1,1],
    //                [0,0,1,0,1,0],
    //                [0,1,1,0,0,0],
    //                [0,1,1,0,0,0]]
    // Output: 11
    // Explanation:
    // One possible solution is [right, right, rotate clockwise, right, down, down, down, down, rotate counterclockwise, right, down].

    // Example 2:
    // Input: grid = [[0,0,1,1,1,1],
    //                [0,0,0,0,1,1],
    //                [1,1,0,0,0,1],
    //                [1,1,1,0,0,1],
    //                [1,1,1,0,0,1],
    //                [1,1,1,0,0,0]]
    // Output: 9

    // Constraints:
    // 2 <= n <= 100
    // 0 <= grid[i][j] <= 1
    // It is guaranteed that the snake starts at empty cells.
    
    struct Position: Hashable {
        var x: Int
        var y: Int
        
        init(_ x: Int, _ y: Int) {
            self.x = x
            self.y = y
        }
    }


    enum Posture { case horizontal, vertical }
    

    struct Snake: Hashable {
        var head: Position
        var tail: Position
    }

    
    typealias SnakeState = (snake: Snake, posture: Posture)

    private var grid = [[Int]]()
    private var length = -1


    func minimumMoves(_ grid: [[Int]]) -> Int {
        self.grid = grid
        self.length  = grid.count
        let endState: SnakeState = (Snake(head: Position(length - 1,length - 1), tail: Position(length - 1,length - 2)),.horizontal)
        var potentialStates = [SnakeState]()
        potentialStates.append((Snake(head: Position(0, 1), tail: Position(0, 0)),.horizontal))
        var visited = Set<Snake>()
        visited.insert(Snake(head: Position(0, 1), tail: Position(0, 0)))
        var  depth = 0

        while !potentialStates.isEmpty {
            depth += 1
            let length = potentialStates.count
            for _ in 0..<length {
                let s =  potentialStates.removeFirst()
                let nextLevelStates = createNextLevelSnakeStates(current: s)
                for nextLevelState in nextLevelStates {
                    if nextLevelState == endState {
                        return depth
                    }
                    if !visited.contains(nextLevelState.snake) {
                        visited.insert(nextLevelState.snake)
                        potentialStates.append(nextLevelState)
                    }
                }
            }
        }

        return -1
    }


    private func createNextLevelSnakeStates(current state: SnakeState) -> [SnakeState] {
        var ans = [SnakeState]()
        let head = state.snake.head
        let tail = state.snake.tail

        //right
        if state.posture == .horizontal && head.y < length - 1 && grid[head.x][head.y + 1] == 0 {
            var temp = state
            temp.snake.head.y += 1
            temp.snake.tail.y += 1
            ans.append(temp)
        }
        
        //down
        if state.posture == .vertical &&  head.x < length - 1 && grid[head.x + 1][head.y] == 0 {
            var temp = state
            temp.snake.head.x += 1
            temp.snake.tail.x += 1
            ans.append(temp)
        }
        
        if state.posture == .horizontal && head.x < length - 1 && grid[head.x + 1][head.y] == 0 &&  grid[tail.x + 1][tail.y] == 0 {
            //clockwise
            var temp = state
            temp.snake.head.x += 1
            temp.snake.head.y -= 1
            temp.posture = .vertical
            ans.append(temp)
            //down
            temp = state
            temp.snake.head.x += 1
            temp.snake.tail.x += 1
            ans.append(temp)
        }
        
        if state.posture == .vertical && head.y < length - 1 && grid[head.x][head.y  + 1] == 0 &&  grid[tail.x][tail.y + 1] == 0 {
            //counterclockwise
            var temp = state
            temp.snake.head.x -= 1
            temp.snake.head.y += 1
            temp.posture = .horizontal
            ans.append(temp)
            //right
            temp = state
            temp.snake.head.y += 1
            temp.snake.tail.y += 1
            ans.append(temp)
        }

        return ans
    }

}