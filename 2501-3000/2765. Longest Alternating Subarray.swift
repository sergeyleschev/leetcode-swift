class Solution {

    // Solution by Sergey Leschev
    // 2765. Longest Alternating Subarray

    // Time complexity: O(n^2)
    // Space complexity: O(1)

    func alternatingSubarray(_ nums: [Int]) -> Int {
        let n = nums.count
        var res = 0

        for i in 0..<n {
            var j = i + 1
            while j < n && nums[j] == nums[i] + (j - i) % 2 {
                j += 1
            }
            res = max(res, j - i)
        }

        return res > 1 ? res : -1
    }
}
