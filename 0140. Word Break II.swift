class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 140. Word Break II
    // Given a string s and a dictionary of strings wordDict, add spaces in s to construct a sentence where each word is a valid dictionary word. Return all such possible sentences in any order.
    // Note that the same word in the dictionary may be reused multiple times in the segmentation.

    // Adds spaces in s to construct a sentence where each word is a valid dictionary word.

    // - Parameters:
    //   - s: A non-empty string.
    //   - wordDict: A dictionary containing a list of non-empty words.
    // - Returns: All possible sentences.

    // Example 1:
    // Input: s = "catsanddog", wordDict = ["cat","cats","and","sand","dog"]
    // Output: ["cats and dog","cat sand dog"]

    // Example 2:
    // Input: s = "pineapplepenapple", wordDict = ["apple","pen","applepen","pine","pineapple"]
    // Output: ["pine apple pen apple","pineapple pen apple","pine applepen apple"]
    // Explanation: Note that you are allowed to reuse a dictionary word.

    // Example 3:
    // Input: s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
    // Output: []

    // Constraints:
    // 1 <= s.length <= 20
    // 1 <= wordDict.length <= 1000
    // 1 <= wordDict[i].length <= 10
    // s and wordDict[i] consist of only lowercase English letters.
    // All the strings of wordDict are unique.

    /// - Complexity:
    ///   - time: O(2 ^ n), where n is the length of the wordDict.
    ///   - space: O(2 ^ n), where n is the length of the wordDict.

    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        var dict = [String: [String]]()
        return dfs(s, wordDict, &dict)
    }


    private func dfs(_ s: String, _ wordDict: [String], _ dict: inout [String: [String]]) -> [String] {
        if let val = dict[s] { return val }
        guard !s.isEmpty else { return [""] }
        var ans = [String]()

        for word in wordDict {
            guard s.hasPrefix(word) else { continue }
            let sublist = dfs(String(s.dropFirst(word.count)), wordDict, &dict)
            for sub in sublist {
                ans.append("\(word)\(sub.isEmpty ? "" : " ")\(sub)")
            }
        }

        dict[s] = ans
        return ans
    }

}