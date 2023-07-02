class Solution {

    // Solution by Sergey Leschev

    // 290. Word Pattern
    // Given a pattern and a string s, find if s follows the same pattern.
    // Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in s.

    // Finds if str follows the pattern.
    // - Parameters:
    //   - pattern: The pattern.
    //   - str: The string.
    // - Returns: True if str follows the pattern, otherwise returns false.

    // Example 1:
    // Input: pattern = "abba", s = "dog cat cat dog"
    // Output: true

    // Example 2:
    // Input: pattern = "abba", s = "dog cat cat fish"
    // Output: false

    // Example 3:
    // Input: pattern = "aaaa", s = "dog cat cat dog"
    // Output: false

    // Example 4:
    // Input: pattern = "abba", s = "dog dog dog dog"
    // Output: false

    // Constraints:
    // 1 <= pattern.length <= 300
    // pattern contains only lower-case English letters.
    // 1 <= s.length <= 3000
    // s contains only lower-case English letters and spaces ' '.
    // s does not contain any leading or trailing spaces.
    // All the words in s are separated by a single space.

    // - Complexity:
    //   - time: O(n), where n is the length of the pattern and the str.
    //   - space: O(n), where n is the length of the pattern and the str.

    func wordPattern(_ pattern: String, _ str: String) -> Bool {
        var dict = [String: Int]()
        let str = str.split(separator: " ")

        guard pattern.count == str.count else { return false }

        for (i, ch) in pattern.enumerated() {
            let c = "\(ch)_"
            let w = "_\(str[i])"

            if !dict.keys.contains(c) {
                dict[c] = i
            }

            if !dict.keys.contains(w) {
                dict[w] = i
            }

            guard dict[c] != dict[w] else { continue }
            return false
        }

        return true
    }

}
