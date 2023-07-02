class Solution {

    // Solution by Sergey Leschev

    // 503. Next Greater Element II
    // Given a circular integer array nums (i.e., the next element of nums[nums.length - 1] is nums[0]), return the next greater number for every element in nums.
    // The next greater number of a number x is the first greater number to its traversing-order next in the array, which means you could search circularly to find its next greater number. If it doesn't exist, return -1 for this number.

    // Example 1:
    // Input: nums = [1,2,1]
    // Output: [2,-1,2]
    // Explanation: The first 1's next greater number is 2;
    // The number 2 can't find next greater number.
    // The second 1's next greater number needs to search circularly, which is also 2.

    // Example 2:
    // Input: nums = [1,2,3,4,3]
    // Output: [2,3,4,-1,4]

    // Constraints:
    // 1 <= nums.length <= 10^4
    // -10^9 <= nums[i] <= 10^9

    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        var res = [Int]()

        for i in 0..<nums.count {
            var index = i != nums.count - 1 ? i + 1 : 0

            while nums[i] >= nums[index] {
                if i == index { break }
                if index != nums.count - 1 {
                    index += 1
                } else {
                    index = 0
                }

            }
            if i == index {
                res.append(-1)
            } else {
                res.append(nums[index])
            }
        }

        return res
    }

}
