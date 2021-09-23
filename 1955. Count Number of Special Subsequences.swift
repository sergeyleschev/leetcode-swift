class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1955. Count Number of Special Subsequences
    // A sequence is special if it consists of a positive number of 0s, followed by a positive number of 1s, then a positive number of 2s.
    // For example, [0,1,2] and [0,0,1,1,1,2] are special.
    // In contrast, [2,1,0], [1], and [0,1,2,0] are not special.
    // Given an array nums (consisting of only integers 0, 1, and 2), return the number of different subsequences that are special. Since the answer may be very large, return it modulo 109 + 7.
    // A subsequence of an array is a sequence that can be derived from the array by deleting some or no elements without changing the order of the remaining elements. Two subsequences are different if the set of indices chosen are different.

    // Example 1:
    // Input: nums = [0,1,2,2]
    // Output: 3
    // Explanation: The special subsequences are [0,1,2,2], [0,1,2,2], and [0,1,2,2].

    // Example 2:
    // Input: nums = [2,2,0,0]
    // Output: 0
    // Explanation: There are no special subsequences in [2,2,0,0].

    // Example 3:
    // Input: nums = [0,1,2,0,1,2]
    // Output: 7
    // Explanation: The special subsequences are:
    // - [0,1,2,0,1,2]
    // - [0,1,2,0,1,2]
    // - [0,1,2,0,1,2]
    // - [0,1,2,0,1,2]
    // - [0,1,2,0,1,2]
    // - [0,1,2,0,1,2]
    // - [0,1,2,0,1,2]

    // Constraints:
    // 1 <= nums.length <= 10^5
    // 0 <= nums[i] <= 2

    typealias Counter = (zero: Int, one: Int, two: Int)


    private let mod = 1_000_000_007


    func countSpecialSubsequences(_ nums: [Int]) -> Int {
        var counter: Counter = (0, 0, 0)

        for num in nums {
            var newCounter = counter

            if num == 0 { newCounter.zero = (counter.zero * 2 + 1) % mod } 
            else if num == 1 { newCounter.one = (counter.one * 2 + newCounter.zero) % mod } 
            else { newCounter.two = (counter.one + counter.two * 2) % mod }
            
            counter = newCounter
        }
        return counter.two
    }
    
}