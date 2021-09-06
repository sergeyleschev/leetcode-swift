class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1005. Maximize Sum Of Array After K Negations
    // Given an array nums of integers, we must modify the array in the following way: we choose an i and replace nums[i] with -nums[i], and we repeat this process k times in total.  (We may choose the same index i multiple times.)
    // Return the largest possible sum of the array after modifying it in this way.

    // Example 1:
    // Input: nums = [4,2,3], k = 1
    // Output: 5
    // Explanation: Choose indices (1,) and nums becomes [4,-2,3].

    // Example 2:
    // Input: nums = [3,-1,0,2], k = 3
    // Output: 6
    // Explanation: Choose indices (1, 2, 2) and nums becomes [3,1,0,2].

    // Example 3:
    // Input: nums = [2,-3,-1,5,-4], k = 2
    // Output: 13
    // Explanation: Choose indices (1, 4) and nums becomes [2,3,-1,5,4].

    // Note:
    // 1 <= nums.length <= 10000
    // 1 <= k <= 10000
    // -100 <= nums[i] <= 100

    func largestSumAfterKNegations(_ A: [Int], _ K: Int) -> Int {
        var A = A
        var K = K
        var minAbs = Int.max

        A.sort()

        // Reverse all negative numbers
        for i in 0..<A.count {
            minAbs = min(minAbs, abs(A[i]))
            if A[i] < 0 {
                A[i] = -A[i]
                K -= 1
                if K == 0 { return A.reduce(0, +) }
            } else if A[i] == 0 {
                return A.reduce(0, +)
            } else { break }
        }
        
        var sum = A.reduce(0, +)
        // Reverse minimum number, diff is double value
        if K % 2 != 0 { sum -= 2 * minAbs }    
        return sum
    }

}