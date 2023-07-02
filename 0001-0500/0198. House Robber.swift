class Solution {

    // Solution by Sergey Leschev

    // 198. House Robber
    // You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security systems connected and it will automatically contact the police if two adjacent houses were broken into on the same night.
    // Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.

    // Determines the maximum amount of money you can rob tonight without alerting the police.

    // - Parameter nums: A list of non-negative integers representing the amount of money
    //   of each house.
    // - Returns: The maximum amount of money you can rob.

    // Example 1:
    // Input: nums = [1,2,3,1]
    // Output: 4
    // Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
    // Total amount you can rob = 1 + 3 = 4.

    // Example 2:
    // Input: nums = [2,7,9,3,1]
    // Output: 12
    // Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
    // Total amount you can rob = 2 + 9 + 1 = 12.

    // Constraints:
    // 1 <= nums.length <= 100
    // 0 <= nums[i] <= 400

    // - Complexity:
    //   - time: O(n), where n is the length of the nums.
    //   - space: O(1), only constant space is used.

    func rob(_ nums: [Int]) -> Int {
        var prev = 0
        var ans = 0

        for num in nums {
            let tmp = ans
            ans = max(prev + num, ans)
            prev = tmp
        }

        return ans
    }

}
