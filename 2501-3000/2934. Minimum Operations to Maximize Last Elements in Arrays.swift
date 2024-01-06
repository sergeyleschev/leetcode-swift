class Solution {

    // Solution by Sergey Leschev
    // 2934. Minimum Operations to Maximize Last Elements in Arrays

    // Time complexity: O(n)
    // Space complexity: O(1)

    func minOperations(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let n = nums1.count
        let a = nums1[n - 1]
        let b = nums2[n - 1]

        var swap1 = 0
        var flag1 = 1

        // Option 1: if we don't swap the last elements of both arrays
        for i in 0..<n - 1 {
            if nums1[i] <= a && nums2[i] <= b {
                continue
            } else if nums2[i] <= a && nums1[i] <= b {
                swap1 += 1
            } else {
                flag1 = 0
                break
            }
        }

        // Option 2: if we swap the last elements of both arrays (i.e., count2 = 1)
        var swap2 = 1
        var flag2 = 1

        for i in 0..<n - 1 {
            if nums1[i] <= b && nums2[i] <= a {
                continue
            } else if nums2[i] <= b && nums1[i] <= a {
                swap2 += 1
            } else {
                flag2 = 0
                break
            }
        }

        if flag1 == 0 && flag2 == 0 {
            return -1
        }

        return min(swap1, swap2)
    }
}
