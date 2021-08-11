class Solution {

    // 1931. Painting a Grid With Three Different Colors
    // You are given two integers m and n. Consider an m x n grid where each cell is initially white. You can paint each cell red, green, or blue. All cells must be painted.
    // Return the number of ways to color the grid with no two adjacent cells having the same color. Since the answer can be very large, return it modulo 10^9 + 7.

    // Example 1:
    // Input: m = 1, n = 1
    // Output: 3
    // Explanation: The three possible colorings are shown in the image above.

    // Example 2:
    // Input: m = 1, n = 2
    // Output: 6
    // Explanation: The six possible colorings are shown in the image above.

    // Example 3:
    // Input: m = 5, n = 5
    // Output: 580986

    // Constraints:
    // 1 <= m <= 5
    // 1 <= n <= 1000

    private static var adjacentStates = Array<[String:[String]]>(repeating: [:], count: 6)
    private let mod = 1_000_000_007
    
 
    func colorTheGrid(_ m: Int, _ n: Int) -> Int {
        let row = max(m, n)
        let col = min(m, n)
        if Solution.adjacentStates[col].isEmpty { Solution.adjacentStates[col] = getAdjacentStates(of: getPossibleStates(col)) }
        let curAdjacentStates = Solution.adjacentStates[col]
        guard row > 1 else { return curAdjacentStates.count }
        var lastRow = [String: Int]()
        curAdjacentStates.forEach { (s, _) in lastRow[s] = 1 }
        for _ in 2...row {
            var curRow = [String: Int]()
            for (s,cnt) in lastRow {
                guard let nextRows = curAdjacentStates[s] else { continue }
                for nr in nextRows { curRow.updateValue(((curRow[nr] ?? 0) + cnt) % mod, forKey: nr) }
            }
            lastRow = curRow
        }
        return lastRow.values.reduce(0) { ($0 + $1) % mod }
    }
    

    private func getPossibleStates(_ n: Int) -> [String] {
        var ans = [String]()
        let max = Int(pow(3.0, Double(n)))
        
        func check(_ s: String) -> Bool {
            var last = s.first!
            for ch in s.dropFirst() {
                guard ch != last else { return false }
                last = ch
            }
            return true
        }
        for i in 0..<max {
            var state = String.init(i, radix: 3)
            if state.count < n { state = String(repeating: "0", count: n - state.count) + state }
            if check(state) { ans.append(state) }
        }
        return ans
    }


    private func getAdjacentStates(of rowStates: [String]) -> [String: [String]] {
        let n = rowStates.count
        var ans = [String: [String]]()
        for f in 0..<n {
            var s = f + 1
            while s < n {
                if check(rowStates[f], rowStates[s]) {
                    ans[rowStates[f],default: []].append(rowStates[s])
                    ans[rowStates[s],default: []].append(rowStates[f])
                }
                s += 1
            }
        }
        return ans
    }
    

    private func check(_ first: String, _ second: String) -> Bool {
        var firstIdx = first.startIndex
        var secondIdx = second.startIndex
        while firstIdx < first.endIndex {
            guard first[firstIdx] != second[secondIdx] else { return false }
            firstIdx = first.index(after: firstIdx)
            secondIdx = second.index(after: secondIdx)
        }
        return true
    }

}