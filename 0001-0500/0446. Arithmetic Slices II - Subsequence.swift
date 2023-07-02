class Solution {

    // Solution by Sergey Leschev

    // 446. Arithmetic Slices II - Subsequence
    // Given an integer array nums, return the number of all the arithmetic subsequences of nums.
    // A sequence of numbers is called arithmetic if it consists of at least three elements and if the difference between any two consecutive elements is the same.
    // For example, [1, 3, 5, 7, 9], [7, 7, 7, 7], and [3, -1, -5, -9] are arithmetic sequences.
    // For example, [1, 1, 2, 5, 7] is not an arithmetic sequence.
    // A subsequence of an array is a sequence that can be formed by removing some elements (possibly none) of the array.
    // For example, [2,5,10] is a subsequence of [1,2,1,2,4,1,5,10].
    // The answer is guaranteed to fit in 32-bit integer.

    // Example 1:
    // Input: nums = [2,4,6,8,10]
    // Output: 7
    // Explanation: All arithmetic subsequence slices are:
    // [2,4,6]
    // [4,6,8]
    // [6,8,10]
    // [2,4,6,8]
    // [4,6,8,10]
    // [2,4,6,8,10]
    // [2,6,10]

    // Example 2:
    // Input: nums = [7,7,7,7,7]
    // Output: 16
    // Explanation: Any subsequence of this array is arithmetic.

    // Constraints:
    // 1  <= nums.length <= 1000
    // -2^31 <= nums[i] <= 2^31 - 1

    func numberOfArithmeticSlices(_ A: [Int]) -> Int {
        let n = A.count
        guard n >= 3 else { return 0 }
        // build dictionary for i, of number of sequences
        // (including length 2) end at i
        var mark = Array(repeating: [Int: Int](), count: n)
        var total = 0

        for i in 1..<n {
            for j in 0..<i {
                // use all j < i to update mark[i][diff]
                // the number of sequences end at i with distance dist
                // add the number of sequences of all dist to ans
                let diff = A[i] - A[j]
                if let _ = mark[i][diff] {} else { mark[i][diff] = 0 }
                if let _ = mark[j][diff] {} else { mark[j][diff] = 0 }

                // Add elements i to the sequence,
                // Add (A[j], A[i]) as part of solution.
                let s = 1 + mark[j][diff]!
                mark[i][diff] = s + mark[i][diff]!
                total += s
            }

            // remove the length 2 sequences
            // (A[j], A[i]) for all the j (0...i-1) smaller than i.
            total -= i
        }

        return total
    }

}
