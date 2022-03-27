class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1763. Longest Nice Substring
    // A string s is nice if, for every letter of the alphabet that s contains, it appears both in uppercase and lowercase. For example, "abABB" is nice because 'A' and 'a' appear, and 'B' and 'b' appear. However, "abA" is not because 'b' appears, but 'B' does not.
    // Given a string s, return the longest substring of s that is nice. If there are multiple, return the substring of the earliest occurrence. If there are none, return an empty string.

    // Example 1:
    // Input: s = "YazaAay"
    // Output: "aAa"
    // Explanation: "aAa" is a nice string because 'A/a' is the only letter of the alphabet in s, and both 'A' and 'a' appear.
    // "aAa" is the longest nice substring.

    // Example 2:
    // Input: s = "Bb"
    // Output: "Bb"
    // Explanation: "Bb" is a nice string because both 'B' and 'b' appear. The whole string is a substring.

    // Example 3:
    // Input: s = "c"
    // Output: ""
    // Explanation: There are no nice substrings.

    // Example 4:
    // Input: s = "dDzeE"
    // Output: "dD"
    // Explanation: Both "dD" and "eE" are the longest nice substrings.
    // As there are multiple longest nice substrings, return "dD" since it occurs earlier.

    // Constraints:
    // 1 <= s.length <= 100
    // s consists of uppercase and lowercase English letters.

    func longestNiceSubstring(_ s: String) -> String {
        guard s.count > 1  else { return "" }
        let chars = [Character](s)
        let n = s.count
        let values = chars.map { $0.asciiValue! }
        
        
        func valid(_ length: Int) -> String {
            for idx in 0...(n - length) {
                let tempValues = Set<UInt8>(values[idx..<(idx + length)]).sorted()
                guard tempValues.count % 2 == 0 else { continue }
                let m = tempValues.count
                let half = m >> 1
                var flag = true
                for l in 0..<half {
                    guard tempValues[l + half] - tempValues[l] == 32 else  {
                        flag = false
                        break
                    }
                }
                if flag { return String(chars[idx..<(idx + length)]) }
            }
            return ""
        }
        
        for length in stride(from: n, through: 2, by: -1) {
            let ans = valid(length)
            guard ans.isEmpty else { return ans }
        }
        return ""
    }

}