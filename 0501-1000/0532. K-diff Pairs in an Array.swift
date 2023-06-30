class Solution {

    // Solution by Sergey Leschev

    // 532. K-diff Pairs in an Array
    // Given an array of integers nums and an integer k, return the number of unique k-diff pairs in the array.
    // A k-diff pair is an integer pair (nums[i], nums[j]), where the following are true:
    // 0 <= i < j < nums.length
    // |nums[i] - nums[j]| == k
    // Notice that |val| denotes the absolute value of val.

    // Calculates the number of unique `k`-diff pairs in an array.

    // - Parameters:
    //   - nums: The array of integers.
    //   - k: An integer.
    // - Returns: The number of unique `k`-diff pairs.

    // Example 1:
    // Input: nums = [3,1,4,1,5], k = 2
    // Output: 2
    // Explanation: There are two 2-diff pairs in the array, (1, 3) and (3, 5).
    // Although we have two 1s in the input, we should only return the number of unique pairs.

    // Example 2:
    // Input: nums = [1,2,3,4,5], k = 1
    // Output: 4
    // Explanation: There are four 1-diff pairs in the array, (1, 2), (2, 3), (3, 4) and (4, 5).

    // Example 3:
    // Input: nums = [1,3,1,5,4], k = 0
    // Output: 1
    // Explanation: There is one 0-diff pair in the array, (1, 1).

    // Example 4:
    // Input: nums = [1,2,4,4,3,3,0,9,2,3], k = 3
    // Output: 2

    // Example 5:
    // Input: nums = [-1,-2,-3], k = 1
    // Output: 2
     
    // Constraints:
    // 1 <= nums.length <= 10^4
    // -10^7 <= nums[i] <= 10^7
    // 0 <= k <= 10^7

    // - Complexity:
    //   - time: O(n), where n is the length of the `nums`.
    //   - space: O(n), where n is the length of the `nums`.
    
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        var dict = [Int: Int]()
        var ans = 0

        for num in nums { dict[num, default: 0] += 1 }

        for (_, el) in dict.enumerated() {
            guard (k == 0 && el.value > 1) || (k > 0 && dict.keys.contains(el.key + k)) else { continue }
            ans += 1
        }

        return ans
    }

}