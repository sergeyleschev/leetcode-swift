class Solution {

    // Solution @ Sergey Leschev

    // 1340. Jump Game V
    // Given an array of integers arr and an integer d. In one step you can jump from index i to index:
    // i + x where: i + x < arr.length and 0 < x <= d.
    // i - x where: i - x >= 0 and 0 < x <= d.
    // In addition, you can only jump from index i to index j if arr[i] > arr[j] and arr[i] > arr[k] for all indices k between i and j (More formally min(i, j) < k < max(i, j)).
    // You can choose any index of the array and start jumping. Return the maximum number of indices you can visit.
    // Notice that you can not jump outside of the array at any time.

    // Example 1:
    // Input: arr = [6,4,14,6,8,13,9,7,10,6,12], d = 2
    // Output: 4
    // Explanation: You can start at index 10. You can jump 10 --> 8 --> 6 --> 7 as shown.
    // Note that if you start at index 6 you can only jump to index 7. You cannot jump to index 5 because 13 > 9. You cannot jump to index 4 because index 5 is between index 4 and 6 and 13 > 9.
    // Similarly You cannot jump from index 3 to index 2 or index 1.

    // Example 2:
    // Input: arr = [3,3,3,3,3], d = 3
    // Output: 1
    // Explanation: You can start at any index. You always cannot jump to any index.

    // Example 3:
    // Input: arr = [7,6,5,4,3,2,1], d = 1
    // Output: 7
    // Explanation: Start at index 0. You can visit all the indicies. 

    // Example 4:
    // Input: arr = [7,1,7,1,7,1], d = 2
    // Output: 2

    // Example 5:
    // Input: arr = [66], d = 1
    // Output: 1

    // Constraints:
    // 1 <= arr.length <= 1000
    // 1 <= arr[i] <= 10^5
    // 1 <= d <= arr.length

    func maxJumps(_ arr: [Int], _ d: Int) -> Int {
        guard arr.count > 0 else { return 0 }
        let count = arr.count // We will jump from lowest to highest
        var entries = [(Int, Int)].init()
        var res = 1
        var dp = [Int](repeating: 1, count: count)

        for i in 0..<count { entries.append((arr[i], i)) }
        entries.sort { (kv1, kv2) -> Bool in kv1.0 < kv2.0 }
        
        for i in 0..<count {
            let index = entries[i].1
            
            // Find left part
            var j = index - 1
            while j >= index-d && j >= 0 {
                if arr[j] >= arr[index] { break }
                if dp[j] != 0 { dp[index] = max(dp[index], dp[j] + 1) }
                j -= 1
            }
            
            // Find right part
            j = index + 1
            while j <= index + d && j < count {
                if arr[j] >= arr[index] { break }
                if dp[j] != 0 { dp[index] = max(dp[index], dp[j] + 1) }
                j += 1
            }
            
            res = max(res, dp[index])
        }
        
        return res
    } 

}