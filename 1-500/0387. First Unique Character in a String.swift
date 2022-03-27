class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 387. First Unique Character in a String
    // Given a string s, return the first non-repeating character in it and return its index. If it does not exist, return -1.

    // Finds the first non-repeating character in a string.
    // - Parameter s: The string.
    // - Returns: Index of first non-repeating character, if non-repeating character doesn't exist returns -1.

    // Example 1:
    // Input: s = "leetcode"
    // Output: 0

    // Example 2:
    // Input: s = "loveleetcode"
    // Output: 2

    // Example 3:
    // Input: s = "aabb"
    // Output: -1

    // Constraints:
    // 1 <= s.length <= 10^5
    // s consists of only lowercase English letters.

    // - Complexity:
    //   - time: O(n), where n is the number of letters in s.
    //   - space: O(n), where n is the number of letters in s.

    func firstUniqChar(_ s: String) -> Int {
        var dict = [Character: Int]()

        for c in s { dict[c, default: 0] += 1 }

        for (i, c) in s.enumerated() {
            guard dict[c] == 1 else { continue }
            return i
        }

        return -1
    }

}