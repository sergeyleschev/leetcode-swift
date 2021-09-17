class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1593. Split a String Into the Max Number of Unique Substrings
    // Given a string s, return the maximum number of unique substrings that the given string can be split into.
    // You can split string s into any list of non-empty substrings, where the concatenation of the substrings forms the original string. However, you must split the substrings such that all of them are unique.

    // A substring is a contiguous sequence of characters within a string.

    // Example 1:
    // Input: s = "ababccc"
    // Output: 5
    // Explanation: One way to split maximally is ['a', 'b', 'ab', 'c', 'cc']. Splitting like ['a', 'b', 'a', 'b', 'c', 'cc'] is not valid as you have 'a' and 'b' multiple times.

    // Example 2:
    // Input: s = "aba"
    // Output: 2
    // Explanation: One way to split maximally is ['a', 'ba'].

    // Example 3:
    // Input: s = "aa"
    // Output: 1
    // Explanation: It is impossible to split the string any further.

    // Constraints:
    // 1 <= s.length <= 16
    // s contains only lower case English letters.

    func maxUniqueSplit(_ s: String) -> Int {
        var seen = Set<String>()
        return helper(s: s, seen: &seen)
    }


    private func helper(s: String, seen: inout Set<String>) -> Int {
        guard !s.isEmpty else { return 0 }
        var ans = 0
        var index = s.startIndex

        while index < s.endIndex {
            let candidate = String(s[...index])
            if !seen.contains(candidate) {
                seen.insert(candidate)
                ans = max(ans, 1 + helper(s: String(s[s.index(after: index)...]), seen: &seen))
                seen.remove(candidate)
            }
            index = s.index(after: index)
        }
        return ans
    }
    
}