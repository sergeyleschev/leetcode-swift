class Solution {

    // Solution by Sergey Leschev
    // 2965. Find Missing and Repeated Values

    // Math
    // Time complexity: O(n * n)
    // Space complexity: O(1)

    func findMissingAndRepeatedValues(_ grid: [[Int]]) -> [Int] {
        let n = grid.count
        let N = n * n
        var sum = 0
        var sqrSum = 0

        for i in 0..<n {
            for j in 0..<n {
                sum += grid[i][j]
                sqrSum += grid[i][j] * grid[i][j]
            }
        }

        let c1 = sum - N * (N + 1) / 2
        let c2 = sqrSum - N * (N + 1) * (2 * N + 1) / 6

        return [(c2 / c1 + c1) / 2, (c2 / c1 - c1) / 2]
    }
}
