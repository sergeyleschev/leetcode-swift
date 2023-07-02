class Solution {

    // Solution by Sergey Leschev

    // 363. Max Sum of Rectangle No Larger Than K
    // Given an m x n matrix matrix and an integer k, return the max sum of a rectangle in the matrix such that its sum is no larger than k.
    // It is guaranteed that there will be a rectangle with a sum no larger than k.

    // Example 1:
    // Input: matrix = [[1,0,1],[0,-2,3]], k = 2
    // Output: 2
    // Explanation: Because the sum of the blue rectangle [[0, 1], [-2, 3]] is 2, and 2 is the max number no larger than k (k = 2).

    // Example 2:
    // Input: matrix = [[2,2,-1]], k = 3
    // Output: 3

    // Constraints:
    // m == matrix.length
    // n == matrix[i].length
    // 1 <= m, n <= 100
    // -100 <= matrix[i][j] <= 100
    // -10^5 <= k <= 10^5

    // Follow up: What if the number of rows is much larger than the number of columns?

    func maxSumSubmatrix(_ matrix: [[Int]], _ k: Int) -> Int {
        let m = matrix.count
        guard m > 0 else { return 0 }

        let n = matrix[0].count
        guard n > 0 else { return 0 }

        var res = Int.min
        for left in 0..<n {
            var sum = [Int](repeating: 0, count: m)
            for right in left..<n {
                for j in 0..<m { sum[j] += matrix[j][right] }
                var prefixSum = [Int]()
                prefixSum.append(0)
                var cur = 0
                for num in sum {
                    cur += num
                    let loc = bisectLeft(prefixSum, cur - k)
                    if prefixSum.count > loc {
                        res = max(res, cur - prefixSum[loc])
                    }
                    inorder(&prefixSum, cur)
                }
            }
        }
        return res
    }

    private func bisectLeft(_ arr: [Int], _ num: Int) -> Int {
        guard arr.count > 0 else { return 0 }
        if num < arr[0] { return 0 }
        if num > arr[arr.count - 1] { return arr.count }
        var left = 0
        var right = arr.count

        while left < right {
            let middle = left + (right - left) / 2
            if arr[middle] < num {
                left = middle + 1
            } else {
                right = middle
            }
        }
        return left
    }

    private func inorder(_ arr: inout [Int], _ num: Int) {
        let index = bisectLeft(arr, num)
        arr.insert(num, at: index)
    }

}
