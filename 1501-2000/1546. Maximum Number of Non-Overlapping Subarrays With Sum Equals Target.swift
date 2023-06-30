class Solution {

    // Solution by Sergey Leschev

    // 1546. Maximum Number of Non-Overlapping Subarrays With Sum Equals Target
    // Given an array nums and an integer target.
    // Return the maximum number of non-empty non-overlapping subarrays such that the sum of values in each subarray is equal to target.

    // Example 1:
    // Input: nums = [1,1,1,1,1], target = 2
    // Output: 2
    // Explanation: There are 2 non-overlapping subarrays [1,1,1,1,1] with sum equals to target(2).

    // Example 2:
    // Input: nums = [-1,3,5,1,4,2,-9], target = 6
    // Output: 2
    // Explanation: There are 3 subarrays with sum equal to 6.
    // ([5,1], [4,2], [3,5,1,4,2,-9]) but only the first 2 are non-overlapping.

    // Example 3:
    // Input: nums = [-2,6,6,3,5,4,1,2,8], target = 10
    // Output: 3

    // Example 4:
    // Input: nums = [0,0,0], target = 0
    // Output: 3

    // Constraints:
    // 1 <= nums.length <= 10^5
    // -10^4 <= nums[i] <= 10^4
    // 0 <= target <= 10^6

    func maxNonOverlapping(_ nums: [Int], _ target: Int) -> Int {
        var last = 0
        var cnt = 0
        var map = [Int: [Int]]()
        var ans = 0
        var visitedMaxIndex: Int? = nil
        
        map[0] = [-1]

        for num in nums {
            let sum = num + last
            if let indices = map[sum - target] {
                for index in indices {
                    if let i = visitedMaxIndex {
                        if i <= index { ans += 1; visitedMaxIndex = cnt }
                    } else { ans += 1; visitedMaxIndex = cnt }
                }
            }
            map[sum,default: []].append(cnt)
            cnt += 1
            last = sum
        }
        
        return ans
    }

}