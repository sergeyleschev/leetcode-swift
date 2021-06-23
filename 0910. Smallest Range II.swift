class Solution {

    // 910. Smallest Range II
    // Given an array nums of integers, for each integer nums[i] we need to choose either x = -k or x = k, and add x to nums[i] (only once).
    // After this process, we have some array result.
    // Return the smallest possible difference between the maximum value of result and the minimum value of result.

    // Finds the smallest possible difference between the maximum value of B and
    // the minimum value of B. B[i] = A[i] + K or B[i] = A[i] - K.

    // - Parameters:
    //   - A: An array of integers.
    //   - K: An integer.
    // - Returns: The smallest possible difference.

    // Example 1:
    // Input: nums = [1], k = 0
    // Output: 0
    // Explanation: result = [1]

    // Example 2:
    // Input: nums = [0,10], k = 2
    // Output: 6
    // Explanation: result = [2,8]

    // Example 3:
    // Input: nums = [1,3,6], k = 3
    // Output: 3
    // Explanation: result = [4,6,3]

    // Note:
    // 1 <= nums.length <= 10000
    // 0 <= nums[i] <= 10000
    // 0 <= k <= 10000

    // - Complexity:
    //   - time: O(n log(n)), where n is the length of A.
    //   - space: O(1), only constant space is used.
    
    func smallestRangeII(_ A: [Int], _ K: Int) -> Int {
        let n = A.count
        let a = A.sorted()
        var ans = a[n - 1] - a[0]
        
        for i in 0..<n - 1 {
            let high = max(a[n - 1] - K, a[i] + K)
            let low = min(a[0] + K, a[i + 1] - K)
            ans = min(ans, high - low)
        }
        
        return ans
    }

}