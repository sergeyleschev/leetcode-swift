class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 907. Sum of Subarray Minimums
    // Given an array of integers arr, find the sum of min(b), where b ranges over every (contiguous) subarray of arr. Since the answer may be large, return the answer modulo 10^9 + 7.

    // Example 1:
    // Input: arr = [3,1,2,4]
    // Output: 17
    // Explanation: 
    // Subarrays are [3], [1], [2], [4], [3,1], [1,2], [2,4], [3,1,2], [1,2,4], [3,1,2,4]. 
    // Minimums are 3, 1, 2, 4, 1, 1, 2, 1, 1, 1.
    // Sum is 17.

    // Example 2:
    // Input: arr = [11,81,94,43,3]
    // Output: 444

    // Constraints:
    // 1 <= arr.length <= 3 * 10^4
    // 1 <= arr[i] <= 3 * 10^4

    // - Complexity:
    //   - time: O(n)
    //   - space: O(n)

    func sumSubarrayMins(_ A: [Int]) -> Int {
        let n = A.count
        var prevStack: [Int] = []
        var nextStack: [Int] = []
        var left = Array(repeating: -1, count: n)
        var right = Array(repeating: -1, count: n)
        var sum = 0

        for i in 0..<n {
            left[i] = i + 1
            right[i] = n - i
        }

        for i in 0..<n {
            while let top = prevStack.last, A[top] > A[i] { prevStack.removeLast() }
            if let last = prevStack.last {
                left[i] = i - last
            } else {
                left[i] = i + 1
            }
            prevStack.append(i)

            while let top = nextStack.last, A[top] > A[i] {
                let prevIndex = nextStack.removeLast()
                right[prevIndex] = i - prevIndex
            }
            nextStack.append(i)
        }

        for i in 0..<n { sum += A[i] * left[i] * right[i] }
        
        return sum % Int(1e9+7)
    }

}