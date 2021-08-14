class Solution {

    // Solution @ Sergey Leschev, Belarusian State University
    
    // 88. Merge Sorted Array
    // Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.
    // The number of elements initialized in nums1 and nums2 are m and n respectively. You may assume that nums1 has a size equal to m + n such that it has enough space to hold additional elements from nums2.

    // Merge nums2 into nums1 as one sorted array.

    // - Parameters:
    //   - nums1: The sorted integer array.
    //   - m: The number of elements in nums1.
    //   - nums2: The sorted integer array.
    //   - n: The number of elements in nums2.

    // Example 1:
    // Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
    // Output: [1,2,2,3,5,6]

    // Example 2:
    // Input: nums1 = [1], m = 1, nums2 = [], n = 0
    // Output: [1]

    // Constraints:
    // nums1.length == m + n
    // nums2.length == n
    // 0 <= m, n <= 200
    // 1 <= m + n <= 200
    // -10^9 <= nums1[i], nums2[i] <= 10^9

    // Follow up: Can you come up with an algorithm that runs in O(m + n) time?

    // - Complexity:
    //   - time: O(m + n), where m is the number of elements in nums1, and n is the number of elements in nums2.
    //   - space: O(1), only constant space is used.

    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var lastA = m - 1
        var lastB = n - 1
        var curr = nums1.count - 1

        while lastA >= 0, lastB >= 0 {
            if nums1[lastA] >= nums2[lastB] {
                nums1[curr] = nums1[lastA]
                lastA -= 1
            } else {
                nums1[curr] = nums2[lastB]
                lastB -= 1
            }
            curr -= 1
        }

        while lastB >= 0 {
            nums1[curr] = nums2[lastB]
            lastB -= 1
            curr -= 1
        }
    }

}