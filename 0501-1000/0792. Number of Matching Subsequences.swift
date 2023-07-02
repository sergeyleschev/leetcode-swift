class Solution {

    // Solution by Sergey Leschev

    // 792. Number of Matching Subsequences
    // Given a string s and an array of strings words, return the number of words[i] that is a subsequence of s.
    // A subsequence of a string is a new string generated from the original string with some characters (can be none) deleted without changing the relative order of the remaining characters.
    // For example, "ace" is a subsequence of "abcde".

    // Example 1:
    // Input: s = "abcde", words = ["a","bb","acd","ace"]
    // Output: 3
    // Explanation: There are three strings in words that are a subsequence of s: "a", "acd", "ace".

    // Example 2:
    // Input: s = "dsahjpjauf", words = ["ahjpjau","ja","ahbwzgqnuk","tnmlanowax"]
    // Output: 2

    // Constraints:
    // 1 <= s.length <= 5 * 10^4
    // 1 <= words.length <= 5000
    // 1 <= words[i].length <= 50
    // s and words[i] consist of only lowercase English letters.

    // Set O(mn) O(words) Using set exclude or include the word already seen

    func numMatchingSubseq(_ S: String, _ words: [String]) -> Int {
        let sLen = S.count
        var containSet: Set<String> = []
        var excludeSet: Set<String> = []
        if sLen == 0 || words.count == 0 { return 0 }
        let sArray = Array(S)
        var count = 0

        for word in words {
            if containSet.contains(word) {
                count += 1
                continue
            }
            if excludeSet.contains(word) { continue }
            let wArray = Array(word)
            let wLen = wArray.count
            var w = 0
            var s = 0

            while w < wLen, s < sLen {
                if wArray[w] == sArray[s] { w += 1 }
                s += 1
            }

            if w == wLen {  // pointer stops at the end + 1 of word, that means we got a matching subsequence
                count += 1
                containSet.insert(word)
            } else {
                excludeSet.insert(word)
            }
        }

        return count
    }

}
