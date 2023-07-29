class Solution {

    // Solution by Sergey Leschev
    // 2707. Extra Characters in a String
    // Bottom-up

    func minExtraChar(_ s: String, _ dictionary: [String]) -> Int {
        var mp: [String: Int] = [:]
        for word in dictionary {
            mp[word, default: 0] += 1
        }

        let n = s.count
        var dp = Array(repeating: 0, count: n + 1)

        for index in (0..<n).reversed() {
            var currStr = ""
            var minExtra = n
            var cutIdx = index

            while cutIdx < n {
                let currIndex = s.index(s.startIndex, offsetBy: cutIdx)
                currStr.append(s[currIndex])

                let currExtra = mp[currStr] != nil ? 0 : currStr.count
                let nextExtra = dp[cutIdx + 1]
                let totalExtra = currExtra + nextExtra

                minExtra = min(minExtra, totalExtra)
                cutIdx += 1
            }

            dp[index] = minExtra
        }

        return dp[0]
    }
}
