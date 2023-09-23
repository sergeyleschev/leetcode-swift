class Solution {

    // Solution by Sergey Leschev
    // 2862. Maximum Element-Sum of a Complete Subset of Indices

    // Time complexity: O(n)
    // Space complexity: O(n)

    func maximumSum(_ nums: [Int]) -> Int {
        var count = [Int: Int]()

        for i in 0..<nums.count {
            var x = i + 1
            var v = 2
            while v * v <= x {
                while x % (v * v) == 0 {
                    x /= v * v
                }
                v += 1
            }

            if count[x] != nil {
                count[x]! += nums[i]
            } else {
                count[x] = nums[i]
            }
        }

        var res = 0
        for value in count.values {
            res = max(res, value)
        }

        return res
    }
}
