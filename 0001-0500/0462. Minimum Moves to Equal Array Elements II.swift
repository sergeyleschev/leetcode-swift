class Solution {

    // Solution by Sergey Leschev

    // 462. Minimum Moves to Equal Array Elements II
    // Given an integer array nums of size n, return the minimum number of moves required to make all array elements equal.
    // In one move, you can increment or decrement an element of the array by 1.
    // Test cases are designed so that the answer will fit in a 32-bit integer.

    // Example 1:
    // Input: nums = [1,2,3]
    // Output: 2
    // Explanation:
    // Only two moves are needed (remember each move increments or decrements one element):
    // [1,2,3]  =>  [2,2,3]  =>  [2,2,2]

    // Example 2:
    // Input: nums = [1,10,2,9]
    // Output: 16
     
    // Constraints:
    // n == nums.length
    // 1 <= nums.length <= 10^5
    // -10^9 <= nums[i] <= 10^9

    func minMoves2(_ nums: [Int]) -> Int {
        let sortNums = nums.sorted()
        let mid = sortNums[sortNums.count / 2]
        
        return sortNums.reduce(0, { (result, element) -> Int in
            return result + abs(element - mid)
        })
    }
    
}