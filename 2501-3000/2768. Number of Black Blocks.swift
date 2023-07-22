class Solution {

    // Solution by Sergey Leschev
    // 2768. Number of Black Blocks

    func countBlackBlocks(_ m: Int, _ n: Int, _ coordinates: [[Int]]) -> [Int] {
        var mp = [Int: Int]()

        for c in coordinates {
            if c[0] < m - 1 && c[1] < n - 1 { mp[c[1] * 1_000_000 + c[0], default: 0] += 1 }
            if c[0] - 1 >= 0 && c[1] < n - 1 { mp[c[1] * 1_000_000 + c[0] - 1, default: 0] += 1 }
            if c[1] - 1 >= 0 && c[0] < m - 1 { mp[(c[1] - 1) * 1_000_000 + c[0], default: 0] += 1 }
            if c[0] - 1 >= 0 && c[1] - 1 >= 0 {
                mp[(c[1] - 1) * 1_000_000 + c[0] - 1, default: 0] += 1
            }
        }

        var ans = [Int](repeating: 0, count: 5)
        for (_, count) in mp { ans[count] += 1 }

        ans[0] = (m - 1) * (n - 1)
        ans[0] -= ans[1] + ans[2] + ans[3] + ans[4]

        return ans
    }
}
