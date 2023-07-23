class Solution {

    // Solution by Sergey Leschev
    // 2791. Count Paths That Can Form a Palindrome in a Tree

    func countPalindromePaths(_ parent: [Int], _ s: String) -> Int {
        let n = s.count
        var con = [[Int]](repeating: [], count: n)
        for i in 1..<n {
            con[parent[i]].append(i)
        }

        func dfs(_ x: Int, _ mask: Int, _ s: [Character], _ con: [[Int]], _ have: inout [Int: Int])
            -> Int
        {
            var r = 0
            var mask = mask
            if x > 0 {
                mask ^= 1 << (s[x].asciiValue! - Character("a").asciiValue!)
                var i = 1 << 25
                while i > 0 {
                    if let count = have[mask ^ i] {
                        r += count
                    }
                    i >>= 1
                }
                r += have[mask, default: 0]
                have[mask, default: 0] += 1
            }

            for y in con[x] {
                r += dfs(y, mask, s, con, &have)
            }
            return r
        }

        var have: [Int: Int] = [0: 1]
        return dfs(0, 0, Array(s), con, &have)
    }
}
