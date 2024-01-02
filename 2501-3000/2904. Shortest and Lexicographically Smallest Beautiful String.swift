class Solution {

    // Solution by Sergey Leschev
    // 2904. Shortest and Lexicographically Smallest Beautiful String

    func shortestBeautifulSubstring(_ s: String, _ k: Int) -> String {
        var l = 0
        var r = 0
        var onesCount = 0
        var shortestLength = Int.max
        var startIndex = -1
        var ans = [String]()

        while r < s.count {
            let char = s[s.index(s.startIndex, offsetBy: r)]
            if char == "1" {
                onesCount += 1
            }

            while onesCount == k {
                if r - l + 1 <= shortestLength {
                    if r - l + 1 < shortestLength {
                        ans.removeAll()  // Start a new set of substrings if shorter
                    }
                    shortestLength = r - l + 1
                    startIndex = l
                    ans.append(
                        String(
                            s[
                                s.index(
                                    s.startIndex, offsetBy: startIndex)..<s.index(
                                        s.startIndex, offsetBy: startIndex + shortestLength)]))
                }

                let leftChar = s[s.index(s.startIndex, offsetBy: l)]
                if leftChar == "1" {
                    onesCount -= 1
                }

                l += 1
            }

            r += 1
        }

        if startIndex == -1 {
            return ""
        }

        ans.sort()

        for i in 0..<ans.count {
            if ans[i].count == shortestLength {
                return ans[i]
            }
        }

        return ""
    }
}
