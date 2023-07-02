class Solution {

    // Solution by Sergey Leschev

    // 520. Detect Capital
    // We define the usage of capitals in a word to be right when one of the following cases holds:
    // All letters in this word are capitals, like "USA".
    // All letters in this word are not capitals, like "leetcode".
    // Only the first letter in this word is capital, like "Google".
    // Given a string word, return true if the usage of capitals in it is right.

    // Finds whether the usage of capital letters is right or not.

    // - Parameter word: The word.
    // - Returns: True if the usage of capitals is right, otherwise returns false.

    // Example 1:
    // Input: word = "USA"
    // Output: true

    // Example 2:
    // Input: word = "FlaG"
    // Output: false

    // Constraints:
    // 1 <= word.length <= 100
    // word consists of lowercase and uppercase English letters.

    // - Complexity:
    //   - time: O(n), where n is the length of the word.
    //   - space: O(1), only constant space is used.

    func detectCapitalUse(_ word: String) -> Bool {
        guard word.count > 1 else { return true }
        let word = Array(word)

        for i in 1..<word.count {
            if word[i].isUppercase, word[i - 1].isUppercase { continue }
            if word[i].isLowercase && (i == 1 || word[i - 1].isLowercase) { continue }
            return false
        }

        return true
    }

}
