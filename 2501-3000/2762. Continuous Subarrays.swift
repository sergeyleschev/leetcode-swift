class Solution {

    // Solution by Sergey Leschev
    // 2762. Continuous Subarrays

    func continuousSubarrays(_ nums: [Int]) -> Int {
        var l = 0
        var r = 0
        var j = 0
        var ans: Int64 = 0

        for i in 0..<nums.count {
            if i == 0 {
                ans += 1
                l = nums[i] - 2
                r = nums[i] + 2
            } else if nums[i] >= l && nums[i] <= r {
                l = max(l, nums[i] - 2)
                r = min(r, nums[i] + 2)
                ans += Int64(i - j + 1)
            } else {
                j = i - 1
                l = nums[i] - 2
                r = nums[i] + 2
                while nums[j] >= nums[i] - 2 && nums[j] <= nums[i] + 2 {
                    l = max(l, nums[j] - 2)
                    r = min(r, nums[j] + 2)
                    j -= 1
                }
                j += 1
                ans += Int64(i - j + 1)
            }
        }

        return Int(ans)
    }
}
