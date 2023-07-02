class Solution {

    // Solution by Sergey Leschev

    // 547. Number of Provinces
    // There are n cities. Some of them are connected, while some are not. If city a is connected directly with city b, and city b is connected directly with city c, then city a is connected indirectly with city c.
    // A province is a group of directly or indirectly connected cities and no other cities outside of the group.
    // You are given an n x n matrix isConnected where isConnected[i][j] = 1 if the ith city and the jth city are directly connected, and isConnected[i][j] = 0 otherwise.
    // Return the total number of provinces.

    // Example 1:
    // Input: isConnected = [[1,1,0],[1,1,0],[0,0,1]]
    // Output: 2

    // Example 2:
    // Input: isConnected = [[1,0,0],[0,1,0],[0,0,1]]
    // Output: 3

    // Constraints:
    // 1 <= n <= 200
    // n == isConnected.length
    // n == isConnected[i].length
    // isConnected[i][j] is 1 or 0.
    // isConnected[i][i] == 1
    // isConnected[i][j] == isConnected[j][i]

    func findCircleNum(_ M: [[Int]]) -> Int {
        guard !M.isEmpty || !M[0].isEmpty else { return 0 }

        var ans = 0
        var visited = Array(repeating: 0, count: M[0].count)

        func dfs(k: Int) {
            visited[k] = 1
            for i in 0..<M.count {
                if M[k][i] == 0 || visited[i] == 1 { continue }
                dfs(k: i)
            }
        }

        for i in 0..<M.count {
            if visited[i] == 1 { continue }
            dfs(k: i)
            ans += 1
        }

        return ans
    }

}
