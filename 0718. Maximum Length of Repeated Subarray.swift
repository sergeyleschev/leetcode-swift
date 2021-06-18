class Solution {

    // 718. Maximum Length of Repeated Subarray
    // Given two integer arrays nums1 and nums2, return the maximum length of a subarray that appears in both arrays.

    // Example 1:
    // Input: nums1 = [1,2,3,2,1], nums2 = [3,2,1,4,7]
    // Output: 3
    // Explanation: The repeated subarray with maximum length is [3,2,1].

    // Example 2:
    // Input: nums1 = [0,0,0,0,0], nums2 = [0,0,0,0,0]
    // Output: 5

    // Constraints:
    // 1 <= nums1.length, nums2.length <= 1000
    // 0 <= nums1[i], nums2[i] <= 100

    func findLength(_ A: [Int], _ B: [Int]) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: B.count + 1), count: A.count + 1)
        var ans = 0
        
        for i in 0...A.count {
            for j in 0...B.count {
                guard i > 0 && j > 0 else { continue }
                if A[i - 1] == B[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                    ans = max(ans, dp[i][j])
                }
            }
        }
        
        return ans
    }
    
}