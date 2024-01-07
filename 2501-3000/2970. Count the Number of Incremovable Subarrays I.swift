class Solution {

    // Solution by Sergey Leschev
    // 2970. Count the Number of Incremovable Subarrays I

    func incremovableSubarrayCount(_ nums: [Int]) -> Int {
        var ans = 0

        for i in 0..<nums.count {
            for j in i..<nums.count {
                var last = -1
                var flag = true

                for k in 0..<nums.count {
                    if k >= i && k <= j {
                        continue
                    }

                    if last >= nums[k] {
                        flag = false
                        break
                    }

                    last = nums[k]
                }

                if flag {
                    ans += 1
                }
            }
        }

        return ans
    }
}
