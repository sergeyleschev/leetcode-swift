class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 467. Unique Substrings in Wraparound String
    // We define the string s to be the infinite wraparound string of "abcdefghijklmnopqrstuvwxyz", so s will look like this:
    // "...zabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcd....".
    // Given a string p, return the number of unique non-empty substrings of p are present in s.

    // Example 1:
    // Input: p = "a"
    // Output: 1
    // Explanation: Only the substring "a" of p is in s.

    // Example 2:
    // Input: p = "cac"
    // Output: 2
    // Explanation: There are two substrings ("a", "c") of p in s.

    // Example 3:
    // Input: p = "zab"
    // Output: 6
    // Explanation: There are six substrings ("z", "a", "b", "za", "ab", and "zab") of p in s.

    // Constraints:
    // 1 <= p.length <= 10^5
    // p consists of lowercase English letters.

    func findSubstringInWraproundString(_ p: String) -> Int {
        var len = 0
        var alphabet = Array(repeating: 0, count: 26)
        let chars = Array(p)
        var dp = [Int]()
        
        for (i, char) in chars.enumerated() {
            guard let ascii = UnicodeScalar(String(char))?.value else { continue }
            let value = Int(ascii) - 97
            if i > 0 && (value - dp.last! == 1 || dp.last! - value == 25) {
               len += 1
            } else {
                len = 1
            }
            alphabet[value] = max(len, alphabet[value])
            dp.append(value)
        }
        
        return alphabet.reduce(0, +)
    }
    
}