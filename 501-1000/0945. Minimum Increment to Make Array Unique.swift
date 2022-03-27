class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 945. Minimum Increment to Make Array Unique
    // Given an array of integers nums, a move consists of choosing any nums[i], and incrementing it by 1.
    // Return the least number of moves to make every value in nums unique.

    // Example 1:
    // Input: nums = [1,2,2]
    // Output: 1
    // Explanation:  After 1 move, the array could be [1, 2, 3].

    // Example 2:
    // Input: nums = [3,2,1,2,1,7]
    // Output: 6
    // Explanation:  After 6 moves, the array could be [3, 4, 1, 2, 5, 7].
    // It can be shown with 5 or less moves that it is impossible for the array to have all unique values.

    // Note:
    // 0 <= nums.length <= 40000
    // 0 <= nums[i] < 40000

    func minIncrementForUnique(_ A: [Int]) -> Int {
        if A.isEmpty { return 0 }
        var sortedArr = A.sorted(by: <)
        var res = 0
        
        for i in 1..<sortedArr.count {
            let pre = sortedArr[i - 1]
            let cur = sortedArr[i]
            if pre >= cur {
                res += pre - cur + 1
                sortedArr[i] = pre + 1
            }
        }
        
        return res
    }
    
}