class Solution {

    // Solution by Sergey Leschev
    // 2602. Minimum Operations to Make All Array Elements Equal
    // Time complexity: O((n + m) * log(n))
    // Space complexity: O(n)

    func minOperations(_ nums: [Int], _ queries: [Int]) -> [Int] {
        // Sort the nums array to efficiently find the prefix sum
        let sortedNums = nums.sorted()

        // Calculate the prefix sum array
        var prefixSum = [0]
        for num in sortedNums {
            prefixSum.append(prefixSum.last! + num)
        }

        // Function to find the number of operations for a given query
        func operations(for query: Int) -> Int {
            let i = sortedNums.binarySearch(for: query)
            return query * (2 * i - sortedNums.count) + prefixSum.last! - 2 * prefixSum[i]
        }

        // Calculate the operations for each query
        return queries.map { operations(for: $0) }
    }
}

// Binary search extension for Array
extension Array where Element == Int {
    func binarySearch(for value: Int) -> Int {
        var left = 0
        var right = self.count - 1

        while left <= right {
            let mid = left + (right - left) / 2
            if self[mid] == value {
                return mid
            } else if self[mid] < value {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        return left
    }
}
