class Solution {

    // Solution by Sergey Leschev

    // 1301. Number of Paths with Max Score
    // You are given a square board of characters. You can move on the board starting at the bottom right square marked with the character 'S'.
    // You need to reach the top left square marked with the character 'E'. The rest of the squares are labeled either with a numeric character 1, 2, ..., 9 or with an obstacle 'X'. In one move you can go up, left or up-left (diagonally) only if there is no obstacle there.
    // Return a list of two integers: the first integer is the maximum sum of numeric characters you can collect, and the second is the number of such paths that you can take to get that maximum sum, taken modulo 10^9 + 7.
    // In case there is no path, return [0, 0].

    // Example 1:
    // Input: board = ["E23","2X2","12S"]
    // Output: [7,1]

    // Example 2:
    // Input: board = ["E12","1X1","21S"]
    // Output: [4,2]

    // Example 3:
    // Input: board = ["E11","XXX","11S"]
    // Output: [0,0]

    // Constraints:
    // 2 <= board.length == board[i].length <= 100

    // - Complexity:
    //   - time: O(n^2)
    //   - space: O(n^2)

    func pathsWithMaxScore(_ board: [String]) -> [Int] {
        let mod = Int(1e9 + 7)
        var board: [[Character]] = board.map { Array($0) }
        let n = board.count
        guard board[0][0] == "E" && board[n - 1][n - 1] == "S" else { return [0, 0] }
        var dp: [[[Int]]] = Array(repeating: Array(repeating: [-100000, 0], count: n), count: n)
        let dir = [0, 1, 1, 0]

        dp[n - 1][n - 1] = [0, 1]

        for i in stride(from: n - 1, through: 0, by: -1) {
            for j in stride(from: n - 1, through: 0, by: -1) {
                if board[i][j] == "S" || board[i][j] == "X" { continue }
                for d in 0..<3 {
                    let r = i + dir[d]
                    let c = j + dir[d + 1]

                    if r <= n - 1, c <= n - 1 {
                        if dp[i][j][0] < dp[r][c][0] { dp[i][j] = [dp[r][c][0], 0] }
                        if dp[i][j][0] == dp[r][c][0] {
                            dp[i][j][1] = (dp[i][j][1] + dp[r][c][1]) % mod
                        }
                    }
                }
                dp[i][j][0] += board[i][j].wholeNumberValue ?? 0
            }
        }

        return dp[0][0][1] == 0 ? [0, 0] : [dp[0][0][0], dp[0][0][1] % mod]
    }

}
