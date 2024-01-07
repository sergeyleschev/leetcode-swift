class Solution {

    // Solution by Sergey Leschev
    // 2965. Find Missing and Repeated Values

    // HashMap
    // Time complexity: O(n * n)
    // Space complexity: O(n * n)

    func findMissingAndRepeatedValues(_ grid: [[Int]]) -> [Int] {
        var freq = [Int: Int]()
        let n = grid.count

        for i in 0..<n {
            for j in 0..<n {
                freq[grid[i][j], default: 0] += 1
            }
        }

        var repeated = 0
        var missing = 0

        for i in 1...(n * n) {
            if freq[i] == 2 {
                repeated = i
            }
            if freq[i] == nil {
                missing = i
            }
        }

        return [repeated, missing]
    }
}
