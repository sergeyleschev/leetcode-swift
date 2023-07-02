class Solution {

    // Solution by Sergey Leschev

    // 414. Third Maximum Number
    // Given integer array nums, return the third maximum number in this array. If the third maximum does not exist, return the maximum number.

    // Finds the third maximum number in the given array. If it does not exist, finds the maximum number.

    // - Parameter nums: A non-empty array of integers.
    // - Returns: The third maximum number in the given array, if it does not exist, returns the maximum number.

    // Example 1:
    // Input: nums = [3,2,1]
    // Output: 1
    // Explanation: The third maximum is 1.

    // Example 2:
    // Input: nums = [1,2]
    // Output: 2
    // Explanation: The third maximum does not exist, so the maximum (2) is returned instead.

    // Example 3:
    // Input: nums = [2,2,3,1]
    // Output: 1
    // Explanation: Note that the third maximum here means the third maximum distinct number.
    // Both numbers with value 2 are both considered as second maximum.

    // Constraints:
    // 1 <= nums.length <= 10^4
    // -2^31 <= nums[i] <= 2^31 - 1

    // Follow up: Can you find an O(n) solution?

    // - Complexity:
    //   - time: O(n), where n is the length of nums.
    //   - space: O(1), only constant space is used.

    func thirdMax(_ nums: [Int]) -> Int {
        var top3 = Set<Int>()

        for num in nums {
            top3.insert(num)
            guard top3.count > 3, let min = top3.min() else { continue }
            top3.remove(min)
        }

        guard top3.count == 3 else {
            return top3.max() ?? -1
        }

        return top3.min() ?? -1
    }

}
