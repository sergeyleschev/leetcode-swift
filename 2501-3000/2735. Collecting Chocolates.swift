class Solution {

    // Solution by Sergey Leschev
    // 2735. Collecting Chocolates

    // Time complexity: O(n^2)
    // Space complexity: O(n)

    func minCost(_ nums: [Int], _ x: Int) -> Int {
        let n = nums.count
        var res = Array(repeating: 0, count: n)

        for i in 0..<n {
            res[i] += i * x
            var cur = nums[i]
            for k in 0..<n {
                cur = min(cur, nums[(i - k + n) % n])
                res[k] += cur
            }
        }

        var minRes = Int.max
        for element in res {
            minRes = min(minRes, element)
        }

        return minRes
    }
}
