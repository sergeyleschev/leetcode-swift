class Solution {

    // Solution @ Sergey Leschev

    // 1043. Partition Array for Maximum Sum
    // Given an integer array arr, partition the array into (contiguous) subarrays of length at most k. After partitioning, each subarray has their values changed to become the maximum value of that subarray.
    // Return the largest sum of the given array after partitioning. Test cases are generated so that the answer fits in a 32-bit integer.

    // Example 1:
    // Input: arr = [1,15,7,9,2,5,10], k = 3
    // Output: 84
    // Explanation: arr becomes [15,15,15,9,10,10,10]

    // Example 2:
    // Input: arr = [1,4,1,5,7,3,6,1,9,9,3], k = 4
    // Output: 83

    // Example 3:
    // Input: arr = [1], k = 1
    // Output: 1

    // Constraints:
    // 1 <= arr.length <= 500
    // 0 <= arr[i] <= 10^9
    // 1 <= k <= arr.length

     func maxSumAfterPartitioning(_ A: [Int], _ K: Int) -> Int {
        var dp = [Int](repeating: 0, count: A.count + 1)
        
        for i in 1...A.count {
            var maxTemp = A[i - 1]
            for j in 1...K {
                if i - j >= 0 {
                    maxTemp = max(maxTemp, A[i - j])
                    dp[i] = max(dp[i], dp[i -  j] + j * maxTemp)
                }
            }
        }

        return dp[A.count]
     }

}