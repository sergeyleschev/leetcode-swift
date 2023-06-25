class Solution {

    // Solution @ Sergey Leschev

    // 139. Word Break
    // Given a string s and a dictionary of strings wordDict, return true if s can be segmented into a space-separated sequence of one or more dictionary words.
    // Note that the same word in the dictionary may be reused multiple times in the segmentation.

    // Determines if s can be segmented into a space-separated sequence of one or more dictionary words.

    // - Parameters:
    //   - s: A non-empty string.
    //   - wordDict: A dictionary containing a list of non-empty words.
    // - Returns: True if `s` can be segmented, otherwise returns false.

    // Example 1:
    // Input: s = "leetcode", wordDict = ["leet","code"]
    // Output: true
    // Explanation: Return true because "leetcode" can be segmented as "leet code".

    // Example 2:
    // Input: s = "applepenapple", wordDict = ["apple","pen"]
    // Output: true
    // Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
    // Note that you are allowed to reuse a dictionary word.

    // Example 3:
    // Input: s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
    // Output: false

    // Constraints:
    // 1 <= s.length <= 300
    // 1 <= wordDict.length <= 1000
    // 1 <= wordDict[i].length <= 20
    // s and wordDict[i] consist of only lowercase English letters.
    // All the strings of wordDict are unique.

    // - Complexity:
    //   - time: O(n ^ 2), where n is the length of s.
    //   - space: O(n), where n is the length of s.
    
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var dp = [Bool](repeating: false, count: s.count+1)
        dp[0] = true

        let chars = Array(s)
        let wordSet = Set(wordDict)

        for i in 1...s.count {
            for j in 0..<i {
                guard dp[j], wordSet.contains(String(chars[j..<i])) else { continue }
                dp[i] = true
                break
            }
        }

        return dp[s.count]
    }

}