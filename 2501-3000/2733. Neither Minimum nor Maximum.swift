class Solution {

    // Solution by Sergey Leschev
    // 2733. Neither Minimum nor Maximum

    func findNonMinOrMax(_ nums: [Int]) -> Int {
        if nums.count < 3 {
            return -1
        }

        let a = min(nums[0], nums[1])
        let b = max(nums[0], nums[1])
        let c = nums[2]

        if c < b && c > a {
            return c
        }
        if c < a {
            return a
        }
        if c > b {
            return b
        }

        return -1
    }
}
