class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1524. Number of Sub-arrays With Odd Sum
    // Given an array of integers arr. Return the number of sub-arrays with odd sum.
    // As the answer may grow large, the answer must be computed modulo 10^9 + 7.

    // Example 1:
    // Input: arr = [1,3,5]
    // Output: 4
    // Explanation: All sub-arrays are [[1],[1,3],[1,3,5],[3],[3,5],[5]]
    // All sub-arrays sum are [1,4,9,3,8,5].
    // Odd sums are [1,9,3,5] so the answer is 4.

    // Example 2:
    // Input: arr = [2,4,6]
    // Output: 0
    // Explanation: All sub-arrays are [[2],[2,4],[2,4,6],[4],[4,6],[6]]
    // All sub-arrays sum are [2,6,12,4,10,6].
    // All sub-arrays have even sum and the answer is 0.

    // Example 3:
    // Input: arr = [1,2,3,4,5,6,7]
    // Output: 16

    // Example 4:
    // Input: arr = [100,100,99,99]
    // Output: 4

    // Example 5:
    // Input: arr = [7]
    // Output: 1

    // Constraints:
    // 1 <= arr.length <= 10^5
    // 1 <= arr[i] <= 100

    func numOfSubarrays(_ arr: [Int]) -> Int {
        var ans = 0
        var odd = 0
        var even =  1
        var curSum = 0
        
        for num in  arr{
            curSum += num
            curSum %= 2
            
            if curSum == 1 {
                ans += even
                odd += 1
            }
            
            if curSum == 0 {
                ans += odd
                even += 1
            }

            ans %= 1_000_000_007
            
        }
        
        return ans
    }

}