class Solution {

    // Solution by Sergey Leschev

    // 336. Palindrome Pairs
    // Given a list of unique words, return all the pairs of the distinct indices (i, j) in the given list, so that the concatenation of the two words words[i] + words[j] is a palindrome.

    // Example 1:
    // Input: words = ["abcd","dcba","lls","s","sssll"]
    // Output: [[0,1],[1,0],[3,2],[2,4]]
    // Explanation: The palindromes are ["dcbaabcd","abcddcba","slls","llssssll"]

    // Example 2:
    // Input: words = ["bat","tab","cat"]
    // Output: [[0,1],[1,0]]
    // Explanation: The palindromes are ["battab","tabbat"]

    // Example 3:
    // Input: words = ["a",""]
    // Output: [[0,1],[1,0]]

    // Constraints:
    // 1 <= words.length <= 5000
    // 0 <= words[i].length <= 300
    // words[i] consists of lower-case English letters.

    func palindromePairs(_ words: [String]) -> [[Int]] {
        var states = Array(
            repeating: Array(repeating: false, count: words.count), count: words.count)
        var dict = [String: Int]()
        var ans = [[Int]]()

        for (i, word) in words.enumerated() {
            dict[word] = i
            states[i][i] = true
        }

        for (i, word) in words.enumerated() {
            var palin = findPalinMatch(word: word)
            for str in palin {
                if let d = dict[str], !states[d][i] {
                    ans.append([d, i])
                    states[d][i] = true
                }
            }
            palin = findPalinMatch(word: String(word.reversed()))
            for str in palin {
                let rstr = String(str.reversed())
                if let d = dict[rstr], !states[i][d] {
                    ans.append([i, d])
                    states[i][d] = true
                }
            }
        }

        return ans
    }

    private func findPalinMatch(word: String) -> [String] {
        let chars = Array((word + "#" + String(word.reversed())))
        var p = Array(repeating: 0, count: chars.count)
        var res = [String]()

        for i in 1..<chars.count {
            var j = p[i - 1]
            while j > 0 && chars[i] != chars[j] { j = p[j - 1] }
            p[i] = chars[i] != chars[j] ? 0 : j + 1
        }

        var i = p.last!
        while i > 0 {
            res.append(String(chars[chars.count - word.count..<chars.count - i]))
            i = p[i - 1]
        }
        res.append(String(chars[chars.count - word.count..<chars.count]))

        return res
    }

}
