class Solution {

    // Solution by Sergey Leschev
    // 2679. Sum in a Matrix

    // Time complexity: O(r ∗ c logc) as we need to sort each row and sorting is the dominating factor.
    // Space complexity: O(c) as we need to keep the max for each column.
    // Where: r rows and c columns

    func matrixSum(_ nums: [[Int]]) -> Int {
        let cols = nums[0].count
        var maxs = Array(repeating: 0, count: cols)
        var score = 0

        for row in nums {
            let sortedRow = row.sorted()
            for c in 0..<cols {
                maxs[c] = max(maxs[c], sortedRow[c])
            }
        }

        for num in maxs {
            score += num
        }

        return score
    }
}
