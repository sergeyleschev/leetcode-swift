class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 77. Combinations
    // Given two integers n and k, return all possible combinations of k numbers out of the range [1, n].
    // You may return the answer in any order.

    // Example 1:
    // Input: n = 4, k = 2
    // Output:
    // [
    //   [2,4],
    //   [3,4],
    //   [2,3],
    //   [1,2],
    //   [1,3],
    //   [1,4],
    // ]

    // Example 2:
    // Input: n = 1, k = 1
    // Output: [[1]]

    // Constraints:
    // 1 <= n <= 20
    // 1 <= k <= n

    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var res: [[Int]] = []
        
        
        func backtrack(_ path: [Int], _ max: Int) {
            if path.count == k {
                res.append(path)
                return
            
            }
            
            var path = path
            if max + 1 > n { return }
            
            for i in max+1...n {
                if n - i < k - path.count - 1 {
                    continue
                }
                
                path.append(i)
                backtrack(path, i)
                path.remove(at: path.count - 1)
            }
        }
        
        backtrack([], 0)
        return res
    }
    
}