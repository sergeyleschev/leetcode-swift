class Solution {

    // Solution @ Sergey Leschev

    // 1053. Previous Permutation With One Swap
    // Given an array of positive integers arr (not necessarily distinct), return the lexicographically largest permutation that is smaller than arr, that can be made with exactly one swap (A swap exchanges the positions of two numbers arr[i] and arr[j]). If it cannot be done, then return the same array.

    // Example 1:
    // Input: arr = [3,2,1]
    // Output: [3,1,2]
    // Explanation: Swapping 2 and 1.

    // Example 2:
    // Input: arr = [1,1,5]
    // Output: [1,1,5]
    // Explanation: This is already the smallest permutation.

    // Example 3:
    // Input: arr = [1,9,4,6,7]
    // Output: [1,7,4,6,9]
    // Explanation: Swapping 9 and 7.

    // Example 4:
    // Input: arr = [3,1,1,3]
    // Output: [1,3,1,3]
    // Explanation: Swapping 1 and 3.

    // Constraints:
    // 1 <= arr.length <= 10^4
    // 1 <= arr[i] <= 10^4


    func prevPermOpt1(_ A: [Int]) -> [Int] {
        var res = A

        for i in stride(from: res.count - 1, to: 0, by: -1) {
            if res[i - 1] > res[i] {
                var maxSmallerThanPrev = Int.min
                var maxSmallerThanPrevIdx = 0
                
                for j in i..<res.count {
                    if res[j] < res[i - 1] && res[j] > maxSmallerThanPrev {
                        maxSmallerThanPrev = res[j]
                        maxSmallerThanPrevIdx = j
                    }
                }

                if maxSmallerThanPrev != Int.min {
                    res.swapAt(maxSmallerThanPrevIdx, i - 1)
                    return res
                }
            }
        }

        return res
    }

}