class Solution {

    // Solution by Sergey Leschev
    // 2962. Count Subarrays Where Max Element Appears at Least K Times

    // Sliding Window
    // Time Complexity: O(n)
    // Space Complexity: O(1)

    func countSubarrays(_ nums: [Int], _ k: Int) -> Int {
        let maxElement = nums.max()!
        let n = nums.count
        var cur = 0
        var i = 0
        var res: Int64 = 0

        for j in 0..<n {
            cur += (nums[j] == maxElement) ? 1 : 0
            while cur >= k {
                cur -= (nums[i] == maxElement) ? 1 : 0
                i += 1
            }
            res += Int64(i)
        }

        return Int(res)
    }
}
