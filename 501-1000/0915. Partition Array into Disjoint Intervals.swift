class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 915. Partition Array into Disjoint Intervals
    // Given an array nums, partition it into two (contiguous) subarrays left and right so that:
    // Every element in left is less than or equal to every element in right.
    // left and right are non-empty.
    // left has the smallest possible size.
    // Return the length of left after such a partitioning.  It is guaranteed that such a partitioning exists.

    // Example 1:
    // Input: nums = [5,0,3,8,6]
    // Output: 3
    // Explanation: left = [5,0,3], right = [8,6]

    // Example 2:
    // Input: nums = [1,1,1,0,6,12]
    // Output: 4
    // Explanation: left = [1,1,1,0], right = [6,12]

    // Note:
    // 2 <= nums.length <= 30000
    // 0 <= nums[i] <= 10^6
    // It is guaranteed there is at least one way to partition nums as described.

     func partitionDisjoint(_ A: [Int]) -> Int {
        if A.isEmpty { return 0 }
        var indexAndMin: (Int, Int) = (0, A[0])
        var leftMax = 0
        var pivotIndex = 0
        
        // find min - O(N)
        for (i, v) in A.enumerated() where indexAndMin.1 >= v { indexAndMin = (i, v) }

        // find left max - O(N)
        for i in 0...indexAndMin.0 { leftMax = max(A[i], leftMax) }

        // find right less - O(N)
        var leftMaxCandidate = leftMax
        var i = indexAndMin.0

        while i < A.count {
            leftMaxCandidate = max(A[i], leftMaxCandidate)

            if A[i] < leftMax {
                leftMax = leftMaxCandidate
                pivotIndex = i
            }
            i += 1
        }

        return pivotIndex + 1
    }

}