class Solution {

    // Solution by Sergey Leschev

    // 1177. Can Make Palindrome from Substring
    // Given a string s, we make queries on substrings of s.
    // For each query queries[i] = [left, right, k], we may rearrange the substring s[left], ..., s[right], and then choose up to k of them to replace with any lowercase English letter.
    // If the substring is possible to be a palindrome string after the operations above, the result of the query is true. Otherwise, the result is false.
    // Return an array answer[], where answer[i] is the result of the i-th query queries[i].
    // Note that: Each letter is counted individually for replacement so if for example s[left..right] = "aaa", and k = 2, we can only replace two of the letters.  (Also, note that the initial string s is never modified by any query.)

    // Example:
    // Input: s = "abcda", queries = [[3,3,0],[1,2,0],[0,3,1],[0,3,2],[0,4,1]]
    // Output: [true,false,false,true,true]
    // Explanation:
    // queries[0] : substring = "d", is palindrome.
    // queries[1] : substring = "bc", is not palindrome.
    // queries[2] : substring = "abcd", is not palindrome after replacing only 1 character.
    // queries[3] : substring = "abcd", could be changed to "abba" which is palindrome. Also this can be changed to "baab" first rearrange it "bacd" then replace "cd" with "ab".
    // queries[4] : substring = "abcda", could be changed to "abcba" which is palindrome.

    // Constraints:
    // 1 <= s.length, queries.length <= 10^5
    // 0 <= queries[i][0] <= queries[i][1] < s.length
    // 0 <= queries[i][2] <= s.length
    // s only contains lowercase English letters.

    func canMakePaliQueries(_ s: String, _ queries: [[Int]]) -> [Bool] {
        let baseCharacter: Character = "a"
        var masks = [Int](repeating: 0, count: s.count + 1)
        var results = [Bool](repeating: false, count: queries.count)

        for (i, character) in s.enumerated() {
            masks[i + 1] = masks[i] ^ (1 << (character.asciiValue! - baseCharacter.asciiValue!))
        }

        for (i, query) in queries.enumerated() {
            let lhs = query[0]
            let rhs = query[1]
            let availableSubstitutions = query[2]
            let requiredSubstitutions = (masks[rhs + 1] ^ masks[lhs]).nonzeroBitCount / 2
            results[i] = requiredSubstitutions <= availableSubstitutions
        }

        return results
    }

}
