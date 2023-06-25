class Solution {

    // Solution @ Sergey Leschev

    // 1380. Lucky Numbers in a Matrix
    // Given a m * n matrix of distinct numbers, return all lucky numbers in the matrix in any order.
    // A lucky number is an element of the matrix such that it is the minimum element in its row and maximum in its column.

    // Example 1:
    // Input: matrix = [[3,7,8],[9,11,13],[15,16,17]]
    // Output: [15]
    // Explanation: 15 is the only lucky number since it is the minimum in its row and the maximum in its column

    // Example 2:
    // Input: matrix = [[1,10,4,2],[9,3,8,7],[15,16,17,12]]
    // Output: [12]
    // Explanation: 12 is the only lucky number since it is the minimum in its row and the maximum in its column.

    // Example 3:
    // Input: matrix = [[7,8],[1,2]]
    // Output: [7]

    // Constraints:
    // m == mat.length
    // n == mat[i].length
    // 1 <= n, m <= 50
    // 1 <= matrix[i][j] <= 10^5.
    // All elements in the matrix are distinct.

    func luckyNumbers(_ matrix: [[Int]]) -> [Int] {
        var arrWithLuckkyNum = [Int]()
        var r = 0
        let m = matrix.count
        var minVal = 0
        var maxVal = 0
        var i = 0
        var j = 0

        while r < m {
            minVal = findMin(matrix[r])
            i = findPositionMinVal(matrix[r], minVal)
            maxVal = minVal
            j = 0
            while j < m {
                if matrix[j][i] > maxVal { maxVal = matrix[j][i]; break }
                j += 1
            }
            if j == m && maxVal == minVal { arrWithLuckkyNum.append(maxVal) }
            r += 1
        }

        return arrWithLuckkyNum
    }


    private func findMin(_ arr: [Int]) -> Int {
        var i = 0
        var minVal = arr[i]
        while i < arr.count {
            if arr[i] < minVal { minVal = arr[i] }
            i += 1
        }
        return minVal
    }


    private func findPositionMinVal(_ arr: [Int], _ minVal: Int) -> Int {
        var i = 0
        while i < arr.count {
            if arr[i] == minVal { return i }
            i += 1
        }
        return i
    }

}