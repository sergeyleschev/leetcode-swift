class Solution {

    // 976. Largest Perimeter Triangle
    // Given an integer array nums, return the largest perimeter of a triangle with a non-zero area, formed from three of these lengths. If it is impossible to form any triangle of a non-zero area, return 0.

    // Example 1:
    // Input: nums = [2,1,2]
    // Output: 5

    // Example 2:
    // Input: nums = [1,2,1]
    // Output: 0

    // Example 3:
    // Input: nums = [3,2,3,4]
    // Output: 10

    // Example 4:
    // Input: nums = [3,6,2,3]
    // Output: 8

    // Constraints:
    // 3 <= nums.length <= 10^4
    // 1 <= nums[i] <= 10^6

    func largestPerimeter(_ A: [Int]) -> Int {
        var A = A.sorted(by: >)
        
        for i in 0..<A.count - 2 {
            let a = A[i]
            let b = A[i + 1]
            let c = A[i + 2]
            if a < b + c {
                return a + b + c
            }
        }
        
        return 0
    }
    
}