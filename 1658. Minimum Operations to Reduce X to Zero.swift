class Solution {

    // 1658. Minimum Operations to Reduce X to Zero
    // You are given an integer array nums and an integer x. In one operation, you can either remove the leftmost or the rightmost element from the array nums and subtract its value from x. Note that this modifies the array for future operations.

    // Return the minimum number of operations to reduce x to exactly 0 if it is possible, otherwise, return -1.
     
    // Example 1:
    // Input: nums = [1,1,4,2,3], x = 5
    // Output: 2
    // Explanation: The optimal solution is to remove the last two elements to reduce x to zero.

    // Example 2:
    // Input: nums = [5,6,7,8,9], x = 4
    // Output: -1

    // Example 3:
    // Input: nums = [3,2,20,1,1,3], x = 10
    // Output: 5
    // Explanation: The optimal solution is to remove the last three elements and the first two elements (5 operations in total) to reduce x to zero.

    // Constraints:
    // 1 <= nums.length <= 10^5
    // 1 <= nums[i] <= 10^4
    // 1 <= x <= 10^9

    // - Parameters:
    //   - nums: An integer array.
    //   - x: An integer.
    // - Returns: The minimum number of operations to reduce x to exactly 0 if it's possible, otherwise returns -1.

    // - Complexity:
    //   - time: O(n), where n is the length of nums.
    //   - space: O(1), only constant space is used.
    
    func minOperations(_ nums: [Int], _ x: Int) -> Int {
        var sum = nums.reduce(0, +)
        let n = nums.count
        var ans = Int.max
        var i = 0
        
        for j in 0..<n {
            sum -= nums[j]
            
            while sum < x, i <= j {
                sum += nums[i]
                i += 1
            }
            
            guard sum == x else { continue }
            ans = min(ans, (n - 1 - j) + i)
        }
        
        return ans != Int.max ? ans : -1
    }

}