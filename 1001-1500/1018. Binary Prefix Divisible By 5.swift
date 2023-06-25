class Solution {

    // Solution @ Sergey Leschev

    // 1018. Binary Prefix Divisible By 5
    // You are given a binary array nums (0-indexed).
    // We define xi as the number whose binary representation is the subarray nums[0..i] (from most-significant-bit to least-significant-bit).
    // For example, if nums = [1,0,1], then x0 = 1, x1 = 2, and x2 = 5.
    // Return an array of booleans answer where answer[i] is true if xi is divisible by 5.

    // Example 1:
    // Input: nums = [0,1,1]
    // Output: [true,false,false]
    // Explanation: The input numbers in binary are 0, 01, 011; which are 0, 1, and 3 in base-10.
    // Only the first number is divisible by 5, so answer[0] is true.

    // Example 2:
    // Input: nums = [1,1,1]
    // Output: [false,false,false]

    // Example 3:
    // Input: nums = [0,1,1,1,1,1]
    // Output: [true,false,false,false,true,false]

    // Example 4:
    // Input: nums = [1,1,1,0,1]
    // Output: [false,false,false,false,false]

    // Constraints:
    // 1 <= nums.length <= 10^5
    // nums[i] is 0 or 1.

    func prefixesDivBy5(_ A: [Int]) -> [Bool] {
        var ans = [Bool]()
        var leftover = 0
        
        for num in A {
            leftover = (leftover * 2 + num) % 5
            ans.append(leftover == 0)
        }
        
        return ans
    }
    
}