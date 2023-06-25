class Solution {

    // Solution @ Sergey Leschev

    // 1296. Divide Array in Sets of K Consecutive Numbers
    // Given an array of integers nums and a positive integer k, find whether it's possible to divide this array into sets of k consecutive numbers
    // Return True if it is possible. Otherwise, return False.

    // Example 1:
    // Input: nums = [1,2,3,3,4,4,5,6], k = 4
    // Output: true
    // Explanation: Array can be divided into [1,2,3,4] and [3,4,5,6].

    // Example 2:

    // Input: nums = [3,2,1,2,3,4,3,4,5,9,10,11], k = 3
    // Output: true
    // Explanation: Array can be divided into [1,2,3] , [2,3,4] , [3,4,5] and [9,10,11].

    // Example 3:
    // Input: nums = [3,3,2,2,1,1], k = 3
    // Output: true

    // Example 4:
    // Input: nums = [1,2,3,4], k = 3
    // Output: false
    // Explanation: Each array should be divided in subarrays of size 3.

    // Constraints:
    // 1 <= k <= nums.length <= 10^5
    // 1 <= nums[i] <= 10^9

    func isPossibleDivide(_ nums: [Int], _ k: Int) -> Bool {
        var counter: [Int: Int] = [:]

        nums.forEach { num in counter[num, default: 0] += 1 }
        let sortedKeys = counter.keys.sorted()
        
        for key in sortedKeys {
            if counter[key] ?? 0 > 0 {
                let minus = counter[key]
                for i in key..<(key + k) {
                    if counter[i] == nil || counter[i]! < minus! { return false }
                    counter[i]! -= minus!
                }
            }
        }
        
        return true
    }

}