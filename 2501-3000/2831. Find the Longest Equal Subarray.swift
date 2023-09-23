class Solution {

    // Solution by Sergey Leschev
    // 2831. Find the Longest Equal Subarray

    // Time complexity: O(n + n)
    // Space complexity: O(n)

    func longestEqualSubarray(_ nums: [Int], _ k: Int) -> Int {
        var i = 0
        var j = 0
        var m = [Int: Int]()
        var ans = 1
        var mf = 0

        while j < nums.count {
            let current = nums[j]
            m[current, default: 0] += 1
            mf = max(mf, m[current]!)

            var rem = j - i + 1 - mf

            while i < nums.count && rem > k {
                let removed = nums[i]
                m[removed]! -= 1
                i += 1
                mf = max(mf, m[current]!)
                rem = j - i + 1 - mf
            }

            ans = max(ans, mf)
            j += 1
        }

        return ans
    }
}
