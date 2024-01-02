class Solution {

    // Solution by Sergey Leschev
    // 2909. Minimum Sum of Mountain Triplets II

    func minimumSum(_ nums: [Int]) -> Int {
        var smallestRight = Array(repeating: nums.last!, count: nums.count)

        for i in stride(from: nums.count - 2, through: 0, by: -1) {
            smallestRight[i] = min(smallestRight[i + 1], nums[i])
        }

        var smallestLeft = nums[0]
        var ans = -1

        for i in 1..<nums.count {
            if smallestLeft < nums[i] && smallestRight[i] < nums[i] {
                if ans == -1 {
                    ans = nums[i] + smallestRight[i] + smallestLeft
                } else {
                    ans = min(ans, nums[i] + smallestRight[i] + smallestLeft)
                }
            }
            smallestLeft = min(smallestLeft, nums[i])
        }

        return ans
    }
}
