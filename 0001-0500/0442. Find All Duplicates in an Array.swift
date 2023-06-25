class Solution {

    // Solution @ Sergey Leschev

    // 442. Find All Duplicates in an Array
    // Given an integer array nums of length n where all the integers of nums are in the range [1, n] and each integer appears once or twice, return an array of all the integers that appears twice.
    // You must write an algorithm that runs in O(n) time and uses only constant extra space.

    // Finds all the elements that appear twice in an array.

    // - Parameter nums: The array of integers.
    // - Returns: All elements that appear twice.

    // Example 1:
    // Input: nums = [4,3,2,7,8,2,3,1]
    // Output: [2,3]

    // Example 2:
    // Input: nums = [1,1,2]
    // Output: [1]

    // Example 3:
    // Input: nums = [1]
    // Output: []

    // Constraints:
    // n == nums.length
    // 1 <= n <= 10^5
    // 1 <= nums[i] <= n
    // Each element in nums appears once or twice.

    // - Complexity:
    //   - time: O(n), where n is the length of the nums.
    //   - space: O(n), where n is the length of the nums.
    
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var nums = nums
        var ans = [Int]()

        for num in nums {
            if nums[abs(num) - 1] < 0 { ans.append(num) }
            nums[abs(num) - 1] *= -1
        }

        return ans
    }

}