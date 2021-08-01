class Solution {

    // 1657. Determine if Two Strings Are Close
    // Two strings are considered close if you can attain one from the other using the following operations:
    // Operation 1: Swap any two existing characters.
    // For example, abcde -> aecdb
    // Operation 2: Transform every occurrence of one existing character into another existing character, and do the same with the other character.
    // For example, aacabb -> bbcbaa (all a's turn into b's, and all b's turn into a's)
    // You can use the operations on either string as many times as necessary.
    // Given two strings, word1 and word2, return true if word1 and word2 are close, and false otherwise.

    // Finds if two strings are close.

    // - Parameters:
    //   - word1: First word.
    //   - word2: Second word.
    // - Returns: True if word1 and word2 are close, otherwise returns false.

    // Example 1:
    // Input: word1 = "abc", word2 = "bca"
    // Output: true
    // Explanation: You can attain word2 from word1 in 2 operations.
    // Apply Operation 1: "abc" -> "acb"
    // Apply Operation 1: "acb" -> "bca"

    // Example 2:
    // Input: word1 = "a", word2 = "aa"
    // Output: false
    // Explanation: It is impossible to attain word2 from word1, or vice versa, in any number of operations.

    // Example 3:
    // Input: word1 = "cabbba", word2 = "abbccc"
    // Output: true
    // Explanation: You can attain word2 from word1 in 3 operations.
    // Apply Operation 1: "cabbba" -> "caabbb"
    // Apply Operation 2: "caabbb" -> "baaccc"
    // Apply Operation 2: "baaccc" -> "abbccc"

    // Example 4:
    // Input: word1 = "cabbba", word2 = "aabbss"
    // Output: false
    // Explanation: It is impossible to attain word2 from word1, or vice versa, in any amount of operations.

    // Constraints:
    // 1 <= word1.length, word2.length <= 10^5
    // word1 and word2 contain only lowercase English letters.

    // - Complexity:
    //   - time: O(n), where n is the max length of word1 and word2.
    //   - space: O(n), where n is the max length of word1 and word2.
    
    func closeStrings(_ word1: String, _ word2: String) -> Bool {
        if word1.count != word2.count { return false }        
        var dict1 = [String: Int]()
        var dict2 = [String: Int]()
        
        for char in word1 {
            if let value = dict1["\(char)"] {
                dict1["\(char)"] = value + 1
            } else {
                dict1["\(char)"] = 1
            }
        }
        
        for char in word2 {
            if let value = dict2["\(char)"] {
                dict2["\(char)"] = value + 1
            } else {
                dict2["\(char)"] = 1
            }
        }
        
        return dict1.compactMap { return $1 }.sorted() == dict2.compactMap { return $1 }.sorted() && dict1.keys.sorted() == dict2.keys.sorted()
    }

}