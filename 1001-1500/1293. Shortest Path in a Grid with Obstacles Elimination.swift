class Solution {

    // Solution by Sergey Leschev

    // 1293. Shortest Path in a Grid with Obstacles Elimination
    // Given a m * n grid, where each cell is either 0 (empty) or 1 (obstacle). In one step, you can move up, down, left or right from and to an empty cell.
    // Return the minimum number of steps to walk from the upper left corner (0, 0) to the lower right corner (m-1, n-1) given that you can eliminate at most k obstacles. If it is not possible to find such walk return -1.

    // Example 1:
    // Input:
    // grid =
    // [[0,0,0],
    //  [1,1,0],
    //  [0,0,0],
    //  [0,1,1],
    //  [0,0,0]],
    // k = 1
    // Output: 6
    // Explanation:
    // The shortest path without eliminating any obstacle is 10.
    // The shortest path with one obstacle elimination at position (3,2) is 6. Such path is (0,0) -> (0,1) -> (0,2) -> (1,2) -> (2,2) -> (3,2) -> (4,2).

    // Example 2:
    // Input:
    // grid =
    // [[0,1,1],
    //  [1,1,1],
    //  [1,0,0]],
    // k = 1
    // Output: -1
    // Explanation:
    // We need to eliminate at least two obstacles to find such a walk.

    // Constraints:
    // grid.length == m
    // grid[0].length == n
    // 1 <= m, n <= 40
    // 1 <= k <= m*n
    // grid[i][j] == 0 or 1
    // grid[0][0] == grid[m-1][n-1] == 0

    private struct State {
        var x: Int
        var y: Int
        var remain: Int
    }

    typealias Direction = (dx: Int, dy: Int)

    private let directions: [Direction] = [(0, 1), (0, -1), (1, 0), (-1, 0)]

    func shortestPath(_ grid: [[Int]], _ k: Int) -> Int {
        let M = grid.count
        let N = grid[0].count
        guard M != 1 || N != 1 else { return 0 }
        var queue = [State]()
        var visited = [[Int]](repeating: [Int](repeating: -1, count: N), count: M)
        var depth = 0

        func valid(x: Int, y: Int) -> Bool { x >= 0 && x < M && y >= 0 && y < N }

        queue.append(State(x: 0, y: 0, remain: k))
        visited[0][0] = k

        while !queue.isEmpty {
            depth += 1
            var nextLevel = [State]()
            for state in queue {
                for dir in directions {
                    let nextX = state.x + dir.dx
                    let nextY = state.y + dir.dy
                    guard nextX != M - 1 || nextY != N - 1 else { return depth }

                    if valid(x: nextX, y: nextY) {
                        var nextState = State(x: nextX, y: nextY, remain: state.remain)
                        if grid[nextX][nextY] == 1 { nextState.remain = state.remain - 1 }
                        if nextState.remain >= 0 && visited[nextX][nextY] < nextState.remain {
                            nextLevel.append(nextState)
                            visited[nextX][nextY] = nextState.remain
                        }

                    }
                }
            }
            queue = nextLevel
        }

        return -1
    }

}
