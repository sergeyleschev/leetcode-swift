class Solution {

    // Solution by Sergey Leschev

    // 884. Uncommon Words from Two Sentences
    // A sentence is a string of single-space separated words where each word consists only of lowercase letters.
    // A word is uncommon if it appears exactly once in one of the sentences, and does not appear in the other sentence.
    // Given two sentences s1 and s2, return a list of all the uncommon words. You may return the answer in any order.

    // Example 1:
    // Input: s1 = "this apple is sweet", s2 = "this apple is sour"
    // Output: ["sweet","sour"]

    // Example 2:
    // Input: s1 = "apple apple", s2 = "banana"
    // Output: ["banana"]

    // Constraints:
    // 1 <= s1.length, s2.length <= 200
    // s1 and s2 consist of lowercase English letters and spaces.
    // s1 and s2 do not have leading or trailing spaces.
    // All the words in s1 and s2 are separated by a single space.

    func uncommonFromSentences(_ A: String, _ B: String) -> [String] {
        guard !A.isEmpty && !B.isEmpty else { return [] }
        let wordCount = [A, B].joined(separator: " ").components(separatedBy: " ").reduce(into: [:])
        { dict, word in dict[word, default: 0] += 1 }
        return Array(wordCount.filter { $0.value == 1 }.keys)
    }

}
