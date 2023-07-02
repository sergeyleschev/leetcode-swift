class Solution {

    // Solution by Sergey Leschev

    // 1574. Shortest Subarray to be Removed to Make Array Sorted
    // Given an integer array arr, remove a subarray (can be empty) from arr such that the remaining elements in arr are non-decreasing.
    // A subarray is a contiguous subsequence of the array.

    // Return the length of the shortest subarray to remove.

    // Example 1:
    // Input: arr = [1,2,3,10,4,2,3,5]
    // Output: 3
    // Explanation: The shortest subarray we can remove is [10,4,2] of length 3. The remaining elements after that will be [1,2,3,3,5] which are sorted.
    // Another correct solution is to remove the subarray [3,10,4].

    // Example 2:
    // Input: arr = [5,4,3,2,1]
    // Output: 4
    // Explanation: Since the array is strictly decreasing, we can only keep a single element. Therefore we need to remove a subarray of length 4, either [5,4,3,2] or [4,3,2,1].

    // Example 3:
    // Input: arr = [1,2,3]
    // Output: 0
    // Explanation: The array is already non-decreasing. We do not need to remove any elements.

    // Example 4:
    // Input: arr = [1]
    // Output: 0

    // Constraints:
    // 1 <= arr.length <= 10^5
    // 0 <= arr[i] <= 10^9

    func findLengthOfShortestSubarray(_ arr: [Int]) -> Int {
        var ans = 0
        let n = arr.count
        var arrCopy = arr
        guard n > 1 else { return 0 }
        var leftArr = [Int]()
        while !arrCopy.isEmpty && (leftArr.isEmpty || arrCopy.first! >= leftArr.last!) {
            leftArr.append(arrCopy.removeFirst())
        }
        guard leftArr.count != n else { return 0 }
        var rightArr = [Int]()

        ans = leftArr.count

        while !arrCopy.isEmpty && (rightArr.isEmpty || arrCopy.last! <= rightArr.first!) {
            rightArr.insert(arrCopy.removeLast(), at: 0)
        }
        ans = max(ans, rightArr.count)
        for i in 0..<leftArr.count {
            if let r = rightArr.firstIndex(where: { $0 >= leftArr[i] }) {
                ans = max(i + 1 + rightArr.count - r, ans)
            } else {
                ans = max(leftArr.count, rightArr.count, ans)
                break
            }
        }
        return arr.count - ans
    }

}
