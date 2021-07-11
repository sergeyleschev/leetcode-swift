class Solution {

    // 1392. Longest Happy Prefix
    // A string is called a happy prefix if is a non-empty prefix which is also a suffix (excluding itself).
    // Given a string s, return the longest happy prefix of s. Return an empty string "" if no such prefix exists.

    // Example 1:
    // Input: s = "level"
    // Output: "l"
    // Explanation: s contains 4 prefix excluding itself ("l", "le", "lev", "leve"), and suffix ("l", "el", "vel", "evel"). The largest prefix which is also suffix is given by "l".

    // Example 2:
    // Input: s = "ababab"
    // Output: "abab"
    // Explanation: "abab" is the largest prefix which is also suffix. They can overlap in the original string.

    // Example 3:
    // Input: s = "leetcodeleet"
    // Output: "leet"

    // Example 4:
    // Input: s = "a"
    // Output: ""

    // Constraints:
    // 1 <= s.length <= 10^5
    // s contains only lowercase English letters.

    func longestPrefix(_ s: String) -> String {
        guard s.count > 1 else { return "" }
        let N = s.count
        let chars = [Character](s)
        var next = [Int](repeating: -1, count: N)
        var k = -1

        for index in 1..<N {
            while k != -1 && chars[k + 1] != chars[index] { k = next[k] }
            if chars[k + 1] == chars[index] { k += 1 }
            next[index] = k
        }

        return next[N - 1] == -1 ? "" : String(chars[0...next[N - 1]])
    }
    
}