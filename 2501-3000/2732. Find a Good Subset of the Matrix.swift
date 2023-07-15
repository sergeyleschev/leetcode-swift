class Solution {

    // Solution by Sergey Leschev
    // 2732. Find a Good Subset of the Matrix
    // O(N), Greedy

    func goodSubsetofBinaryMatrix(_ grid: [[Int]]) -> [Int] {
        let n = grid[0].count
        let N = 1 << n
        var firstIndex = Array(repeating: -1, count: N)

        for i in (0..<grid.count).reversed() {
            let encoded = encode(grid[i])
            firstIndex[encoded] = i
        }

        if firstIndex[0] != -1 {
            return [firstIndex[0]]
        }

        for a in 1..<N {
            if firstIndex[a] == -1 {
                continue
            }

            for b in (a + 1)..<N {
                if firstIndex[b] == -1 {
                    continue
                }

                if (a & b) == 0 {
                    let ra = firstIndex[a]
                    let rb = firstIndex[b]
                    return [min(ra, rb), max(ra, rb)]
                }
            }
        }

        return []
    }

    private func encode(_ row: [Int]) -> Int {
        var x = 0
        for i in 0..<row.count {
            if row[i] == 0 {
                continue
            }
            x |= 1 << i
        }
        return x
    }
}
