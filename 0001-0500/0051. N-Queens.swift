class Solution {

    // Solution by Sergey Leschev

    // 51. N-Queens
    // The n-queens puzzle is the problem of placing n queens on an n x n chessboard such that no two queens attack each other.
    // Given an integer n, return all distinct solutions to the n-queens puzzle.

    // Each solution contains a distinct board configuration of the n-queens' placement, where 'Q' and '.' both indicate a queen and an empty space, respectively.

    // Example 1:
    // Input: n = 4
    // Output: [[".Q..","...Q","Q...","..Q."],["..Q.","Q...","...Q",".Q.."]]
    // Explanation: There exist two distinct solutions to the 4-queens puzzle as shown above

    // Example 2:
    // Input: n = 1
    // Output: [["Q"]]

    // Constraints:
    // 1 <= n <= 9

    func solveNQueens(_ n: Int) -> [[String]] {
        var res: [[Int]] = []

        func backtarck(_ path: [Int]) {
            if path.count == n { res.append(path) }
            var path = path
            var available: [Int] = []
            for i in 0..<n { available.append(i) }

            for (i, val) in path.enumerated() {
                if let index = available.firstIndex(of: val - path.count + i) {
                    available.remove(at: index)
                }

                if let index = available.firstIndex(of: val) {
                    available.remove(at: index)
                }

                if let index = available.firstIndex(of: val + path.count - i) {
                    available.remove(at: index)
                }
            }

            for i in 0..<n {
                if available.contains(i) == false { continue }
                path.append(i)
                backtarck(path)
                path.remove(at: path.count - 1)
            }
        }

        backtarck([])

        return res.map({ (path: [Int]) -> [String] in
            var res: [String] = []
            for i in path {
                var string = ""
                for j in 0..<n { string += (i == j ? "Q" : ".") }
                res.append(string)
            }
            return res
        })
    }

}
