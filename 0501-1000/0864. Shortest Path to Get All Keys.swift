class Solution {

    // Solution by Sergey Leschev

    // 864. Shortest Path to Get All Keys
    // We are given a 2-dimensional grid. "." is an empty cell, "#" is a wall, "@" is the starting point, ("a", "b", ...) are keys, and ("A", "B", ...) are locks.
    // We start at the starting point, and one move consists of walking one space in one of the 4 cardinal directions.  We cannot walk outside the grid, or walk into a wall.  If we walk over a key, we pick it up.  We can't walk over a lock unless we have the corresponding key.
    // For some 1 <= K <= 6, there is exactly one lowercase and one uppercase letter of the first K letters of the English alphabet in the grid.  This means that there is exactly one key for each lock, and one lock for each key; and also that the letters used to represent the keys and locks were chosen in the same order as the English alphabet.
    // Return the lowest number of moves to acquire all keys.  If it's impossible, return -1.

    // Example 1:
    // Input: ["@.a.#","###.#","b.A.B"]
    // Output: 8

    // Example 2:
    // Input: ["@..aA","..B#.","....b"]
    // Output: 6

    // Note:
    // 1 <= grid.length <= 30
    // 1 <= grid[0].length <= 30
    // grid[i][j] contains only '.', '#', '@', 'a'-'f' and 'A'-'F'
    // The number of keys is in [1, 6].  Each key has a different letter and opens exactly one lock.

    typealias Direction = (dx: Int, dy: Int)
    private let directions: [Direction] = [(0, 1), (0, -1), (1, 0), (-1, 0)]

    struct Position: Hashable {
        var x: Int
        var y: Int
    }

    struct State: Hashable {
        var pos: Position
        var withKeys: Set<Character>
    }

    func shortestPathAllKeys(_ grid: [String]) -> Int {
        let gridCopy = grid.map { [Character]($0) }
        var row = gridCopy.count
        var col = gridCopy[0].count
        var startPosition = Position(x: -1, y: -1)
        var walls = Set<Position>()
        var keys = Set<Position>()
        var locks = Set<Position>()
        var visited = Set<State>()
        var potentialStates = [State]()
        var depth = 0

        func valid(_ p: Position) -> Bool {
            p.x >= 0 && p.x < row && p.y >= 0 && p.y < col && !walls.contains(p)
        }

        for i in 0..<row {
            for j in 0..<col {
                if gridCopy[i][j] == "@" {
                    startPosition.x = i
                    startPosition.y = j
                } else if gridCopy[i][j] == "#" {
                    walls.insert(Position(x: i, y: j))
                } else if gridCopy[i][j].isLowercase {
                    keys.insert(Position(x: i, y: j))
                } else if gridCopy[i][j].isUppercase {
                    locks.insert(Position(x: i, y: j))
                }
            }
        }

        let keysCount = keys.count

        //BFS
        let startState = State(pos: startPosition, withKeys: [])
        visited.insert(startState)
        potentialStates.append(startState)

        while !potentialStates.isEmpty {
            depth += 1
            let length = potentialStates.count
            for _ in 0..<length {
                var s = potentialStates.removeFirst()
                if keys.contains(s.pos) { s.withKeys.insert(gridCopy[s.pos.x][s.pos.y]) }
                let p = s.pos

                for dir in directions {
                    let nextP = Position(x: p.x + dir.dx, y: p.y + dir.dy)
                    if valid(nextP) {
                        if keys.contains(nextP) {
                            var currentKeys = s.withKeys
                            currentKeys.insert(gridCopy[nextP.x][nextP.y])
                            if currentKeys.count == keysCount { return depth }
                        }

                        if !locks.contains(nextP)
                            || s.withKeys.contains(gridCopy[nextP.x][nextP.y].lowercased().first!)
                        {
                            s.pos = nextP
                            if !visited.contains(s) {
                                potentialStates.append(s)
                                visited.insert(s)
                            }
                        }
                    }
                }
            }
        }

        return -1
    }

}
