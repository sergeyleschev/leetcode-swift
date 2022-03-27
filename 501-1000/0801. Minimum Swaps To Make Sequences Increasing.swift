class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 801. Minimum Swaps To Make Sequences Increasing
    // We have two integer sequences nums1 and nums2 of the same non-zero length.
    // We are allowed to swap elements nums1[i] and nums2[i]. Note that both elements are in the same index position in their respective sequences.
    // At the end of some number of swaps, nums1 and nums2 are both strictly increasing. (An array A is strictly increasing if and only if A[0] < A[1] < A[2] < ... < A[A.length - 1].)
    // Given nums1 and nums2, return the minimum number of swaps to make both sequences strictly increasing. It is guaranteed that the given input always makes it possible.

    // Example:
    // Input: nums1 = [1,3,5,4], nums2 = [1,2,3,7]
    // Output: 1
    // Explanation: 
    // Swap nums1[3] and nums2[3].  Then the sequences are:
    // nums1 = [1, 3, 5, 7] and nums2 = [1, 2, 3, 4]
    // which are both strictly increasing.
    // Note:
    // nums1, nums2 are arrays with the same length, and that length will be in the range [1, 1000].
    // nums1[i], nums2[i] are integer values in the range [0, 2000].

    func minSwap(_ A: [Int], _ B: [Int]) -> Int {
        var (swap, keep) = (1, 0)
        
        for i in 1..<A.count {
            var (swap0, keep0) = (0, 0)
            if A[i] <= A[i - 1] || B[i] <= B[i - 1] {
                swap0 = keep + 1
                keep0 = swap
            } else if A[i] > B[i - 1] && B[i] > A[i - 1] {
                keep0 = min(swap, keep)
                swap0 = keep0 + 1
            } else {
                keep0 = keep
                swap0 = swap + 1
            }
            (swap, keep) = (swap0, keep0)
        }
        
        return min(swap, keep)
    }
    
}