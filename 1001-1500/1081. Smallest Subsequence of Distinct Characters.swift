class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1081. Smallest Subsequence of Distinct Characters
    // Return the lexicographically smallest subsequence of s that contains all the distinct characters of s exactly once.

    // Removes duplicate letters from the given string so that every letter appears only once.

    // - Parameter s: The string.
    // - Returns: The lexicographically smallest subsequence of s.

    // Example 1:
    // Input: s = "bcabc"
    // Output: "abc"

    // Example 2:
    // Input: s = "cbacdcbc"
    // Output: "acdb"

    // Constraints:
    // 1 <= s.length <= 1000
    // s consists of lowercase English letters.
    
    // - Complexity:
    //   - time: O(n), where n is the length of the s.
    //   - space: O(1), only constant space is used.
    
    func smallestSubsequence(_ s: String) -> String {
        var stack = [Character]()
        var seen = Set<Character>()
        var lastOccurrence = [Character: Int]()
        var ans = ""

        for (i, ch) in s.enumerated() { lastOccurrence[ch] = i }

        for (i, ch) in s.enumerated() {
            guard !seen.contains(ch) else { continue }
            while !stack.isEmpty,
                  let last = stack.last,
                  ch < last,
                  lastOccurrence[last, default: 0] > i {
                seen.remove(last)
                stack.removeLast()
            }
            seen.insert(ch)
            stack.append(ch)
        }

        for ch in stack { ans = "\(ans)\(ch)" }
        return ans
    }
    
}