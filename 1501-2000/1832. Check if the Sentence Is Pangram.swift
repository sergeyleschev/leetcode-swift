class Solution {

    // Solution by Sergey Leschev

    // 1832. Check if the Sentence Is Pangram
    // A pangram is a sentence where every letter of the English alphabet appears at least once.
    // Given a string sentence containing only lowercase English letters, return true if sentence is a pangram, or false otherwise.

    // Example 1:
    // Input: sentence = "thequickbrownfoxjumpsoverthelazydog"
    // Output: true
    // Explanation: sentence contains at least one of every letter of the English alphabet.

    // Example 2:
    // Input: sentence = "leetcode"
    // Output: false

    // Constraints:
    // 1 <= sentence.length <= 1000
    // sentence consists of lowercase English letters.

    func checkIfPangram(_ sentence: String) -> Bool { Set<Character>(sentence).count == 26 }

}
