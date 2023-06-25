class Solution {

    // Solution @ Sergey Leschev

    // 898. Bitwise ORs of Subarrays
    // We have an array arr of non-negative integers.
    // For every (contiguous) subarray sub = [arr[i], arr[i + 1], ..., arr[j]] (with i <= j), we take the bitwise OR of all the elements in sub, obtaining a result arr[i] | arr[i + 1] | ... | arr[j].
    // Return the number of possible results. Results that occur more than once are only counted once in the final answer

    // Example 1:
    // Input: arr = [0]
    // Output: 1
    // Explanation: There is only one possible result: 0.

    // Example 2:
    // Input: arr = [1,1,2]
    // Output: 3
    // Explanation: The possible subarrays are [1], [1], [2], [1, 1], [1, 2], [1, 1, 2].
    // These yield the results 1, 1, 2, 1, 3, 3.
    // There are 3 unique values, so the answer is 3.

    // Example 3:
    // Input: arr = [1,2,4]
    // Output: 6
    // Explanation: The possible results are 1, 2, 3, 4, 6, and 7.

    // Constraints:
    // 1 <= nums.length <= 5 * 10^4
    // 0 <= nums[i] <= 10^9

    func subarrayBitwiseORs(_ A: [Int]) -> Int {
        let N = A.count
        guard N > 1 else { return N }
        var existed = Set<Int>()
        var last = Set<Int>()

        for num in A {
            var new = Set<Int>()
            new.insert(num)
            for ele in last { new.insert(ele | num) }
            last = new
            for ele in new where !existed.contains(ele) { existed.insert(ele) }
        }

        return existed.count
    }
    
}