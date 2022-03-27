class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 312. Burst Balloons
    // You are given n balloons, indexed from 0 to n - 1. Each balloon is painted with a number on it represented by an array nums. You are asked to burst all the balloons.
    // If you burst the ith balloon, you will get nums[i - 1] * nums[i] * nums[i + 1] coins. If i - 1 or i + 1 goes out of bounds of the array, then treat it as if there is a balloon with a 1 painted on it.
    // Return the maximum coins you can collect by bursting the balloons wisely.

    // Finds the maximum coins you can collect by bursting the balloons wisely.

    // - Parameter nums: An array of balloons.
    // - Returns: The maximum coins you can collect.

    // Example 1:
    // Input: nums = [3,1,5,8]
    // Output: 167
    // Explanation:
    // nums = [3,1,5,8] --> [3,5,8] --> [3,8] --> [8] --> []
    // coins =  3*1*5    +   3*5*8   +  1*3*8  + 1*8*1 = 167

    // Example 2:
    // Input: nums = [1,5]
    // Output: 10

    // Constraints:
    // n == nums.length
    // 1 <= n <= 500
    // 0 <= nums[i] <= 100

    // - Complexity:
    //   - time: O(n^3), where n is the number of balloons.
    //   - space: O(n^2), where n is the number of balloons.

    func maxCoins(_ nums: [Int]) -> Int {
        let n = nums.count
        var newNums = [Int]()
        newNums.append(1)
        for i in 0..<n { newNums.append(nums[i]) }
        newNums.append(1)
        
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 2), count: n + 2)
        return maxCoins(&dp, newNums, 0, n + 1)
    }
    

    private func maxCoins(_ dp: inout [[Int]], _ nums: [Int], _ left: Int, _ right: Int) -> Int {
        guard left + 1 != right else { return 0 }
        guard dp[left][right] == 0 else { return dp[left][right] }
        var ans = 0
        
        for i in (left + 1)..<right {
            let L = maxCoins(&dp, nums, left, i)
            let R = maxCoins(&dp, nums, i, right)
            ans = max(ans, nums[left] * nums[i] * nums[right] + L + R)
        }
        
        dp[left][right] = ans
        return ans
    }

}