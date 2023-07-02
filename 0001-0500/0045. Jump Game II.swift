class Solution {

    // Solution by Sergey Leschev

    // 45. Jump Game II
    // Given an array of non-negative integers nums, you are initially positioned at the first index of the array.
    // Each element in the array represents your maximum jump length at that position.
    // Your goal is to reach the last index in the minimum number of jumps.
    // You can assume that you can always reach the last index.

    // Example 1:
    // Input: nums = [2,3,1,1,4]
    // Output: 2
    // Explanation: The minimum number of jumps to reach the last index is 2. Jump 1 step from index 0 to 1, then 3 steps to the last index.

    // Example 2:
    // Input: nums = [2,3,0,1,4]
    // Output: 2

    // Constraints:
    // 1 <= nums.length <= 1000
    // 0 <= nums[i] <= 10^5

    func jump(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return 0 }
        var maxIndex: [Int] = [1]

        for i in 0..<nums.count {
            var max = 0

            for j in 0..<maxIndex[i] {
                if j >= nums.count { break }
                let index = j + nums[j] + 1

                max = max > index ? max : index
                if max >= nums.count { return i + 1 }
            }

            maxIndex.append(max)
        }
        return 0
    }

}
