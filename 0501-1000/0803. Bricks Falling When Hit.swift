class Solution {

    // Solution @ Sergey Leschev

    // 803. Bricks Falling When Hit
    // You are given an m x n binary grid, where each 1 represents a brick and 0 represents an empty space. A brick is stable if:
    // It is directly connected to the top of the grid, or
    // At least one other brick in its four adjacent cells is stable.
    // You are also given an array hits, which is a sequence of erasures we want to apply. Each time we want to erase the brick at the location hits[i] = (rowi, coli). The brick on that location (if it exists) will disappear. Some other bricks may no longer be stable because of that erasure and will fall. Once a brick falls, it is immediately erased from the grid (i.e., it does not land on other stable bricks).
    // Return an array result, where each result[i] is the number of bricks that will fall after the ith erasure is applied.
    // Note that an erasure may refer to a location with no brick, and if it does, no bricks drop.

    // Example 1:
    // Input: grid = [[1,0,0,0],[1,1,1,0]], hits = [[1,0]]
    // Output: [2]
    // Explanation: Starting with the grid:
    // [[1,0,0,0],
    //  [1,1,1,0]]
    // We erase the underlined brick at (1,0), resulting in the grid:
    // [[1,0,0,0],
    //  [0,1,1,0]]
    // The two underlined bricks are no longer stable as they are no longer connected to the top nor adjacent to another stable brick, so they will fall. The resulting grid is:
    // [[1,0,0,0],
    //  [0,0,0,0]]
    // Hence the result is [2].

    // Example 2:
    // Input: grid = [[1,0,0,0],[1,1,0,0]], hits = [[1,1],[1,0]]
    // Output: [0,0]
    // Explanation: Starting with the grid:
    // [[1,0,0,0],
    //  [1,1,0,0]]
    // We erase the underlined brick at (1,1), resulting in the grid:
    // [[1,0,0,0],
    //  [1,0,0,0]]
    // All remaining bricks are still stable, so no bricks fall. The grid remains the same:
    // [[1,0,0,0],
    //  [1,0,0,0]]
    // Next, we erase the underlined brick at (1,0), resulting in the grid:
    // [[1,0,0,0],
    //  [0,0,0,0]]
    // Once again, all remaining bricks are still stable, so no bricks fall.
    // Hence the result is [0,0].

    // Constraints:
    // m == grid.length
    // n == grid[i].length
    // 1 <= m, n <= 200
    // grid[i][j] is 0 or 1.
    // 1 <= hits.length <= 4 * 10^4
    // hits[i].length == 2
    // 0 <= xi <= m - 1
    // 0 <= yi <= n - 1
    // All (xi, yi) are unique.

    func hitBricks(_ grid: [[Int]], _ hits: [[Int]]) -> [Int] {
        var copy = grid
        let row = grid.count
        let col = grid[0].count
        let size = row * col
        let unionFind = UnionFind(count: size + 1)
        let directions = [[0,1], [1,0], [-1, 0], [0,-1]]
        let getIndex = { (x: Int, y: Int) -> Int in return x * col + y }
        
        for hit in hits { copy[hit[0]][hit[1]] = 0 }
        
        for i in 0..<col where copy[0][i] == 1 { unionFind.union(num1: getIndex(0, i), num2: size) }
        
        for i in 1..<row {
            for j in 0..<col where copy[i][j] == 1 {
                let cur = getIndex(i, j)
                if j > 0 && copy[i][j - 1] == 1 { unionFind.union(num1: cur, num2: getIndex(i, j - 1)) }
                if copy[i - 1][j] == 1 { unionFind.union(num1: cur, num2: getIndex(i - 1, j)) }
            }
        }
        
        var res = Array(repeating: 0, count: hits.count)
        for i in stride(from: hits.count - 1, to: -1, by: -1) {
            let hit = hits[i]
            if grid[hit[0]][hit[1]] == 0 { continue }
            let ori = unionFind.getSize(with: size)
            if hit[0] == 0 { unionFind.union(num1: getIndex(0, hit[1]), num2: size) }
            for direction in directions {
                let x = hit[0] + direction[0]
                let y = hit[1] + direction[1]
                if x >= 0 && y >= 0 && x < row && y < col && copy[x][y] == 1 {
                    unionFind.union(num1: getIndex(hit[0], hit[1]), num2: getIndex(x, y))
                }
            }
            let cur = unionFind.getSize(with: size)
            res[i] = max(cur - ori - 1, 0)
            copy[hit[0]][hit[1]] = 1
        }
        return res
    }
}


private class UnionFind {
    private var size: [Int]
    private var parent: [Int]
    
    
    init(count: Int) {
        self.parent = Array(repeating: 0, count: count)
        self.size = Array(repeating: 1, count: count)
        for i in 0..<count { parent[i] = i }
    }
    
    
    func find(num: Int) -> Int {
        if num != parent[num] { parent[num] = find(num: parent[num]) }
        return parent[num]
    }
    
    
    func union(num1: Int, num2: Int) {
        let fnum1 = find(num: num1)
        let fnum2 = find(num: num2)
        if fnum1 != fnum2 {
            parent[fnum1] = fnum2
            size[fnum2] += size[fnum1]
        }
    }
    
    
    func getSize(with num:Int) -> Int { size[find(num: num)] }

}