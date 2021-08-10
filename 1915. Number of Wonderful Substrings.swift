class Solution {

    // 1915. Number of Wonderful Substrings
    // A wonderful string is a string where at most one letter appears an odd number of times.
    // For example, "ccjjc" and "abab" are wonderful, but "ab" is not.
    // Given a string word that consists of the first ten lowercase English letters ('a' through 'j'), return the number of wonderful non-empty substrings in word. If the same substring appears multiple times in word, then count each occurrence separately.
    // A substring is a contiguous sequence of characters in a string.

    // Example 1:
    // Input: word = "aba"
    // Output: 4
    // Explanation: The four wonderful substrings are underlined below:
    // - "aba" -> "a"
    // - "aba" -> "b"
    // - "aba" -> "a"
    // - "aba" -> "aba"

    // Example 2:
    // Input: word = "aabb"
    // Output: 9
    // Explanation: The nine wonderful substrings are underlined below:
    // - "aabb" -> "a"
    // - "aabb" -> "aa"
    // - "aabb" -> "aab"
    // - "aabb" -> "aabb"
    // - "aabb" -> "a"
    // - "aabb" -> "abb"
    // - "aabb" -> "b"
    // - "aabb" -> "bb"
    // - "aabb" -> "b"

    // Example 3:
    // Input: word = "he"
    // Output: 2
    // Explanation: The two wonderful substrings are underlined below:
    // - "he" -> "h"
    // - "he" -> "e"

    // Constraints:
    // 1 <= word.length <= 10^5
    // word consists of lowercase English letters from 'a' to 'j'.

    // Solution: bitmask
    // mask && 0 == 1 means odd "a"
    // mask && 2 == 2 means odd "b"
    // build mask,
    // for loop check to add odd char substring

    // - Complexity:
    //   - time: O(10 n)
    //   - space: O(1), only constant space is used.

    func wonderfulSubstrings(_ word: String) -> Int {
        var mask = 0
        var finded = 0
        var maskCache = Array(repeating: 0, count: 1024)
        let ascii_a = Character("a").asciiValue!
        
        maskCache[0] = 1

        for c in word {
            mask ^= 1<<Int(c.asciiValue! - ascii_a)
            finded += maskCache[mask]
            for i in 0..<10 { finded += maskCache[mask ^ (1<<i)] }
            maskCache[mask] += 1
        }
        return finded
    }

}