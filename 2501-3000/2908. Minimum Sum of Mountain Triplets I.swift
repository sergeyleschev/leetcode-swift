class Solution {

    // Solution by Sergey Leschev
    // 2908. Minimum Sum of Mountain Triplets I

    func minimumSum(_ nums: [Int]) -> Int {
        let n = nums.count

        var leftMin = [Int](repeating: 0, count: n)
        leftMin[0] = nums[0]
        for i in 1..<n {
            leftMin[i] = min(leftMin[i - 1], nums[i])
        }

        var rightMin = [Int](repeating: 0, count: n)
        rightMin[n - 1] = nums[n - 1]
        for i in (0..<n - 1).reversed() {
            rightMin[i] = min(rightMin[i + 1], nums[i])
        }

        var ans = Int.max

        for i in 1..<n - 1 {
            if nums[i] > leftMin[i - 1] && nums[i] > rightMin[i + 1] {
                ans = min(ans, leftMin[i - 1] + nums[i] + rightMin[i + 1])
            }
        }

        return ans == Int.max ? -1 : ans
    }
}
