class Solution {

    // Solution by Sergey Leschev
    // 2786. Visit Array Positions to Maximize Score

    func maxScore(_ nums: [Int], _ x: Int) -> Int {
        var eve = nums[0] - (nums[0] % 2 == 1 ? x : 0)
        var odd = nums[0] - (nums[0] % 2 == 1 ? 0 : x)

        for i in 1..<nums.count {
            if nums[i] % 2 == 1 {
                odd = nums[i] + max(odd, eve - x)
            } else {
                eve = nums[i] + max(eve, odd - x)
            }
        }

        return max(eve, odd)
    }
}
