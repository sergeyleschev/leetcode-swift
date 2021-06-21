class Solution {

    // 845. Longest Mountain in Array
    // You may recall that an array arr is a mountain array if and only if:
    // arr.length >= 3
    // There exists some index i (0-indexed) with 0 < i < arr.length - 1 such that:
    // arr[0] < arr[1] < ... < arr[i - 1] < arr[i]
    // arr[i] > arr[i + 1] > ... > arr[arr.length - 1]
    // Given an integer array arr, return the length of the longest subarray, which is a mountain. Return 0 if there is no mountain subarray.

    // Finds the length of the longest mountain.

    // - Parameter A: An array of integers.
    // - Returns: The length of the longest mountain, if there is no mountain returns 0.

    // Example 1:
    // Input: arr = [2,1,4,7,3,2,5]
    // Output: 5
    // Explanation: The largest mountain is [1,4,7,3,2] which has length 5.

    // Example 2:
    // Input: arr = [2,2,2]
    // Output: 0
    // Explanation: There is no mountain.

    // Constraints:
    // 1 <= arr.length <= 10^4
    // 0 <= arr[i] <= 10^4
 
    // Follow up:
    // Can you solve it using only one pass?
    // Can you solve it in O(1) space?

    // - Complexity:
    //     - time: O(n), where n is the length of `A`.
    //     - space: O(1), only constant space is used.
    
    func longestMountain(_ A: [Int]) -> Int {
        guard A.count >= 3 else { return 0 }
        var ans = 0
        var up = 0
        var down = 0

        for i in 1..<A.count {
            if down > 0 && A[i - 1] < A[i] || A[i - 1] == A[i] {
                up = 0
                down = 0
            }

            if A[i - 1] < A[i] { up += 1 }
            if A[i - 1] > A[i] { down += 1 }

            guard up > 0, down > 0 else { continue }
            ans = max(ans, up + down + 1)
        }

        return ans
    }

}