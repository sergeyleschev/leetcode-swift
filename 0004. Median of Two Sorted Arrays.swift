class Solution {

    // 4. Median of Two Sorted Arrays
    // Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.
    // The overall run time complexity should be O(log (m+n)).

    // Example 1:
    // Input: nums1 = [1,3], nums2 = [2]
    // Output: 2.00000
    // Explanation: merged array = [1,2,3] and median is 2.

    // Example 2:
    // Input: nums1 = [1,2], nums2 = [3,4]
    // Output: 2.50000
    // Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.

    // Example 3:
    // Input: nums1 = [0,0], nums2 = [0,0]
    // Output: 0.00000

    // Example 4:
    // Input: nums1 = [], nums2 = [1]
    // Output: 1.00000

    // Example 5:
    // Input: nums1 = [2], nums2 = []
    // Output: 2.00000

    // Constraints:
    // nums1.length == m
    // nums2.length == n
    // 0 <= m <= 1000
    // 0 <= n <= 1000
    // 1 <= m + n <= 2000
    // -10^6 <= nums1[i], nums2[i] <= 10^6

    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let total = nums1.count + nums2.count
        var index = 0
        var index_1 = 0
        var index_2 = 0
        var merged_array: [Int] = []
        var res: Double = 0

        while total > 0 && index <= total / 2 {
            if index_1 < nums1.count && index_2 < nums2.count {
                if nums1[index_1] < nums2[index_2] {
                    merged_array.append(nums1[index_1])
                    index_1 += 1
                } else {
                    merged_array.append(nums2[index_2])
                    index_2 += 1
                }
            } else if index_1 < nums1.count && index_2 >= nums2.count {
                merged_array.append(nums1[index_1])
                index_1 += 1
            } else {
                merged_array.append(nums2[index_2])
                index_2 += 1
            }
            index += 1
        }

        if total > 0 {
            if total % 2 == 1 {
                res = Double(merged_array[total / 2])
            } else {
                res = (Double(merged_array[total / 2]) + Double(merged_array[total / 2 - 1])) / 2
            }
        }

        return res
    }
    
}