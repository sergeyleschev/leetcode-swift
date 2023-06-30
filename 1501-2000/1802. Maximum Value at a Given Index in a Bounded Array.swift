class Solution {

    // Solution by Sergey Leschev

    // 1802. Maximum Value at a Given Index in a Bounded Array
    // You are given three positive integers: n, index, and maxSum. You want to construct an array nums (0-indexed) that satisfies the following conditions:
    // nums.length == n
    // nums[i] is a positive integer where 0 <= i < n.
    // abs(nums[i] - nums[i+1]) <= 1 where 0 <= i < n-1.
    // The sum of all the elements of nums does not exceed maxSum.
    // nums[index] is maximized.
    // Return nums[index] of the constructed array.
    // Note that abs(x) equals x if x >= 0, and -x otherwise.

    // Example 1:
    // Input: n = 4, index = 2,  maxSum = 6
    // Output: 2
    // Explanation: nums = [1,2,2,1] is one array that satisfies all the conditions.
    // There are no arrays that satisfy all the conditions and have nums[2] == 3, so 2 is the maximum nums[2].

    // Example 2:
    // Input: n = 6, index = 1,  maxSum = 10
    // Output: 3

    // Constraints:
    // 1 <= n <= maxSum <= 10^9
    // 0 <= index < n

    func maxValue(_ n: Int, _ index: Int, _ maxSum: Int) -> Int {
        guard n != maxSum else { return 1 }
        var low = 1
        var high = maxSum
        var ans = Int.min

        while low < high {
            let mid = low + (high - low) >> 1
            if check(n, index, maxSum, mid) {
                ans = max(ans, mid)
                low = mid + 1
            } else {
                high = mid - 1
            }
        }

        if check(n, index, maxSum, low) { ans = max(ans, low) }
        return ans
    }
    

    private func check(_ n: Int, _ index: Int,_ maxSum: Int, _ curVal: Int) -> Bool {
        var sum = 0
        
        if curVal < index + 1 { sum += (curVal + 1) * curVal / 2 + index  + 1 - curVal } 
        else { sum += (curVal * 2 - index) * (index + 1) / 2 }

        if curVal < n - index { sum += curVal * (curVal - 1) / 2 + n - index - curVal } 
        else { sum += (curVal * 2 - n + index) * (n - 1 - index) / 2 }
        
        return sum <= maxSum
    }

}