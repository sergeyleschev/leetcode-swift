class Solution {

    // Solution by Sergey Leschev

    // 213. House Robber II
    // You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed. All houses at this place are arranged in a circle. That means the first house is the neighbor of the last one. Meanwhile, adjacent houses have a security system connected, and it will automatically contact the police if two adjacent houses were broken into on the same night.
    // Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.

    // Determines the maximum amount of money you can rob tonight without alerting the police.
    
    // - Parameter nums: A list of non-negative integers representing the amount of money
    //   of each house.
    // - Returns: The maximum amount of money you can rob.

    // Example 1:
    // Input: nums = [2,3,2]
    // Output: 3
    // Explanation: You cannot rob house 1 (money = 2) and then rob house 3 (money = 2), because they are adjacent houses.

    // Example 2:
    // Input: nums = [1,2,3,1]
    // Output: 4
    // Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
    // Total amount you can rob = 1 + 3 = 4.

    // Example 3:
    // Input: nums = [0]
    // Output: 0

    // Constraints:
    // 1 <= nums.length <= 100
    // 0 <= nums[i] <= 1000

    // - Complexity:
    //   - time: O(n), where n is the length of the nums.
    //   - space: O(1), only constant space is used.

    func rob(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        guard nums.count > 1 else { return nums[0] }

        let ans1 = rob(nums, start: 0, end: nums.count - 1)
        let ans2 = rob(nums, start: 1, end: nums.count)

        return max(ans1, ans2)
    }


    private func rob(_ nums: [Int], start: Int, end: Int) -> Int {
        var pre = 0
        var cur = 0

        for i in start..<end {
            let tmp = cur
            cur = max(cur, pre + nums[i])
            pre = tmp
        }

        return cur
    }

}