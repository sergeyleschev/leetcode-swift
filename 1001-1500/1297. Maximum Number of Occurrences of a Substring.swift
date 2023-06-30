class Solution {

    // Solution by Sergey Leschev

    // 1297. Maximum Number of Occurrences of a Substring
    // Given a string s, return the maximum number of ocurrences of any substring under the following rules:
    // The number of unique characters in the substring must be less than or equal to maxLetters.
    // The substring size must be between minSize and maxSize inclusive.

    // Example 1:
    // Input: s = "aababcaab", maxLetters = 2, minSize = 3, maxSize = 4
    // Output: 2
    // Explanation: Substring "aab" has 2 ocurrences in the original string.
    // It satisfies the conditions, 2 unique letters and size 3 (between minSize and maxSize).

    // Example 2:
    // Input: s = "aaaa", maxLetters = 1, minSize = 3, maxSize = 3
    // Output: 2
    // Explanation: Substring "aaa" occur 2 times in the string. It can overlap.

    // Example 3:
    // Input: s = "aabcabcab", maxLetters = 2, minSize = 2, maxSize = 3
    // Output: 3

    // Example 4:
    // Input: s = "abcde", maxLetters = 2, minSize = 3, maxSize = 3
    // Output: 0

    // Constraints:
    // 1 <= s.length <= 10^5
    // 1 <= maxLetters <= 26
    // 1 <= minSize <= maxSize <= min(26, s.length)
    // s only contains lowercase English letters.

    func maxFreq(_ s: String, _ maxLetters: Int, _ minSize: Int, _ maxSize: Int) -> Int {
        var substrsCount = [String: Int]()
        var subStr = ""
        var charsCounter = [Character: Int]()

        for ch in s {
            subStr.append(ch)
            charsCounter.updateValue(1 + (charsCounter[ch] ?? 0), forKey: ch)
            
            if subStr.count == minSize {
                if charsCounter.count <= maxLetters {
                    substrsCount.updateValue(1 + (substrsCount[subStr]  ?? 0), forKey: subStr)
                }

                let ch = subStr.removeFirst()
                if let c = charsCounter[ch] {
                    if c == 1 {
                        charsCounter.removeValue(forKey: ch)
                    } else {
                        charsCounter.updateValue(c - 1, forKey: ch)
                    }
                }
            }
        }
        
        return substrsCount.values.max() ?? 0
    }
    
 }