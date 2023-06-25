class Solution {

    // Solution @ Sergey Leschev

    // 383. Ransom Note
    // Given two stings ransomNote and magazine, return true if ransomNote can be constructed from magazine and false otherwise.
    // Each letter in magazine can only be used once in ransomNote.

    // Findes if ransom note can be constructed from the magazines.

    // - Parameters:
    //   - ransomNote: Ransom note string
    //   - magazine: Magazine string
    // - Returns: True if the ransom note can be constructed, otherwise returns false.

    // Example 1:
    // Input: ransomNote = "a", magazine = "b"
    // Output: false

    // Example 2:
    // Input: ransomNote = "aa", magazine = "ab"
    // Output: false

    // Example 3:
    // Input: ransomNote = "aa", magazine = "aab"
    // Output: true

    // Constraints:
    // 1 <= ransomNote.length, magazine.length <= 10^5
    // ransomNote and magazine consist of lowercase English letters.

    // - Complexity:
    //   - time: O(m), where m is the number of letters in magazine.
    //   - space: O(m), where m is the number of letters in magazine.

    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        guard magazine.count >= ransomNote.count else { return false }

        var dict = [Character: Int]()

        for mag in magazine { dict[mag, default: 0] += 1 }

        for ran in ransomNote {
            guard let val = dict[ran] else { return false }
            dict[ran] = val == 1 ? nil : val - 1
        }

        return true
    }

}