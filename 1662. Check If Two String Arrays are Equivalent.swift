class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1662. Check If Two String Arrays are Equivalent
    // Given two string arrays word1 and word2, return true if the two arrays represent the same string, and false otherwise.
    // A string is represented by an array if the array elements concatenated in order forms the string.

    // Finds if two string arrays are equivalent.

    // - Parameters:
    //   - word1: An array of string.
    //   - word2: An array of string.
    // - Returns: True if the two arrays represent the same string, otherwise returns false.

    // Example 1:
    // Input: word1 = ["ab", "c"], word2 = ["a", "bc"]
    // Output: true
    // Explanation:
    // word1 represents string "ab" + "c" -> "abc"
    // word2 represents string "a" + "bc" -> "abc"
    // The strings are the same, so return true.

    // Example 2:
    // Input: word1 = ["a", "cb"], word2 = ["ab", "c"]
    // Output: false

    // Example 3:
    // Input: word1  = ["abc", "d", "defg"], word2 = ["abcddefg"]
    // Output: true
     
    // Constraints:
    // 1 <= word1.length, word2.length <= 10^3
    // 1 <= word1[i].length, word2[i].length <= 10^3
    // 1 <= sum(word1[i].length), sum(word2[i].length) <= 10^3
    // word1[i] and word2[i] consist of lowercase letters.

    // - Complexity:
    //   - time: O(n), where n is the number of characters in word1 and word2.
    //   - space: O(n), where n is the number of characters in word1 and word2.
    
    func arrayStringsAreEqual(_ word1: [String], _ word2: [String]) -> Bool {
        word1.joined(separator: "") == word2.joined(separator: "")
    }

}