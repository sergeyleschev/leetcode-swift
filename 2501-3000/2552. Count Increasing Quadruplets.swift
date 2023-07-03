class Solution {

    // Solution by Sergey Leschev
    // 2552. Count Increasing Quadruplets

    // Time complexity: O(n^2)
    // Space complexity: O(n)

    func countQuadruplets(_ nums: [Int]) -> Int {
        let n = nums.count
        var cnt = Array(repeating: 0, count: n)
        var ans = 0

        for j in 0..<n {
            var prevSmall = 0

            for i in 0..<j {
                if nums[j] > nums[i] {
                    prevSmall += 1
                    ans += cnt[i]
                } else if nums[j] < nums[i] {
                    cnt[i] += prevSmall
                }
            }
        }

        return ans
    }
}
