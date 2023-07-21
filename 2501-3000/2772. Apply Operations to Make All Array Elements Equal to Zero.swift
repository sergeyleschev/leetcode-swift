class Solution {

    // Solution by Sergey Leschev
    // 2772. Apply Operations to Make All Array Elements Equal to Zero
    // Complexity
    // Time: O(n)
    // Space: O(1), needs O(k) if not change the input A

    func checkArray(_ nums: [Int], _ k: Int) -> Bool {
        var nums = nums  // Make a mutable copy of the input array
        var cur = 0
        let n = nums.count

        for i in 0..<n {
            if cur > nums[i] {
                return false
            }
            nums[i] -= cur
            cur += nums[i]
            if i >= k - 1 {
                cur -= nums[i - k + 1]
            }
        }

        return cur == 0
    }
}
