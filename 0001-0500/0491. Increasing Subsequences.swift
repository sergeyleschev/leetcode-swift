class Solution {

    // Solution by Sergey Leschev

    // 491. Increasing Subsequences
    // Given an integer array nums, return all the different possible increasing subsequences of the given array with at least two elements. You may return the answer in any order.
    // The given array may contain duplicates, and two equal integers should also be considered a special case of increasing sequence.

    // Example 1:
    // Input: nums = [4,6,7,7]
    // Output: [[4,6],[4,6,7],[4,6,7,7],[4,7],[4,7,7],[6,7],[6,7,7],[7,7]]

    // Example 2:
    // Input: nums = [4,4,3,2,1]
    // Output: [[4,4]]

    // Constraints:
    // 1 <= nums.length <= 15
    // -100 <= nums[i] <= 100

    func findSubsequences(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 1 else { return [] }
        var dp = Array(repeating: Set<[Int]>(), count: nums.count)

        dp[0] = [[nums.first!]]
        for i in 1..<nums.count {
            let num = nums[i]
            for arr in dp[i - 1] {
                if arr.last! <= num {
                    dp[i].insert(arr + [num])
                }
                dp[i].insert(arr)
            }
            dp[i].insert([num])
        }

        let ans = dp.last?.filter { $0.count > 1 } ?? []
        return ans
    }

}
