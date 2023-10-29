class Solution {

    // Solution by Sergey Leschev
    // 2869. Minimum Operations to Collect Elements

    func minOperations(_ nums: [Int], _ k: Int) -> Int {
        var st = Set<Int>()
        var i = nums.count - 1
        while st.count < k {
            if nums[i] <= k {
                st.insert(nums[i])
            }
            i -= 1
        }
        return nums.count - i - 1
    }
}
