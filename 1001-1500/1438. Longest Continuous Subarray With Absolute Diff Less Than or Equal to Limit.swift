class Solution {

    // Solution @ Sergey Leschev

    // 1438. Longest Continuous Subarray With Absolute Diff Less Than or Equal to Limit
    // Given an array of integers nums and an integer limit, return the size of the longest non-empty subarray such that the absolute difference between any two elements of this subarray is less than or equal to limit.

    // Example 1:
    // Input: nums = [8,2,4,7], limit = 4
    // Output: 2 
    // Explanation: All subarrays are: 
    // [8] with maximum absolute diff |8-8| = 0 <= 4.
    // [8,2] with maximum absolute diff |8-2| = 6 > 4. 
    // [8,2,4] with maximum absolute diff |8-2| = 6 > 4.
    // [8,2,4,7] with maximum absolute diff |8-2| = 6 > 4.
    // [2] with maximum absolute diff |2-2| = 0 <= 4.
    // [2,4] with maximum absolute diff |2-4| = 2 <= 4.
    // [2,4,7] with maximum absolute diff |2-7| = 5 > 4.
    // [4] with maximum absolute diff |4-4| = 0 <= 4.
    // [4,7] with maximum absolute diff |4-7| = 3 <= 4.
    // [7] with maximum absolute diff |7-7| = 0 <= 4. 
    // Therefore, the size of the longest subarray is 2.

    // Example 2:
    // Input: nums = [10,1,2,4,7,2], limit = 5
    // Output: 4 
    // Explanation: The subarray [2,4,7,2] is the longest since the maximum absolute diff is |2-7| = 5 <= 5.

    // Example 3:
    // Input: nums = [4,2,2,2,4,4,2,2], limit = 0
    // Output: 3

    // Constraints:
    // 1 <= nums.length <= 10^5
    // 1 <= nums[i] <= 10^9
    // 0 <= limit <= 10^9

    func longestSubarray(_ nums: [Int], _ limit: Int) -> Int {
        var left = 0, right = 0
        var maxQueue: [Int] = [], minQueue: [Int] = [], ans = 0
        
        while right < nums.count {
            while !minQueue.isEmpty && nums[right] < nums[minQueue.last!] { minQueue.removeLast() }
            minQueue.append(right)
            
            while !maxQueue.isEmpty && nums[right] > nums[maxQueue.last!] { maxQueue.removeLast() }
            maxQueue.append(right)

            while nums[maxQueue.first!] - nums[minQueue.first!] > limit {
                if right == maxQueue.first! {
                    left = minQueue.removeFirst() + 1
                } else if right == minQueue.first! {
                    left = maxQueue.removeFirst() + 1
                }
            }

            ans = max(ans, right - left + 1)
            right += 1
        }
        
        return ans
    }

}