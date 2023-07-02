class Solution {

    // Solution by Sergey Leschev

    // 1775. Equal Sum Arrays With Minimum Number of Operations
    // You are given two arrays of integers nums1 and nums2, possibly of different lengths. The values in the arrays are between 1 and 6, inclusive.
    // In one operation, you can change any integer's value in any of the arrays to any value between 1 and 6, inclusive.
    // Return the minimum number of operations required to make the sum of values in nums1 equal to the sum of values in nums2. Return -1 if it is not possible to make the sum of the two arrays equal.

    // Example 1:
    // Input: nums1 = [1,2,3,4,5,6], nums2 = [1,1,2,2,2,2]
    // Output: 3
    // Explanation: You can make the sums of nums1 and nums2 equal with 3 operations. All indices are 0-indexed.
    // - Change nums2[0] to 6. nums1 = [1,2,3,4,5,6], nums2 = [6,1,2,2,2,2].
    // - Change nums1[5] to 1. nums1 = [1,2,3,4,5,1], nums2 = [6,1,2,2,2,2].
    // - Change nums1[2] to 2. nums1 = [1,2,2,4,5,1], nums2 = [6,1,2,2,2,2].

    // Example 2:
    // Input: nums1 = [1,1,1,1,1,1,1], nums2 = [6]
    // Output: -1
    // Explanation: There is no way to decrease the sum of nums1 or to increase the sum of nums2 to make them equal.

    // Example 3:
    // Input: nums1 = [6,6], nums2 = [1]
    // Output: 3
    // Explanation: You can make the sums of nums1 and nums2 equal with 3 operations. All indices are 0-indexed.
    // - Change nums1[0] to 2. nums1 = [2,6], nums2 = [1].
    // - Change nums1[1] to 2. nums1 = [2,2], nums2 = [1].
    // - Change nums2[0] to 4. nums1 = [2,2], nums2 = [4].

    // Constraints:
    // 1 <= nums1.length, nums2.length <= 10^5
    // 1 <= nums1[i], nums2[i] <= 6

    func minOperations(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var count = 0
        var ascSum = nums1.reduce(0, { $0 + $1 })
        var descSum = nums2.reduce(0, { $0 + $1 })
        var ascNum = [Int]()
        var descNum = [Int]()
        let max = 6
        let min = 1
        var ascIndex = 0
        var descIndex = 0

        if ascSum < descSum {
            ascNum = nums1.sorted()
            descNum = nums2.sorted().reversed()
        } else {
            ascNum = nums2.sorted()
            descNum = nums1.sorted().reversed()
        }

        ascSum = ascNum.reduce(0, { $0 + $1 })
        descSum = descNum.reduce(0, { $0 + $1 })
        var tempDiff = descSum - ascSum

        while ascSum != descSum {
            if descIndex >= descNum.count && ascIndex >= ascNum.count { return -1 }
            var shouldPickASC = true

            if ascIndex >= ascNum.count {
                shouldPickASC = false
            } else {
                if descNum[descIndex] - min > max - ascNum[ascIndex] { shouldPickASC = false }
            }

            if !shouldPickASC {
                let diff = tempDiff > descNum[descIndex] - min ? descNum[descIndex] - min : tempDiff
                descSum -= diff
                descNum[descIndex] -= diff
                descIndex += 1
            } else {
                let diff = tempDiff > max - ascNum[ascIndex] ? max - ascNum[ascIndex] : tempDiff
                ascSum += diff
                ascNum[ascIndex] += diff
                ascIndex += 1
            }
            tempDiff = descSum - ascSum
            count += 1
        }
        return count
    }

}
