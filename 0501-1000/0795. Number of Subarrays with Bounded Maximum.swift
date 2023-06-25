class Solution {

    // Solution @ Sergey Leschev

    // 795. Number of Subarrays with Bounded Maximum
    // Given an integer array nums and two integers left and right, return the number of contiguous non-empty subarrays such that the value of the maximum array element in that subarray is in the range [left, right].
    // The test cases are generated so that the answer will fit in a 32-bit integer.

    // Example 1:
    // Input: nums = [2,1,4,3], left = 2, right = 3
    // Output: 3
    // Explanation: There are three subarrays that meet the requirements: [2], [2, 1], [3].

    // Example 2:
    // Input: nums = [2,9,2,5,6], left = 2, right = 8
    // Output: 7

    // Constraints:
    // 1 <= nums.length <= 10^5
    // 0 <= nums[i] <= 10^9
    // 0 <= left <= right <= 10^9

    func numSubarrayBoundedMax(_ A: [Int], _ L: Int, _ R: Int) -> Int {
        var lastLargeThanRNumIndex = -1
        var lastInTheRangeNumIndex = -1
        var ans = 0

        for i in 0..<A.count {
            if A[i] > R {
                lastLargeThanRNumIndex = i
            } else if A[i] < L {
                if lastInTheRangeNumIndex != -1 && lastInTheRangeNumIndex > lastLargeThanRNumIndex {
                    ans += lastInTheRangeNumIndex - lastLargeThanRNumIndex
                }
            } else {
                lastInTheRangeNumIndex = i
                ans += i - lastLargeThanRNumIndex
            }
        }
        
        return ans
    }

}