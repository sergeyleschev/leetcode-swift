class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 974. Subarray Sums Divisible by K
    // Given an array nums of integers, return the number of (contiguous, non-empty) subarrays that have a sum divisible by k.

    // Example 1:
    // Input: nums = [4,5,0,-2,-3,1], k = 5
    // Output: 7
    // Explanation: There are 7 subarrays with a sum divisible by k = 5:
    // [4, 5, 0, -2, -3, 1], [5], [5, 0], [5, 0, -2, -3], [0], [0, -2, -3], [-2, -3] 

    // Note:
    // 1 <= nums.length <= 30000
    // -10000 <= nums[i] <= 10000
    // 2 <= k <= 10000

    func subarraysDivByK(_ A: [Int], _ K: Int) -> Int {
        var prefixSum = [0] // using first i elements
        var remCount = [Int](repeating: 0, count: K)
        
        remCount[0] = 1 // no elements => 0

        A.forEach {
            let new = ((prefixSum.last! + $0) % K + K) % K
            remCount[new] += 1
            prefixSum.append(new)
        }

        return remCount.reduce(0) { $0 + $1 * ($1 - 1) / 2 }
    }
    
}