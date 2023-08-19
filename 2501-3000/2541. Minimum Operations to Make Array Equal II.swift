class Solution {

    // Solution by Sergey Leschev
    // 2541. Minimum Operations to Make Array Equal II

    func minOperations(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int {
        if k == 0 {
            if nums1 == nums2 {
                return 0
            }
            return -1
        }

        var pDiff = 0
        var nDiff = 0

        for i in 0..<nums1.count {
            if nums1[i] >= nums2[i] {
                if (nums1[i] - nums2[i]) % k == 0 {
                    pDiff += nums1[i] - nums2[i]
                } else {
                    return -1
                }
            } else {
                if (nums2[i] - nums1[i]) % k == 0 {
                    nDiff += nums2[i] - nums1[i]
                } else {
                    return -1
                }
            }
        }

        var ans = -1
        if pDiff - nDiff == 0 {
            ans = pDiff / k
        }
        return ans
    }
}
