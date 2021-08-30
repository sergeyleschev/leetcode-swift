class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 713. Subarray Product Less Than K
    // Given an array of integers nums and an integer k, return the number of contiguous subarrays where the product of all the elements in the subarray is strictly less than k.

    // Counts the number of contiguous subarrays where the product of all the elements in the subarray is less than k.

    // - Parameters:
    //   - nums: An array of positive integers.
    //   - k: The value k.
    // - Returns: The number of contiguous subarrays.

    // Example 1:
    // Input: nums = [10,5,2,6], k = 100
    // Output: 8
    // Explanation: The 8 subarrays that have product less than 100 are:
    // [10], [5], [2], [6], [10, 5], [5, 2], [2, 6], [5, 2, 6]
    // Note that [10, 5, 2] is not included as the product of 100 is not strictly less than k.

    // Example 2:
    // Input: nums = [1,2,3], k = 0
    // Output: 0

    // Constraints:
    // 1 <= nums.length <= 3 * 10^4
    // 1 <= nums[i] <= 1000
    // 0 <= k <= 10^6

    // - Complexity:
    //   - time: O(n), where n is the length of nums.
    //   - space: O(1), only constant space is used.
    
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        guard k > 1 else { return 0 }
        var ans = 0
        var prod = 1
        var j = 0

        for (i, num) in nums.enumerated() {
            prod *= num
            while prod >= k {
                prod /= nums[j]
                j += 1
            }
            ans += i - j + 1
        }

        return ans
    }

}