class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 242. Valid Anagram
    // Given two strings s and t, return true if t is an anagram of s, and false otherwise.

    // Finds if t is an anagram of s.

    // - Parameters:
    //   - s: A string.
    //   - t: A string.
    // - Returns: True if t is an anagram of s, otherwise returns false.

    // Example 1:
    // Input: s = "anagram", t = "nagaram"
    // Output: true

    // Example 2:
    // Input: s = "rat", t = "car"
    // Output: false

    // Constraints:
    // 1 <= s.length, t.length <= 5 * 10^4
    // s and t consist of lowercase English letters.

    // Follow up: What if the inputs contain Unicode characters? How would you adapt your solution to such a case?

    // - Complexity:
    //   - time: O(n), where n is the length of s.
    //   - space: O(n), where n is the length of s.
    
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var dict = [Character: Int]()

        for ch in s { dict[ch, default: 0] += 1 }
        
        for ch in t {
            guard let val = dict[ch] else { return false }
            dict[ch] = val > 1 ? val - 1 : nil
        }
        
        return dict.isEmpty
    }

}