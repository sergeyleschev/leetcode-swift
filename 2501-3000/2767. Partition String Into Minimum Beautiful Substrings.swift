class Solution {

    // Solution by Sergey Leschev
    // 2767. Partition String Into Minimum Beautiful Substrings

    // Time complexity: O(n^2)
    // Space complexity: O(n)

    func minimumBeautifulSubstrings(_ s: String) -> Int {
        let n = s.count
        var dp = [Int](repeating: n + 1, count: n + 1)
        dp[0] = 0

        for (i, char) in s.enumerated() {
            if char == "0" { continue }
            var cur = 0
            var index = i
            while index < n {
                cur = cur * 2 + Int(String(s[s.index(s.startIndex, offsetBy: index)]))!
                if 15625 % cur == 0 {
                    dp[index + 1] = min(dp[index + 1], dp[i] + 1)
                }
                index += 1
            }
        }

        return dp[n] > n ? -1 : dp[n]
    }
}
