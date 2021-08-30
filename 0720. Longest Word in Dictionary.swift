class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 720. Longest Word in Dictionary
    // Given an array of strings words representing an English Dictionary, return the longest word in words that can be built one character at a time by other words in words.
    // If there is more than one possible answer, return the longest word with the smallest lexicographical order. If there is no answer, return the empty string.

    // Example 1:
    // Input: words = ["w","wo","wor","worl","world"]
    // Output: "world"
    // Explanation: The word "world" can be built one character at a time by "w", "wo", "wor", and "worl".

    // Example 2:
    // Input: words = ["a","banana","app","appl","ap","apply","apple"]
    // Output: "apple"
    // Explanation: Both "apply" and "apple" can be built from other words in the dictionary. However, "apple" is lexicographically smaller than "apply".

    // Constraints:
    // 1 <= words.length <= 1000
    // 1 <= words[i].length <= 30
    // words[i] consists of lowercase English letters.

    func longestWord(_ words: [String]) -> String {
        var ans = ""
        var dict = ["": 0]
        
        for word in words.sorted(by: {$0.count < $1.count}) {
            let s = String(word[word.startIndex..<word.index(before: word.endIndex)])
            if dict[s] != nil {
                dict[word] = 0
                if ans.count == word.count {
                    ans = ans < word ? ans : word
                } else if ans.count < word.count {
                    ans = word
                }
            }
        }
        
        return ans
    }
    
}