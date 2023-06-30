class Solution {

    // Solution by Sergey Leschev
    // 2750. Ways to Split Array Into Good Subarrays
    // Time complexity: O(n)
    // Space complexity: O(n)

    func numberOfGoodSubarraySplits(_ nums: [Int]) -> Int {
        var v: [Int] = []
        var first = false
        var cnt = 0

        // Iterate over the array
        for i in 0..<nums.count {
            if nums[i] == 1 {
                if first {
                    v.append(cnt) // Store the count of consecutive zeros
                }
                first = true
                cnt = 0
            } else {
                cnt += 1 // Count consecutive zeros
            }
        }

        if !first {
            return 0 // If there is no '1' in the array, return 0
        }

        var ans: Int64 = 1
        let mod: Int64 = 1_000_000_007

        // Multiply all counts by (count + 1) and take the modulo
        for val in v {
            ans = (ans * (Int64(val) + 1)) % mod
        }

        return Int(ans)
    }
}
