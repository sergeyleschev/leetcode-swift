class Solution {

    // Solution by Sergey Leschev
    // 2760. Longest Even Odd Subarray With Threshold
    // Sliding window

    func longestAlternatingSubarray(_ nums: [Int], _ threshold: Int) -> Int {
        var ans = 0
        var i = 0
        var last = Int.max

        while i < nums.count {
            if nums[i] > threshold || (i > 0 && (nums[i] % 2) == (nums[i - 1] % 2)) {
                ans = max(ans, i - last)
                last = Int.max
            }
            if last == Int.max && nums[i] <= threshold && nums[i] % 2 == 0 {
                last = i
            }
            i += 1
        }
        ans = max(ans, i - last)
        return ans
    }
}
