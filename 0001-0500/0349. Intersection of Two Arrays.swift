class Solution {

    // Solution by Sergey Leschev

    // 349. Intersection of Two Arrays
    // Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must be unique and you may return the result in any order.

    // Computes the intersection of two arrays.
    // - Parameters:
    //   - nums1: An array of integers.
    //   - nums2: An array of integers.
    // - Returns: Intersection of two arrays.

    // Example 1:
    // Input: nums1 = [1,2,2,1], nums2 = [2,2]
    // Output: [2]

    // Example 2:
    // Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
    // Output: [9,4]
    // Explanation: [4,9] is also accepted.

    // Constraints:
    // 1 <= nums1.length, nums2.length <= 1000
    // 0 <= nums1[i], nums2[i] <= 1000

    // - Complexity:
    //   - time: O(max(n, m)), where n is the length of the nums1, and m is the length of the nums2.
    //   - space: O(max(n, m)), where n is the length of the nums1, and m is the length of the nums2.
    
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var buf = Set<Int>()
        var ans = Set<Int>()

        for num in nums1 { buf.insert(num) }

        for num in nums2 {
            guard buf.contains(num), !ans.contains(num) else { continue }
            ans.insert(num)
        }

        return Array(ans)
    }

}