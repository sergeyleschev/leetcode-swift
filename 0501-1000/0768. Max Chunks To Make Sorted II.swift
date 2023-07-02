class Solution {

    // Solution by Sergey Leschev

    // 768. Max Chunks To Make Sorted II
    // You are given an integer array arr.
    // We split arr into some number of chunks (i.e., partitions), and individually sort each chunk. After concatenating them, the result should equal the sorted array.
    // Return the largest number of chunks we can make to sort the array.

    // Example 1:
    // Input: arr = [5,4,3,2,1]
    // Output: 1
    // Explanation:
    // Splitting into two or more chunks will not return the required result.
    // For example, splitting into [5, 4], [3, 2, 1] will result in [4, 5, 1, 2, 3], which isn't sorted.

    // Example 2:
    // Input: arr = [2,1,3,4,4]
    // Output: 4
    // Explanation:
    // We can split into two chunks, such as [2, 1], [3, 4, 4].
    // However, splitting into [2, 1], [3], [4], [4] is the highest number of chunks possible.

    // Constraints:
    // 1 <= arr.length <= 2000
    // 0 <= arr[i] <= 10^8

    func maxChunksToSorted(_ arr: [Int]) -> Int {
        let sortedArr = arr.sorted()
        var match = [Int: Int]()
        var matchCount = 0
        var count = 0

        for i in 0..<arr.count {
            match[sortedArr[i]] = (match[sortedArr[i]] ?? 0) + 1
            if match[sortedArr[i]] == 0 { matchCount -= 1 }
            if match[sortedArr[i]] == 1 { matchCount += 1 }

            match[arr[i]] = (match[arr[i]] ?? 0) - 1
            if match[arr[i]] == 0 { matchCount -= 1 }
            if match[arr[i]] == -1 { matchCount += 1 }

            count += matchCount == 0 ? 1 : 0
        }

        return count
    }

}
