class Solution {

    // Solution by Sergey Leschev
    // 2730. Find the Longest Semi-Repetitive Substring

    func longestSemiRepetitiveSubstring(_ s: String) -> Int {
        var ans = 1
        var i = 0
        var j = 1
        var last = 0

        let sArray = Array(s)

        while j < sArray.count {
            if sArray[j] == sArray[j - 1] {
                if last != 0 {
                    i = last
                }
                last = j
            }
            ans = max(ans, j - i + 1)
            j += 1
        }

        return ans
    }
}
