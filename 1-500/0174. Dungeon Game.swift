class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 174. Dungeon Game
    // The demons had captured the princess and imprisoned her in the bottom-right corner of a dungeon. The dungeon consists of m x n rooms laid out in a 2D grid. Our valiant knight was initially positioned in the top-left room and must fight his way through dungeon to rescue the princess.
    // The knight has an initial health point represented by a positive integer. If at any point his health point drops to 0 or below, he dies immediately.
    // Some of the rooms are guarded by demons (represented by negative integers), so the knight loses health upon entering these rooms; other rooms are either empty (represented as 0) or contain magic orbs that increase the knight's health (represented by positive integers).
    // To reach the princess as quickly as possible, the knight decides to move only rightward or downward in each step.
    // Return the knight's minimum initial health so that he can rescue the princess.
    // Note that any room can contain threats or power-ups, even the first room the knight enters and the bottom-right room where the princess is imprisoned.

    // Determines the knight's minimum initial health so that he can rescue the princess.

    // - Parameter dungeon: The dungeon consists of M x N rooms laid out in a 2D grid.
    // - Returns: The knight's minimum initial health.

    // Example 1:
    // Input: dungeon = [[-2,-3,3],[-5,-10,1],[10,30,-5]]
    // Output: 7
    // Explanation: The initial health of the knight must be at least 7 if he follows the optimal path: RIGHT-> RIGHT -> DOWN -> DOWN.

    // Example 2:
    // Input: dungeon = [[0]]
    // Output: 1
     
    // Constraints:
    // m == dungeon.length
    // n == dungeon[i].length
    // 1 <= m, n <= 200
    // -1000 <= dungeon[i][j] <= 1000

    // - Complexity:
    //   - time: O(n * m), where n * m is the number of rooms in the dungeon.
    //   - space: O(n * m), where n * m is the number of rooms in the dungeon.
    
    func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
        guard !dungeon.isEmpty else { return 1 }

        let rows = dungeon.count
        let columns = dungeon[0].count
        var dp = [[Int]](repeating: [Int](repeating: Int.max, count: columns + 1), count: rows + 1)
        dp[rows][columns - 1] = 1
        dp[rows - 1][columns] = 1

        for row in (0..<rows).reversed() {
            for column in (0..<columns).reversed() {
                let health = min(dp[row + 1][column], dp[row][column + 1]) - dungeon[row][column]
                dp[row][column] = health > 0 ? health : 1
            }
        }

        return dp[0][0]
    }

}