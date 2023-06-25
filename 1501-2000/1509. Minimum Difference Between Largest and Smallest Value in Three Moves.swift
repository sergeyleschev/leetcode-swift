class Solution {

    // Solution @ Sergey Leschev

    // 1509. Minimum Difference Between Largest and Smallest Value in Three Moves
    // Given an array nums, you are allowed to choose one element of nums and change it by any value in one move.

    // Return the minimum difference between the largest and smallest value of nums after perfoming at most 3 moves. 

    // Example 1:
    // Input: nums = [5,3,2,4]
    // Output: 0
    // Explanation: Change the array [5,3,2,4] to [2,2,2,2].
    // The difference between the maximum and minimum is 2-2 = 0.

    // Example 2:
    // Input: nums = [1,5,0,10,14]
    // Output: 1
    // Explanation: Change the array [1,5,0,10,14] to [1,1,0,1,1]. 
    // The difference between the maximum and minimum is 1-0 = 1.

    // Example 3:
    // Input: nums = [6,6,0,1,1,4,6]
    // Output: 2

    // Example 4:
    // Input: nums = [1,5,6,14,15]
    // Output: 1

    // Constraints:
    // 1 <= nums.length <= 10^5
    // -10^9 <= nums[i] <= 10^9

    func minDifference(_ nums: [Int]) -> Int {
        guard nums.count > 4 else { return 0 }
        let sortedNumbers = nums.sorted()
        let n = nums.count
        var ans = Int.max

        for i in 0...3 { ans = min(ans, sortedNumbers[n - 4 + i] - sortedNumbers[i]) }
        return ans
    }
    
}