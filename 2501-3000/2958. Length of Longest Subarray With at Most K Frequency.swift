class Solution {

    // Solution by Sergey Leschev
    // 2958. Length of Longest Subarray With at Most K Frequency

    // Sliding window
    // Time complexity: O(N)
    // Space complexity: O(N)

    func maxSubarrayLength(_ nums: [Int], _ k: Int) -> Int {
        var freq = [Int: Int]()
        var ans = 0
        var i = 0

        for j in 0..<nums.count {
            freq[nums[j], default: 0] += 1

            while freq[nums[j], default: 0] > k {
                freq[nums[i], default: 0] -= 1
                i += 1
            }

            ans = max(ans, j - i + 1)
        }

        return ans
    }
}
