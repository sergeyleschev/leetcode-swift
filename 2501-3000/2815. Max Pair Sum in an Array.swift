class Solution {

    // Solution by Sergey Leschev
    // 2815. Max Pair Sum in an Array

    // Approach
    // While a quadratic solution might be acceptable, it may not be the most optimal approach
    // for interview scenarios where efficiency is crucial.
    // For each number 'num' in the array, we calculate its maximum digit 'maxDigit'.
    // This computation takes O(log m) time, where 'm' is the maximum value within 'num'.
    // To enhance the solution, we utilize a 'maxNum' array to keep track
    // of the maximum number associated with each encountered maximum digit.
    // When we identify a pair such that 'maxNum[maxDigit]' is not zero,
    // we recognize it as a potential maximum sum pair for that specific digit.
    // This strategy ensures that we always consider the highest possible pair sum
    // for a given maximum digit, leading to a more optimized solution.

    // Complexity: O(n log m)

    func maxSum(_ nums: [Int]) -> Int {
        var res = -1
        var maxNum = [Int](repeating: 0, count: 10)

        for num in nums {
            var maxDigit = 0
            var v = num
            while v > 0 {
                maxDigit = max(maxDigit, v % 10)
                v /= 10
            }

            if maxNum[maxDigit] != 0 {
                res = max(res, maxNum[maxDigit] + num)
            }

            maxNum[maxDigit] = max(maxNum[maxDigit], num)
        }

        return res
    }
}
