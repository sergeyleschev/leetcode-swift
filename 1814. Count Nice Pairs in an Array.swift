class Solution {

    // 1814. Count Nice Pairs in an Array
    // You are given an array nums that consists of non-negative integers. Let us define rev(x) as the reverse of the non-negative integer x. For example, rev(123) = 321, and rev(120) = 21. A pair of indices (i, j) is nice if it satisfies all of the following conditions:
    // 0 <= i < j < nums.length
    // nums[i] + rev(nums[j]) == nums[j] + rev(nums[i])
    // Return the number of nice pairs of indices. Since that number can be too large, return it modulo 109 + 7.

    // Example 1:
    // Input: nums = [42,11,1,97]
    // Output: 2
    // Explanation: The two pairs are:
    //  - (0,3) : 42 + rev(97) = 42 + 79 = 121, 97 + rev(42) = 97 + 24 = 121.
    //  - (1,2) : 11 + rev(1) = 11 + 1 = 12, 1 + rev(11) = 1 + 11 = 12.

    // Example 2:
    // Input: nums = [13,10,35,24,76]
    // Output: 4

    // Constraints:
    // 1 <= nums.length <= 10^5
    // 0 <= nums[i] <= 10^9

    private let mod = 1_000_000_007


    func countNicePairs(_ nums: [Int]) -> Int {
        var counter = [Int:Int]()
        for num in nums { counter[num - Int(String("\(num)".reversed()))!, default: 0] += 1 }
        var cnt = 0

        for (_, c) in counter {
            guard c > 1 else { continue }
            cnt += ((c - 1) * c / 2) % mod
            cnt %= mod
        }
        return cnt
    }

}