class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 52. N-Queens II
    // The n-queens puzzle is the problem of placing n queens on an n x n chessboard such that no two queens attack each other.
    // Given an integer n, return the number of distinct solutions to the n-queens puzzle.

    // Example 1:
    // Input: n = 4
    // Output: 2
    // Explanation: There are two distinct solutions to the 4-queens puzzle as shown.

    // Example 2:
    // Input: n = 1
    // Output: 1
     
    // Constraints:
    // 1 <= n <= 9

    func totalNQueens(_ n: Int) -> Int {
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
        
        return res.count
    }
    
}