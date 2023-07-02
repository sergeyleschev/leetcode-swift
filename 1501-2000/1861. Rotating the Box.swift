class Solution {

    // Solution by Sergey Leschev

    // 1861. Rotating the Box
    // You are given an m x n matrix of characters box representing a side-view of a box. Each cell of the box is one of the following:
    // A stone '#'
    // A stationary obstacle '*'
    // Empty '.'
    // The box is rotated 90 degrees clockwise, causing some of the stones to fall due to gravity. Each stone falls down until it lands on an obstacle, another stone, or the bottom of the box. Gravity does not affect the obstacles' positions, and the inertia from the box's rotation does not affect the stones' horizontal positions.
    // It is guaranteed that each stone in box rests on an obstacle, another stone, or the bottom of the box.

    // Return an n x m matrix representing the box after the rotation described above.

    // Example 1:
    // Input: box = [["#",".","#"]]
    // Output: [["."],
    //          ["#"],
    //          ["#"]]

    // Example 2:
    // Input: box = [["#",".","*","."],
    //               ["#","#","*","."]]
    // Output: [["#","."],
    //          ["#","#"],
    //          ["*","*"],
    //          [".","."]]

    // Example 3:
    // Input: box = [["#","#","*",".","*","."],
    //               ["#","#","#","*",".","."],
    //               ["#","#","#",".","#","."]]
    // Output: [[".","#","#"],
    //          [".","#","#"],
    //          ["#","#","*"],
    //          ["#","*","."],
    //          ["#",".","*"],
    //          ["#",".","."]]

    // Constraints:
    // m == box.length
    // n == box[i].length
    // 1 <= m, n <= 500
    // box[i][j] is either '#', '*', or '.'.

    func rotateTheBox(_ box: [[Character]]) -> [[Character]] {
        let m = box.count
        let n = box[0].count
        var ans = [[Character]](repeating: [Character](repeating: " ", count: m), count: n)
        for r in 0..<m {
            let rel = getCol(from: box[r])
            for idx in 0..<n { ans[idx][m - 1 - r] = rel[idx] }
        }
        return ans
    }

    private func getCol(from row: [Character]) -> [Character] {
        let m = row.count
        var prefix = [0]
        var cnt = 0
        var ans = [Character](repeating: ".", count: m)

        for ch in row {
            if ch == "#" {
                cnt += 1
            } else if ch == "*" {
                cnt = 0
            }
            prefix.append(cnt)
        }

        for idx in 0..<m {
            if row[idx] == "*" {
                if prefix[idx] > 0 {
                    for i in 0..<prefix[idx] { ans[idx - 1 - i] = "#" }
                }
                ans[idx] = "*"
            } else if idx == m - 1 {
                if prefix[idx + 1] > 0 {
                    for i in 0..<prefix[idx + 1] { ans[idx - i] = "#" }
                }
            }
        }
        return ans
    }

}
