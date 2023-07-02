class Solution {

    // Solution by Sergey Leschev

    // 1263. Minimum Moves to Move a Box to Their Target Location
    // Storekeeper is a game in which the player pushes boxes around in a warehouse trying to get them to target locations.
    // The game is represented by a grid of size m x n, where each element is a wall, floor, or a box.
    // Your task is move the box 'B' to the target position 'T' under the following rules:
    // Player is represented by character 'S' and can move up, down, left, right in the grid if it is a floor (empy cell).
    // Floor is represented by character '.' that means free cell to walk.
    // Wall is represented by character '#' that means obstacle  (impossible to walk there).
    // There is only one box 'B' and one target cell 'T' in the grid.
    // The box can be moved to an adjacent free cell by standing next to the box and then moving in the direction of the box. This is a push.
    // The player cannot walk through the box.
    // Return the minimum number of pushes to move the box to the target. If there is no way to reach the target, return -1.

    // Example 1:
    // Input: grid = [["#","#","#","#","#","#"],
    //                ["#","T","#","#","#","#"],
    //                ["#",".",".","B",".","#"],
    //                ["#",".","#","#",".","#"],
    //                ["#",".",".",".","S","#"],
    //                ["#","#","#","#","#","#"]]
    // Output: 3
    // Explanation: We return only the number of times the box is pushed.

    // Example 2:
    // Input: grid = [["#","#","#","#","#","#"],
    //                ["#","T","#","#","#","#"],
    //                ["#",".",".","B",".","#"],
    //                ["#","#","#","#",".","#"],
    //                ["#",".",".",".","S","#"],
    //                ["#","#","#","#","#","#"]]
    // Output: -1

    // Example 3:
    // Input: grid = [["#","#","#","#","#","#"],
    //                ["#","T",".",".","#","#"],
    //                ["#",".","#","B",".","#"],
    //                ["#",".",".",".",".","#"],
    //                ["#",".",".",".","S","#"],
    //                ["#","#","#","#","#","#"]]
    // Output: 5
    // Explanation:  push the box down, left, left, up and up.

    // Example 4:
    // Input: grid = [["#","#","#","#","#","#","#"],
    //                ["#","S","#",".","B","T","#"],
    //                ["#","#","#","#","#","#","#"]]
    // Output: -1

    // Constraints:
    // m == grid.length
    // n == grid[i].length
    // 1 <= m <= 20
    // 1 <= n <= 20
    // grid contains only characters '.', '#',  'S' , 'T', or 'B'.
    // There is only one character 'S', 'B' and 'T' in the grid.

    typealias Direction = (dx: Int, dy: Int)
    private let directions: [Direction] = [(0, 1), (0, -1), (1, 0), (-1, 0)]

    private struct Position: Hashable {
        var x: Int
        var y: Int
        var toString: String { "(x: \(x)  y: \(y))" }

        func manhattanDistance(to position: Position) -> Int {
            abs(position.x - x) + abs(position.y - y)
        }
        func isNeighbor(with position: Position) -> Bool { manhattanDistance(to: position) == 1 }
    }

    private struct State: Hashable {
        var box: Position
        var person: Position
        var toString: String { "(box: \(box.toString) person: \(person.toString))" }
    }

    func minPushBox(_ grid: [[Character]]) -> Int {
        let M = grid.count
        let N = grid[0].count
        var boxPosition: Position = Position(x: -1, y: -1)
        var personPosition: Position = Position(x: -1, y: -1)
        var targetPosition: Position = Position(x: -1, y: -1)
        var queue = [State]()
        var visited = Set<State>()
        var depth = 0

        func valid(_ x: Int, _ y: Int) -> Bool {
            x >= 0 && x < M && y >= 0 && y < N && grid[x][y] != "#"
        }

        func getPersonPositions(_ currentBoxPosition: Position, _ currentPosonPosition: Position)
            -> [Position]
        {
            var ans = [Position]()
            var visited = Set<Position>()
            visited.insert(currentPosonPosition)
            var queue = [currentPosonPosition]

            while !queue.isEmpty {
                var nextLevel = [Position]()
                for p in queue {
                    if p.isNeighbor(with: currentBoxPosition) { ans.append(p) }
                    for dir in directions {
                        let nextX = p.x + dir.dx
                        let nextY = p.y + dir.dy
                        if valid(nextX, nextY) {
                            let nextP = Position(x: nextX, y: nextY)
                            if !visited.contains(nextP) && nextP != currentBoxPosition {
                                visited.insert(nextP)
                                nextLevel.append(nextP)
                            }
                        }
                    }
                }
                queue = nextLevel
            }

            return ans
        }

        for r in 0..<M {
            for c in 0..<N {
                switch grid[r][c] {
                case "S":
                    personPosition.x = r
                    personPosition.y = c
                case "B":
                    boxPosition.x = r
                    boxPosition.y = c
                case "T":
                    targetPosition.x = r
                    targetPosition.y = c
                default: break
                }
            }
        }

        for p in getPersonPositions(boxPosition, personPosition) {
            let startState = State(box: boxPosition, person: p)
            queue.append(startState)
            visited.insert(startState)
        }

        while !queue.isEmpty {
            depth += 1
            var nextLevel = [State]()
            for state in queue {
                for personPosition in getPersonPositions(state.box, state.person) {
                    let nextBoxPositionX = state.box.x + state.box.x - personPosition.x
                    let nextBoxPositionY = state.box.y + state.box.y - personPosition.y

                    if valid(nextBoxPositionX, nextBoxPositionY) {
                        let nextBoxPosition = Position(x: nextBoxPositionX, y: nextBoxPositionY)
                        guard nextBoxPosition != targetPosition else { return depth }
                        let nextState = State(box: nextBoxPosition, person: state.box)
                        if !visited.contains(nextState) {
                            visited.insert(nextState)
                            nextLevel.append(nextState)
                        }
                    }
                }
            }
            queue = nextLevel
        }

        return -1
    }

}
