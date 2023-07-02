class Solution {

    // Solution by Sergey Leschev

    // 1089. Duplicate Zeros
    // Given a fixed length array arr of integers, duplicate each occurrence of zero, shifting the remaining elements to the right.
    // Note that elements beyond the length of the original array are not written.
    // Do the above modifications to the input array in place, do not return anything from your function.

    // Example 1:
    // Input: [1,0,2,3,0,4,5,0]
    // Output: null
    // Explanation: After calling your function, the input array is modified to: [1,0,0,2,3,0,0,4]

    // Example 2:
    // Input: [1,2,3]
    // Output: null
    // Explanation: After calling your function, the input array is modified to: [1,2,3]

    // Note:
    // 1 <= arr.length <= 10000
    // 0 <= arr[i] <= 9

    func duplicateZeros(_ arr: inout [Int]) {
        var na = Array(repeating: 0, count: arr.count)
        var i = 0
        var j = 0

        while j < na.count {
            na[j] = arr[i]
            if arr[i] == 0, j < na.count - 1 {
                j += 1
                na[j] = 0
            }
            i += 1
            j += 1
        }

        arr = na
    }

}
