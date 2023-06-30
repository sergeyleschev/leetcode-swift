class Solution {

    // Solution by Sergey Leschev

    // 1458. Max Dot Product of Two Subsequences
    // Given two arrays nums1 and nums2.
    // Return the maximum dot product between non-empty subsequences of nums1 and nums2 with the same length.
    // A subsequence of a array is a new array which is formed from the original array by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (ie, [2,3,5] is a subsequence of [1,2,3,4,5] while [1,5,3] is not).

    // Example 1:
    // Input: nums1 = [2,1,-2,5], nums2 = [3,0,-6]
    // Output: 18
    // Explanation: Take subsequence [2,-2] from nums1 and subsequence [3,-6] from nums2.
    // Their dot product is (2*3 + (-2)*(-6)) = 18.

    // Example 2:
    // Input: nums1 = [3,-2], nums2 = [2,-6,7]
    // Output: 21
    // Explanation: Take subsequence [3] from nums1 and subsequence [7] from nums2.
    // Their dot product is (3*7) = 21.

    // Example 3:
    // Input: nums1 = [-1,-1], nums2 = [1,1]
    // Output: -1
    // Explanation: Take subsequence [-1] from nums1 and subsequence [1] from nums2.
    // Their dot product is -1.

    // Constraints:
    // 1 <= nums1.length, nums2.length <= 500
    // -1000 <= nums1[i], nums2[i] <= 1000

    // mark[x][y] indicates the maximum dot product ending at x of nums1, and y of nums2.
    // To be, or not to be.
    // Options at (x, y)
    // 1. Just use the product of numbers at x and y.
    // 2. Use product of numbers at x and y, plus the max dot product ending with x - 1, and y - 1.
    // 3. Not use product of numbers at x and y, if answer at x - 1 and y is greater.
    // 4. Not use product of numbers at x and y, if answer at x and y - 1 is greater.

    func maxDotProduct(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let n = nums1.count
        let m = nums2.count
        var mark = Array(repeating: Array(repeating: Int.min, count: m + 1), count: n + 1)
        
        for x in 1 ... n {
            for y in 1 ... m {
                mark[x][y] = nums1[x - 1] * nums2[y - 1]
                mark[x][y] += max(0, mark[x - 1][y - 1])
                mark[x][y] = max(mark[x - 1][y], mark[x][y])
                mark[x][y] = max(mark[x][y], mark[x][y - 1])
            }
        }
        return mark[n][m]
    }

}