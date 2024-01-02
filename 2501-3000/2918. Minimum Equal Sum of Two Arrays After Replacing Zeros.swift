class Solution {

    // Solution by Sergey Leschev
    // 2918. Minimum Equal Sum of Two Arrays After Replacing Zeros
    // Greedy

    func minSum(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var s1 = 0
        var s2 = 0
        var c1 = 0
        var c2 = 0

        for val in nums1 {
            s1 += val
            c1 += (val == 0) ? 1 : 0
        }

        for val in nums2 {
            s2 += val
            c2 += (val == 0) ? 1 : 0
        }

        if c1 == 0 && s1 < s2 + c2 {
            return -1
        }

        if c2 == 0 && s2 < s1 + c1 {
            return -1
        }

        return max(s1 + c1, s2 + c2)
    }
}
