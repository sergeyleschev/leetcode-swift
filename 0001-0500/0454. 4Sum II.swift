class Solution {

    // Solution by Sergey Leschev

    // 454. 4Sum II
    // Given four integer arrays nums1, nums2, nums3, and nums4 all of length n, return the number of tuples (i, j, k, l) such that:
    // 0 <= i, j, k, l < n
    // nums1[i] + nums2[j] + nums3[k] + nums4[l] == 0

    // Finds how many tuples (i, j, k, l) there are such that
    // A[i] + B[j] + C[k] + D[l] is zero.

    // - Parameters:
    //   - A: An array list of integer values.
    //   - B: An array list of integer values.
    //   - C: An array list of integer values.
    //   - D: An array list of integer values.
    // - Returns: The number of tuples.

    // Example 1:
    // Input: nums1 = [1,2], nums2 = [-2,-1], nums3 = [-1,2], nums4 = [0,2]
    // Output: 2
    // Explanation:
    // The two tuples are:
    // 1. (0, 0, 0, 1) -> nums1[0] + nums2[0] + nums3[0] + nums4[1] = 1 + (-2) + (-1) + 2 = 0
    // 2. (1, 1, 0, 0) -> nums1[1] + nums2[1] + nums3[0] + nums4[0] = 2 + (-1) + (-1) + 0 = 0

    // Example 2:
    // Input: nums1 = [0], nums2 = [0], nums3 = [0], nums4 = [0]
    // Output: 1

    // Constraints:
    // n == nums1.length
    // n == nums2.length
    // n == nums3.length
    // n == nums4.length
    // 1 <= n <= 200
    // -2^28 <= nums1[i], nums2[i], nums3[i], nums4[i] <= 2^28

    // - Complexity:
    //   - time: O(n^2), where n is the length of the given lists.
    //   - space: O(n^2), where n is the length of the given lists.

    func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
        var dict = [Int: Int]()
        var ans = 0

        for a in A {
            for b in B {
                dict[a + b, default: 0] += 1
            }
        }

        for c in C {
            for d in D {
                guard let val = dict[-(c + d)] else { continue }
                ans += val
            }
        }

        return ans
    }

}
