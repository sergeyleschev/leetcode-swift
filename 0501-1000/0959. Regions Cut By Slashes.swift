class Solution {

    // Solution by Sergey Leschev

    // 959. Regions Cut By Slashes
    // An n x n grid is composed of 1 x 1 squares where each 1 x 1 square consists of a '/', '\', or blank space ' '. These characters divide the square into contiguous regions.
    // Given the grid grid represented as a string array, return the number of regions.
    // Note that backslash characters are escaped, so a '\' is represented as '\\'.

    // Example 1:
    // Input: grid = [" /","/ "]
    // Output: 2

    // Example 2:
    // Input: grid = [" /","  "]
    // Output: 1

    // Example 3:
    // Input: grid = ["\\/","/\\"]
    // Output: 4
    // Explanation: (Recall that because \ characters are escaped, "\\/" refers to \/, and "/\\" refers to /\.)

    // Example 4:
    // Input: grid = ["/\\","\\/"]
    // Output: 5
    // Explanation: (Recall that because \ characters are escaped, "\\/" refers to \/, and "/\\" refers to /\.)

    // Example 5:
    // Input: grid = ["//","/ "]
    // Output: 3

    // Constraints:
    // n == grid.length
    // n == grid[i].length
    // 1 <= n <= 30
    // grid[i][j] is either '/', '\', or ' '.

    func regionsBySlashes(_ grid: [String]) -> Int {
        let n = grid.count
        let union = Union(4 * n * n)

        for i in 0..<n {
            let cuts = Array(grid[i]).map { String($0) }
            for j in 0..<cuts.count {
                let cut = cuts[j]
                let base = (i * n + j) * 4
                switch cut {
                case " ":
                    union.unit(base, base + 1)
                    union.unit(base, base + 2)
                    union.unit(base, base + 3)
                case "\\":
                    union.unit(base, base + 1)
                    union.unit(base + 2, base + 3)
                case "/":
                    union.unit(base, base + 3)
                    union.unit(base + 1, base + 2)
                default: fatalError("not valid")
                }
                if i != 0 { union.unit(base, ((i - 1) * n + j) * 4 + 2) }
                if j != 0 { union.unit(base + 3, (i * n + j - 1) * 4 + 1) }
                if i != n - 1 { union.unit(base + 2, ((i + 1) * n + j) * 4) }
                if j != n - 1 { union.unit(base + 1, (i * n + j + 1) * 4 + 3) }
            }
        }
        
        return union.setCount
    }
    
    
    private class Union {
        private var union: [Int] = []
        var setCount: Int
        

        init(_ n: Int) {
            setCount = n
            for i in 0..<n { union.append(i) }
        }
        

        func find(_ i: Int) -> Int {
            if union[i] != i { union[i] = find(union[i]) }
            return union[i]
        }
        

        func unit(_ i1: Int, _ i2: Int) {
            if find(i1) != find(i2) {
                union[find(i1)] = find(i2)
                setCount -= 1
            }
        }
    }

}