class Solution {

    // Solution by Sergey Leschev

    // 941. Valid Mountain Array
    // Given an array of integers arr, return true if and only if it is a valid mountain array.
    // Recall that arr is a mountain array if and only if:
    // arr.length >= 3
    // There exists some i with 0 < i < arr.length - 1 such that:
    // arr[0] < arr[1] < ... < arr[i - 1] < arr[i]
    // arr[i] > arr[i + 1] > ... > arr[arr.length - 1]

    // Finds if and only if the given array is a valid mountain array.

    // - Parameter A: An array of integers.
    // - Returns: True if A is a valid mountain array, otherwise returns false.

    // Example 1:
    // Input: arr = [2,1]
    // Output: false

    // Example 2:
    // Input: arr = [3,5,5]
    // Output: false

    // Example 3:
    // Input: arr = [0,3,2,1]
    // Output: true

    // Constraints:
    // 1 <= arr.length <= 10^4
    // 0 <= arr[i] <= 10^4

    // - Complexity:
    //   - time: O(n), where n is the length of A.
    //   - space: O(1), only constant space is used.

    func validMountainArray(_ A: [Int]) -> Bool {
        let n = A.count
        guard n >= 3 else { return false }
        var i = 0

        while (i + 1) < n, A[i] < A[i + 1] { i += 1 }
        guard i != 0, i != n - 1 else { return false }
        while (i + 1) < n, A[i] > A[i + 1] { i += 1 }

        return i == n - 1
    }

}
