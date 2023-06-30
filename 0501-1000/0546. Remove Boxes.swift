class Solution {

    // Solution by Sergey Leschev
    
    // 546. Remove Boxes
    // You are given several boxes with different colors represented by different positive numbers.
    // You may experience several rounds to remove boxes until there is no box left. Each time you can choose some continuous boxes with the same color (i.e., composed of k boxes, k >= 1), remove them and get k * k points.
    // Return the maximum points you can get.

    // Example 1:
    // Input: boxes = [1,3,2,2,2,3,4,3,1]
    // Output: 23
    // Explanation:
    // [1, 3, 2, 2, 2, 3, 4, 3, 1] 
    // ----> [1, 3, 3, 4, 3, 1] (3*3=9 points) 
    // ----> [1, 3, 3, 3, 1] (1*1=1 points) 
    // ----> [1, 1] (3*3=9 points) 
    // ----> [] (2*2=4 points)

    // Example 2:
    // Input: boxes = [1,1,1]
    // Output: 9

    // Example 3:
    // Input: boxes = [1]
    // Output: 1

    // Constraints:
    // 1 <= boxes.length <= 100
    // 1 <= boxes[i] <= 100

    // - Complexity:
    //   - time: O(n ^ 4)
    //   - space: O(n ^ 3)

    func removeBoxes(_ boxes: [Int]) -> Int {
        let n:Int = boxes.count
        var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: n), count: n), count: n)
        
        for i in 0..<n {
            for k in 0...i {
                dp[i][i][k] = (1 + k) * (1 + k)
            }
        }

        for t in 1..<n {
            for j in t..<n {
                let i = j - t
                for k in 0...i {
                    var res:Int = (1 + k) * (1 + k) + dp[i + 1][j][0]
                    for m in (i + 1)...j {
                        if boxes[m] == boxes[i] {
                            res = max(res, dp[i + 1][m - 1][0] + dp[m][j][k + 1])
                        }
                    }
                    dp[i][j][k] = res
                }
            }
        }
        
        return n == 0 ? 0 : dp[0][n - 1][0]
    }

}