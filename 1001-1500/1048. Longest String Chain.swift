class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1048. Longest String Chain
    // You are given an array of words where each word consists of lowercase English letters.
    // wordA is a predecessor of wordB if and only if we can insert exactly one letter anywhere in wordA without changing the order of the other characters to make it equal to wordB.
    // For example, "abc" is a predecessor of "abac", while "cba" is not a predecessor of "bcad".
    // A word chain is a sequence of words [word1, word2, ..., wordk] with k >= 1, where word1 is a predecessor of word2, word2 is a predecessor of word3, and so on. A single word is trivially a word chain with k == 1.
    // Return the length of the longest possible word chain with words chosen from the given list of words.

    // Example 1:
    // Input: words = ["a","b","ba","bca","bda","bdca"]
    // Output: 4
    // Explanation: One of the longest word chains is ["a","ba","bda","bdca"].

    // Example 2:
    // Input: words = ["xbc","pcxbcf","xb","cxbc","pcxbc"]
    // Output: 5
    // Explanation: All the words can be put in a word chain ["xb", "xbc", "cxbc", "pcxbc", "pcxbcf"].

    // Example 3:
    // Input: words = ["abcd","dbqca"]
    // Output: 1
    // Explanation: The trivial word chain ["abcd"] is one of the longest word chains.
    // ["abcd","dbqca"] is not a valid word chain because the ordering of the letters is changed.

    // Constraints:
    // 1 <= words.length <= 1000
    // 1 <= words[i].length <= 16
    // words[i] only consists of lowercase English letters.

    // Solution: DP
    // Sort the words by word's length. (also can apply bucket sort)
    // For each word, loop on all possible previous word with 1 letter missing.
    // If we have seen this previous word, update the longest chain for the current word.
    // Finally return the longest word chain.

    // - Complexity:
    //   - time: O(nlogn + n*word.len)
    //   - space: O(n)

    func longestStrChain(_ words: [String]) -> Int {
        var words = words.sorted(by: { first, second -> Bool in first.count < second.count })
        var len = 0
        var dp = [String: Int]()
        
        for word in words {
            var temp = 0
            for i in word.indices {
                var str = word
                str.remove(at: i)
                temp = max(temp, dp[str, default: 0] + 1)
            }
            dp[word] = temp
            len = max(len, temp)
        }

        return len
    }
    
}