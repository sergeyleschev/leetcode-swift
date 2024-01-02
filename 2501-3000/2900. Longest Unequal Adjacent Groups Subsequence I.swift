class Solution {

    // Solution by Sergey Leschev
    // 2900. Longest Unequal Adjacent Groups Subsequence I

    func getWordsInLongestSubsequence(_ n: Int, _ words: [String], _ groups: [Int]) -> [String] {
        var ans: [String] = []
        var last = groups[0]
        ans.append(words[0])

        for i in 1..<words.count {
            if last != groups[i] {
                last = groups[i]
                ans.append(words[i])
            }
        }

        return ans
    }
}
