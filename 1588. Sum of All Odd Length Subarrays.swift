class Solution {

    // 1588. Sum of All Odd Length Subarrays
    // Given an array of positive integers arr, calculate the sum of all possible odd-length subarrays.
    // A subarray is a contiguous subsequence of the array.

    // Return the sum of all odd-length subarrays of arr.

    // Example 1:
    // Input: arr = [1,4,2,5,3]
    // Output: 58
    // Explanation: The odd-length subarrays of arr and their sums are:
    // [1] = 1
    // [4] = 4
    // [2] = 2
    // [5] = 5
    // [3] = 3
    // [1,4,2] = 7
    // [4,2,5] = 11
    // [2,5,3] = 10
    // [1,4,2,5,3] = 15
    // If we add all these together we get 1 + 4 + 2 + 5 + 3 + 7 + 11 + 10 + 15 = 58

    // Example 2:
    // Input: arr = [1,2]
    // Output: 3
    // Explanation: There are only 2 subarrays of odd length, [1] and [2]. Their sum is 3.

    // Example 3:
    // Input: arr = [10,11,12]
    // Output: 66

    // Constraints:
    // 1 <= arr.length <= 100
    // 1 <= arr[i] <= 1000

    func sumOddLengthSubarrays(_ arr: [Int]) -> Int {
        var ans = 0
        var preffix = [0]
        for num in arr { preffix.append(preffix.last! + num) }
        let N = arr.count
        var subsequenceLength = 3
        ans += preffix.last!


        func subsequenceSum(_ curSubsequenceLength: Int) -> Int {
            var sum = 0
            var j = 1
            while j + curSubsequenceLength - 1 <= N {
                sum += preffix[j + curSubsequenceLength - 1] - preffix[j - 1]
                j += 1
            }
            return sum
        }

        while subsequenceLength <= arr.count {
            ans += subsequenceSum(subsequenceLength)
            subsequenceLength += 2
        }
        return ans
    }

}