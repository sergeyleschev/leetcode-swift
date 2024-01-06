class Solution {

    // Solution by Sergey Leschev
    // 2923. Find Champion I

    func findChampion(_ grid: [[Int]]) -> Int {
        for i in 0..<grid.count {
            if grid[i].reduce(0, +) == grid.count - 1 {
                return i
            }
        }
        return -1  // Return an appropriate value if no champion is found
    }
}
