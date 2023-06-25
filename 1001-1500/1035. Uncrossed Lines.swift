class Solution {

    // Solution @ Sergey Leschev

    // 1035. Uncrossed Lines
    // We write the integers of nums1 and nums2 (in the order they are given) on two separate horizontal lines.
    // Now, we may draw connecting lines: a straight line connecting two numbers nums1[i] and nums2[j] such that:
    // nums1[i] == nums2[j];
    // The line we draw does not intersect any other connecting (non-horizontal) line.
    // Note that a connecting lines cannot intersect even at the endpoints: each number can only belong to one connecting line.
    // Return the maximum number of connecting lines we can draw in this way.

    // Calculates the maximum number of uncrossed Lines.

    // - Parameters:
    //   - A: An array A.
    //   - B: An array B.
    // - Returns: The maximum number of connecting lines.

    // Example 1:
    // Input: nums1 = [1,4,2], nums2 = [1,2,4]
    // Output: 2
    // Explanation: We can draw 2 uncrossed lines as in the diagram.
    // We cannot draw 3 uncrossed lines, because the line from nums1[1]=4 to nums2[2]=4 will intersect the line from nums1[2]=2 to nums2[1]=2.

    // Example 2:
    // Input: nums1 = [2,5,1,2,5], nums2 = [10,5,2,1,5,2]
    // Output: 3

    // Example 3:
    // Input: nums1 = [1,3,7,1,7,5], nums2 = [1,9,2,5,1]
    // Output: 2

    // Note:
    // 1 <= nums1.length <= 500
    // 1 <= nums2.length <= 500
    // 1 <= nums1[i], nums2[i] <= 2000

    // - Complexity:
    //   - time: O(n * m), where n is the length of A and m is the length of B.
    //   - space: O(m), where m is the length of *B*.
    
    func maxUncrossedLines(_ A: [Int], _ B: [Int]) -> Int {
        var dp = [Int](repeating: 0, count: B.count + 1)

        for i in 1...A.count {
            var prev = 0
            for j in 1...B.count {
                let cur = dp[j]
                if A[i - 1] == B[j - 1] {
                    dp[j] = prev + 1
                } else {
                    dp[j] = max(dp[j - 1], dp[j])
                }
                prev = cur
            }
        }

        return dp[B.count]
    }

}