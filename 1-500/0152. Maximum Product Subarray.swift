class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 152. Maximum Product Subarray
    // Given an integer array nums, find a contiguous non-empty subarray within the array that has the largest product, and return the product.
    // It is guaranteed that the answer will fit in a 32-bit integer.
    // A subarray is a contiguous subsequence of the array.

    // Finds the contiguous subarray within an array that has the largest product.
    
    // - Parameter nums: The array of integers.
    // - Returns: The largest product.

    // Example 1:
    // Input: nums = [2,3,-2,4]
    // Output: 6
    // Explanation: [2,3] has the largest product 6.

    // Example 2:
    // Input: nums = [-2,0,-1]
    // Output: 0
    // Explanation: The result cannot be 2, because [-2,-1] is not a subarray.

    // Constraints:
    // 1 <= nums.length <= 2 * 10^4
    // -10 <= nums[i] <= 10
    // The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

    // - Complexity:
    //   - time: O(n), where n is the length of nums.
    //   - space: O(1), only constant space is used.
    
    func maxProduct(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }

        var ans = nums[0]
        var maxSoFar = nums[0]
        var minSoFar = nums[0]

        for i in 1..<nums.count {
            let curr = nums[i]

            let tmpMax = max(curr, maxSoFar * curr, minSoFar * curr)
            minSoFar = min(curr, maxSoFar * curr, minSoFar * curr)
            maxSoFar = tmpMax

            ans = max(ans, maxSoFar)
        }

        return ans
    }

}