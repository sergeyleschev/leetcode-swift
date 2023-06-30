class Solution {

    // Solution by Sergey Leschev

    // 1941. Check if All Characters Have Equal Number of Occurrences
    // Given a string s, return true if s is a good string, or false otherwise.
    // A string s is good if all the characters that appear in s have the same number of occurrences (i.e., the same frequency).

    // Example 1:
    // Input: s = "abacbc"
    // Output: true
    // Explanation: The characters that appear in s are 'a', 'b', and 'c'. All characters occur 2 times in s.

    // Example 2:
    // Input: s = "aaabb"
    // Output: false
    // Explanation: The characters that appear in s are 'a' and 'b'.
    // 'a' occurs 3 times while 'b' occurs 2 times, which is not the same number of times.

    // Constraints:
    // 1 <= s.length <= 1000
    // s consists of lowercase English letters.

    func areOccurrencesEqual(_ s: String) -> Bool {
        var counter = [Character:Int]()
        for ch in s { counter[ch, default: 0] += 1 }
        let target = counter[s.first!]!

        for (_, cnt) in counter { guard cnt == target else { return false } }
        return true
    }
    
}