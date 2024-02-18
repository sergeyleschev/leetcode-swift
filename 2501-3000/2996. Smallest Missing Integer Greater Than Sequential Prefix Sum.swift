class Solution {

    // Solution by Sergey Leschev
    // 2996. Smallest Missing Integer Greater Than Sequential Prefix Sum

    // Time complexity: O(N * log(N))
    // Space complexity: O(1)

    func missingInteger(_ nums: [Int]) -> Int {
        var countSum = nums[0]
        var sortedNums = Array(nums)
        sortedNums.sort()

        for i in 1..<nums.count {
            if nums[i - 1] + 1 == nums[i] {
                countSum += nums[i]
            } else {
                break
            }
        }

        for i in 0..<sortedNums.count {
            if countSum == sortedNums[i] {
                countSum += 1
            }
        }
        return countSum
    }
}
