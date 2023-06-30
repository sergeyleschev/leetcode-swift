class Solution {

    // Solution by Sergey Leschev

    // 318. Maximum Product of Word Lengths
    // Given a string array words, return the maximum value of length(word[i]) * length(word[j]) where the two words do not share common letters. If no such two words exist, return 0.

    // Example 1:
    // Input: words = ["abcw","baz","foo","bar","xtfn","abcdef"]
    // Output: 16
    // Explanation: The two words can be "abcw", "xtfn".

    // Example 2:
    // Input: words = ["a","ab","abc","d","cd","bcd","abcd"]
    // Output: 4
    // Explanation: The two words can be "ab", "cd".

    // Example 3:
    // Input: words = ["a","aa","aaa","aaaa"]
    // Output: 0
    // Explanation: No such pair of words.

    // Constraints:
    // 2 <= words.length <= 1000
    // 1 <= words[i].length <= 1000
    // words[i] consists only of lowercase English letters.

    func maxProduct(_ words: [String]) -> Int {
        var maxLen: [Int: Int] = [:]
        var maxValue = 0
        
        for item in words {
            var mask = 0
            for char in item.utf8 { mask |= 1 << Int(char - 97) }
            
            if maxLen[mask] == nil { maxLen[mask] = item.count }
            else { maxLen[mask] = max(maxLen[mask]!, item.count) }
        }
        
        for item1 in maxLen {
            for item2 in maxLen {
                if (item1.key & item2.key) == 0 {
                    maxValue = max(maxValue, item1.value * item2.value)
                }
            }
        }
        
        return maxValue
    }
    
}