class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1283. Find the Smallest Divisor Given a Threshold
    // Given an array of integers nums and an integer threshold, we will choose a positive integer divisor, divide all the array by it, and sum the division's result. Find the smallest divisor such that the result mentioned above is less than or equal to threshold.
    // Each result of the division is rounded to the nearest integer greater than or equal to that element. (For example: 7/3 = 3 and 10/2 = 5).
    // It is guaranteed that there will be an answer.

    // Finds the smallest divisor such that the result is less than or equal to threshold.

    // - Parameters:
    //   - nums: An array of integers.
    //   - threshold: An integer.
    // - Returns: The smallest divisor.

    // Example 1:
    // Input: nums = [1,2,5,9], threshold = 6
    // Output: 5
    // Explanation: We can get a sum to 17 (1+2+5+9) if the divisor is 1. 
    // If the divisor is 4 we can get a sum of 7 (1+1+2+3) and if the divisor is 5 the sum will be 5 (1+1+1+2). 

    // Example 2:
    // Input: nums = [44,22,33,11,1], threshold = 5
    // Output: 44

    // Example 3:
    // Input: nums = [21212,10101,12121], threshold = 1000000
    // Output: 1

    // Example 4:
    // Input: nums = [2,3,5,7,11], threshold = 11
    // Output: 3

    // Constraints:
    // 1 <= nums.length <= 5 * 10^4
    // 1 <= nums[i] <= 10^6
    // nums.length <= threshold <= 10^6

    // - Complexity:
    //   - time: O(log n), where n is the maximum number in nums.
    //   - space: O(1), only constant space is used.
    
    func smallestDivisor(_ nums: [Int], _ threshold: Int) -> Int {
        var left = 1
        var right = 2

        while computeSum(nums, right) > threshold {
            left = right
            right *= 2
        }

        while left <= right {
            var mid = left + (right - left) / 2
            var num = computeSum(nums, mid)
            if num > threshold {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        return left
    }

    
    private func computeSum(_ nums: [Int], _ x: Int) -> Int {
        var ans = 0
        for num in nums { ans += num / x + (num % x == 0 ? 0 : 1) }
        return ans
    }

}