class Solution {

    // Solution by Sergey Leschev
    // 2913. Subarrays Distinct Element Sum of Squares I

    func sumCounts(_ nums: [Int]) -> Int {
        var ans = 0
        var count = 0

        for i in 0..<nums.count {
            var ump = [Int: Int]()
            count = 0

            for j in i..<nums.count {
                ump[nums[j], default: 0] += 1
                if ump[nums[j]] == 1 {
                    count += 1
                }
                ans += count * count
            }
        }

        return ans
    }
}
