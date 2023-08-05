class Solution {

    // Solution by Sergey Leschev
    // 2789. Largest Element in an Array after Merge Operations
    
    // Time complexity: O(N)
    // Space complexity: O(1)

    func maxArrayValue(_ nums: [Int]) -> Int {
        var ans = nums[nums.count - 1]
        var sum = nums[nums.count - 1]

        for i in stride(from: nums.count - 2, through: 0, by: -1) {
            if nums[i] <= sum {
                sum += nums[i]
            } else {
                sum = nums[i]
            }

            ans = max(ans, sum)
        }

        return ans
    }
}
