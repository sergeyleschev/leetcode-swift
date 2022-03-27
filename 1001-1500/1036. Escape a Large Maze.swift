class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1036. Escape a Large Maze
    // There is a 1 million by 1 million grid on an XY-plane, and the coordinates of each grid square are (x, y).
    // We start at the source = [sx, sy] square and want to reach the target = [tx, ty] square. There is also an array of blocked squares, where each blocked[i] = [xi, yi] represents a blocked square with coordinates (xi, yi).
    // Each move, we can walk one square north, east, south, or west if the square is not in the array of blocked squares. We are also not allowed to walk outside of the grid.
    // Return true if and only if it is possible to reach the target square from the source square through a sequence of valid moves.

    // Example 1:
    // Input: blocked = [[0,1],[1,0]], source = [0,0], target = [0,2]
    // Output: false
    // Explanation: The target square is inaccessible starting from the source square because we cannot move.
    // We cannot move north or east because those squares are blocked.
    // We cannot move south or west because we cannot go outside of the grid.

    // Example 2:
    // Input: blocked = [], source = [0,0], target = [999999,999999]
    // Output: true
    // Explanation: Because there are no blocked cells, it is possible to reach the target square.

    // Constraints:
    // 0 <= blocked.length <= 200
    // blocked[i].length == 2
    // 0 <= xi, yi < 10^6
    // source.length == target.length == 2
    // 0 <= sx, sy, tx, ty < 10^6
    // source != target
    // It is guaranteed that source and target are not blocked.

    private struct Position: Hashable {
        var x: Int
        var y: Int
    }

    typealias Direction = (dx:Int,dy:Int)
    
    private let directions: [Direction] = [(0,1),(0,-1),(1,0),(-1,0)]
    private let N = 1_000_000
    
    
    func isEscapePossible(_ blocked: [[Int]], _ source: [Int], _ target: [Int]) -> Bool {
        guard !blocked.isEmpty else { return true }
        var blockedSets = Set<Position>(blocked.map({ Position(x: $0[0], y: $0[1])}))

        
        func valid(_ x: Int, _ y: Int) -> Bool { x >= 0 && y >= 0 && x < N && y < N }

        
        func bfs(_ source: Position, target: Position) -> Bool {
            var queue = [Position]()
            queue.append(source)
            var visited = Set<Position>()
            visited.insert(source)
            
            while !queue.isEmpty {
                var nextLevel = [Position]()
                for p in queue {
                    for dir in directions {
                        let nextX = p.x + dir.dx
                        let nextY = p.y + dir.dy
                        if valid(nextX, nextY) {
                            let  nextP = Position(x: nextX, y: nextY)
                            guard nextP != target else { return true }
                            if !visited.contains(nextP) && !blockedSets.contains(nextP){
                                nextLevel.append(nextP)
                                visited.insert(nextP)
                                guard visited.count < 2_000_0 else { return true }
                            }
                        }
                    }
                }
                queue = nextLevel
            }
            return false
        }

        let sourcePosition = Position(x: source[0], y: source[1])
        let targetPosition = Position(x: target[0], y: target[1])
        return bfs(sourcePosition, target: targetPosition) && bfs(targetPosition, target: sourcePosition)
    }

 }