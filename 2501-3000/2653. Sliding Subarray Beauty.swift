class Solution {

    // Solution by Sergey Leschev
    // 2653. Sliding Subarray Beauty
    // Time complexity: O(n * 50)
    // Space complexity: O(n - k + 1 + 50)

    func getSubarrayBeauty(_ nums: [Int], _ k: Int, _ x: Int) -> [Int] {
        var counter = [Int](repeating: 0, count: 50)
        var ans = [Int](repeating: 0, count: nums.count - k + 1)

        for i in 0..<nums.count {
            if nums[i] < 0 {
                counter[nums[i] + 50] += 1
            }

            if i - k >= 0 && nums[i - k] < 0 {
                counter[nums[i - k] + 50] -= 1
            }

            if i - k + 1 < 0 {
                continue
            }

            var count = 0
            for j in 0..<50 {
                count += counter[j]
                if count >= x {
                    ans[i - k + 1] = j - 50
                    break
                }
            }
        }

        return ans
    }
}
