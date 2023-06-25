class Solution {

    // Solution @ Sergey Leschev

    // 413. Arithmetic Slices
    // An integer array is called arithmetic if it consists of at least three elements and if the difference between any two consecutive elements is the same.
    // For example, [1,3,5,7,9], [7,7,7,7], and [3,-1,-5,-9] are arithmetic sequences.
    // Given an integer array nums, return the number of arithmetic subarrays of nums.
    // A subarray is a contiguous subsequence of the array.

    // Finds the number of arithmetic slices in array A.

    // - Parameter A: The array.
    // - Returns: The number of arithmetic slices.

    // Example 1:
    // Input: nums = [1,2,3,4]
    // Output: 3
    // Explanation: We have 3 arithmetic slices in nums: [1, 2, 3], [2, 3, 4] and [1,2,3,4] itself.

    // Example 2:
    // Input: nums = [1]
    // Output: 0

    // Constraints:
    // 1 <= nums.length <= 5000
    // -1000 <= nums[i] <= 1000

    // - Complexity:
    //   - time: O(n), where n is the length of A.
    //   - space: O(1), only constant space is used.

    func numberOfArithmeticSlices(_ A: [Int]) -> Int {
        let n = A.count
        guard n > 2 else { return 0 }
        var dp = 0
        var ans = 0
        
        for i in 2..<n {
            if A[i] - A[i - 1] == A[i - 1] - A[i - 2] {
                dp += 1
                ans += dp
            } else {
                dp = 0
            }
        }
        
        return ans
    }

}