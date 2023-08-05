class Solution {

    // Solution by Sergey Leschev
    // 2771. Longest Non-decreasing Subarray From Two Arrays

    // Time complexity: O(n)
    // Space complexity: O(1)

    func maxNonDecreasingLength(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var res = 1
        var dp1 = 1
        var dp2 = 1
        let n = nums1.count

        for i in 1..<n {
            let t11 = nums1[i - 1] <= nums1[i] ? dp1 + 1 : 1
            let t12 = nums1[i - 1] <= nums2[i] ? dp1 + 1 : 1
            let t21 = nums2[i - 1] <= nums1[i] ? dp2 + 1 : 1
            let t22 = nums2[i - 1] <= nums2[i] ? dp2 + 1 : 1

            dp1 = max(t11, t21)
            dp2 = max(t12, t22)
            res = max(res, max(dp1, dp2))
        }

        return res
    }
}
