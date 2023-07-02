class Solution {

    // Solution by Sergey Leschev

    // 1679. Max Number of K-Sum Pairs
    // You are given an integer array nums and an integer k.
    // In one operation, you can pick two numbers from the array whose sum equals k and remove them from the array.

    // Return the maximum number of operations you can perform on the array.

    // - Parameters:
    //   - nums: An integer array.
    //   - k: An integer.
    // - Returns: The maximum number of operations.

    // Example 1:
    // Input: nums = [1,2,3,4], k = 5
    // Output: 2
    // Explanation: Starting with nums = [1,2,3,4]:
    // - Remove numbers 1 and 4, then nums = [2,3]
    // - Remove numbers 2 and 3, then nums = []
    // There are no more pairs that sum up to 5, hence a total of 2 operations.

    // Example 2:
    // Input: nums = [3,1,3,4,3], k = 6
    // Output: 1
    // Explanation: Starting with nums = [3,1,3,4,3]:
    // - Remove the first two 3's, then nums = [1,4,3]
    // There are no more pairs that sum up to 6, hence a total of 1 operation.

    // Constraints:
    // 1 <= nums.length <= 10^5
    // 1 <= nums[i] <= 10^9
    // 1 <= k <= 10^9

    // - Complexity:
    //   - time: O(n), where n is the length of the nums.
    //   - space: O(n), where n is the length of the nums.

    func maxOperations(_ nums: [Int], _ k: Int) -> Int {
        var dict = [Int: Int]()
        var ans = 0

        for num in nums {
            if let val = dict[k - num] {
                dict[k - num] = val > 1 ? val - 1 : nil
                ans += 1
            } else {
                dict[num, default: 0] += 1
            }
        }

        return ans
    }

}
