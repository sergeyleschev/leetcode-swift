class Solution {

    // 1621. Number of Sets of K Non-Overlapping Line Segments
    // Given n points on a 1-D plane, where the ith point (from 0 to n-1) is at x = i, find the number of ways we can draw exactly k non-overlapping line segments such that each segment covers two or more points. The endpoints of each segment must have integral coordinates. The k line segments do not have to cover all n points, and they are allowed to share endpoints.

    // Return the number of ways we can draw k non-overlapping line segments. Since this number can be huge, return it modulo 109 + 7.

    // Example 1:
    // Input: n = 4, k = 2
    // Output: 5
    // Explanation: 
    // The two line segments are shown in red and blue.
    // The image above shows the 5 different ways {(0,2),(2,3)}, {(0,1),(1,3)}, {(0,1),(2,3)}, {(1,2),(2,3)}, {(0,1),(1,2)}.

    // Example 2:
    // Input: n = 3, k = 1
    // Output: 3
    // Explanation: The 3 ways are {(0,1)}, {(0,2)}, {(1,2)}.

    // Example 3:
    // Input: n = 30, k = 7
    // Output: 796297179
    // Explanation: The total number of possible ways to draw 7 line segments is 3796297200. Taking this number modulo 109 + 7 gives us 796297179.

    // Example 4:
    // Input: n = 5, k = 3
    // Output: 7

    // Example 5:
    // Input: n = 3, k = 2
    // Output: 1

    // Constraints:
    // 2 <= n <= 1000
    // 1 <= k <= n-1

    func numberOfSets(_ N: Int, _ K: Int) -> Int {
        var memo = [[Int?]](repeating: .init(repeating: nil, count: K + 1), count: N + 1)
        var sum = [[Int?]](repeating: .init(repeating: nil, count: K + 1), count: N + 1)


        func sumWorker(_ n: Int, _ k: Int) -> Int {
            if let s = sum[n][k] { return s }
            if n == 1 {
                sum[n][k] = worker(n, k)
            } else {
                sum[n][k] = (sumWorker(n - 1, k) + worker(n, k)) % (10_0000_0007)
            }
            return sum[n][k]!
        }

        func worker(_ n: Int, _ k: Int) -> Int {
            if n <= k { return 0 }
            if n <= 1 { return 1 }
            if k == 0 { return 1 }
            if let m = memo[n][k] { return m }
            let ans = (worker(n - 1, k) + sumWorker(n - 1, k - 1)) % (10_0000_0007)
            memo[n][k] = ans
            return ans
        }

        memo[2][1] = 1
        return worker(N, K)
    }

}