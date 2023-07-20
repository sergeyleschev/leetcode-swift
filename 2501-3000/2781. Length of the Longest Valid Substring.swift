class Solution {

    // Solution by Sergey Leschev
    // 2781. Length of the Longest Valid Substring

    func longestValidSubstring(_ word: String, _ forbidden: [String]) -> Int {
        let forbiddenSet = Set(forbidden)
        var res = 0
        var right = word.count - 1
        let wordArray = Array(word)

        for left in stride(from: word.count - 1, through: 0, by: -1) {
            for k in left...min(left + 9, right) {
                let substring = String(wordArray[left...k])
                if forbiddenSet.contains(substring) {
                    right = k - 1
                    break
                }
            }
            res = max(res, right - left + 1)
        }

        return res
    }
}
