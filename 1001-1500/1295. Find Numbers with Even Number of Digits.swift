class Solution {

    // Solution by Sergey Leschev

    // 1295. Find Numbers with Even Number of Digits
    // Given an array nums of integers, return how many of them contain an even number of digits.

    // Finds how many numbers in a given array contain an even number of digits.

    // - Parameter nums: The array of integers.
    // - Returns: How many numbers contain an even number of digits.

    // Example 1:
    // Input: nums = [12,345,2,6,7896]
    // Output: 2
    // Explanation: 
    // 12 contains 2 digits (even number of digits). 
    // 345 contains 3 digits (odd number of digits). 
    // 2 contains 1 digit (odd number of digits). 
    // 6 contains 1 digit (odd number of digits). 
    // 7896 contains 4 digits (even number of digits). 
    // Therefore only 12 and 7896 contain an even number of digits.

    // Example 2:
    // Input: nums = [555,901,482,1771]
    // Output: 1 
    // Explanation: 
    // Only 1771 contains an even number of digits.

    // Constraints:
    // 1 <= nums.length <= 500
    // 1 <= nums[i] <= 10^5

    // - Complexity:
    //   - time: O(n), where n is the length of nums.
    //   - space: O(1), only constant space is used.
    
    func findNumbers(_ nums: [Int]) -> Int {
        var ans = 0
        for num in nums { ans += String(num).count % 2 == 0 ? 1 : 0 }
        return ans
    }

}