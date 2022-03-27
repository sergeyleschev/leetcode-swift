class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 525. Contiguous Array
    // Given a binary array nums, return the maximum length of a contiguous subarray with an equal number of 0 and 1.

    // Example 1:
    // Input: nums = [0,1]
    // Output: 2
    // Explanation: [0, 1] is the longest contiguous subarray with an equal number of 0 and 1.

    // Example 2:
    // Input: nums = [0,1,0]
    // Output: 2
    // Explanation: [0, 1] (or [1, 0]) is a longest contiguous subarray with equal number of 0 and 1.

    // Constraints:
    // 1 <= nums.length <= 10^5
    // nums[i] is either 0 or 1.

    func findMaxLength(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var maxLen = 0, count = 0
        var dict = [Int: Int]()
        dict[0] = -1

        for i in 0..<nums.count {
            count += nums[i] == 1 ? 1 : -1
            if let temp = dict[count] {
                maxLen = max(maxLen, i - temp)
            } else {
                dict[count] = i
            }
        }
        
        return maxLen
    }
    
}