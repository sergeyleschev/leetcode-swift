class Solution {

    // Solution by Sergey Leschev
    // 2680. Maximum OR

    func maximumOr(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var pre = [Int](repeating: 0, count: n + 1)  // Stores prefix bitwise OR values
        var suf = [Int](repeating: 0, count: n + 1)  // Stores suffix bitwise OR values
        pre[0] = 0
        suf[n] = 0
        var res: Int64 = 0
        var p: Int64 = 1  // Used to calculate the power of 2, equivalent to x^k
        p = p << Int64(k)  // Left shift k positions to calculate 2^k

        // Calculate prefix bitwise OR values
        for i in 0..<n {
            pre[i + 1] = pre[i] | nums[i]
        }

        // Calculate suffix bitwise OR values
        for i in stride(from: n - 1, through: 0, by: -1) {
            suf[i] = suf[i + 1] | nums[i]
        }

        // Find the maximum result by iterating through the numbers
        for i in 0..<n {
            res = max(res, Int64(pre[i]) | (Int64(nums[i]) * p) | Int64(suf[i + 1]))
        }

        return Int(res)
    }
}
