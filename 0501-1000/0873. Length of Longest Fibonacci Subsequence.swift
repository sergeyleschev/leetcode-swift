class Solution {

    // Solution @ Sergey Leschev

    // 873. Length of Longest Fibonacci Subsequence
    // A sequence x1, x2, ..., xn is Fibonacci-like if:
    // n >= 3
    // xi + xi+1 == xi+2 for all i + 2 <= n
    // Given a strictly increasing array arr of positive integers forming a sequence, return the length of the longest Fibonacci-like subsequence of arr. If one does not exist, return 0.
    // A subsequence is derived from another sequence arr by deleting any number of elements (including none) from arr, without changing the order of the remaining elements. For example, [3, 5, 8] is a subsequence of [3, 4, 5, 6, 7, 8].

    // Example 1:
    // Input: arr = [1,2,3,4,5,6,7,8]
    // Output: 5
    // Explanation: The longest subsequence that is fibonacci-like: [1,2,3,5,8].

    // Example 2:
    // Input: arr = [1,3,7,11,12,14,18]
    // Output: 3
    // Explanation: The longest subsequence that is fibonacci-like: [1,11,12], [3,11,14] or [7,11,18].

    // Constraints:
    // 3 <= arr.length <= 1000
    // 1 <= arr[i] < arr[i + 1] <= 10^9

    func lenLongestFibSubseq(_ arr: [Int]) -> Int {
        var map: [Int: Int] = [:]
        let N = arr.count
        for i in 0..<arr.count { map[arr[i]] = i }
        var dp: [Int: Int] = [:]
        var res = 0

        for i in 0..<N {
            for j in i + 1..<N {
                let diff = arr[j] - arr[i]
                if diff >= arr[i] { break }
                if let diffIndex = map[diff] {
                    dp[i * N + j] = dp[diffIndex * N + i, default: 2] + 1
                    res = max(dp[i * N + j, default: 2], res)
                }
            }
        }
        
        return res > 2 ? res : 0
    }

}