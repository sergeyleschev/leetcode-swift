class Solution {

    // 1638. Count Substrings That Differ by One Character
    // Given two strings s and t, find the number of ways you can choose a non-empty substring of s and replace a single character by a different character such that the resulting substring is a substring of t. In other words, find the number of substrings in s that differ from some substring in t by exactly one character.
    // For example, the underlined substrings in "computer" and "computation" only differ by the 'e'/'a', so this is a valid way.
    // A substring is a contiguous sequence of characters within a string.

    // Return the number of substrings that satisfy the condition above.

    // Example 1:
    // Input: s = "aba", t = "baba"
    // Output: 6
    // Explanation: The following are the pairs of substrings from s and t that differ by exactly 1 character:
    // ("aba", "baba")
    // ("aba", "baba")
    // ("aba", "baba")
    // ("aba", "baba")
    // ("aba", "baba")
    // ("aba", "baba")
    // The underlined portions are the substrings that are chosen from s and t.
    // Example 2:
    // Input: s = "ab", t = "bb"
    // Output: 3
    // Explanation: The following are the pairs of substrings from s and t that differ by 1 character:
    // ("ab", "bb")
    // ("ab", "bb")
    // ("ab", "bb")
    // The underlined portions are the substrings that are chosen from s and t.

    // Example 3:
    // Input: s = "a", t = "a"
    // Output: 0

    // Example 4:
    // Input: s = "abe", t = "bbc"
    // Output: 10

    // Constraints:
    // 1 <= s.length, t.length <= 100
    // s and t consist of lowercase English letters only.

    private typealias ReturnResult = [String:[Int]]
    private var sChars = [Character]()
    private var tChars = [Character]()

    
    func countSubstrings(_ s: String, _ t: String) -> Int {
        self.sChars = [Character](s)
        self.tChars = [Character](t)
        var ans = 0
        let n = s.count
        
        for length in 1...n { ans += check(length) }
        return ans
    }


    private func getSubstringCounter(by length: Int, source: [Character]) -> ReturnResult {
        guard length <= source.count else { return [:] }
        var ans = ReturnResult()
        let n = source.count

        for left in 0...(n - length) {
            let right = left + length - 1
            var chars = [Character](source[left...right])
            for idx in 0..<length {
                let ch = chars[idx]
                let chIdx = Int((ch.asciiValue! - 97))
                chars[idx] = "*"
                let key = String(chars)
                ans[key, default: Array<Int>(repeating: 0, count: 26)][chIdx] += 1
                chars[idx] = ch
            }
        }
        return ans
    }


    private func check(_ length: Int) -> Int {
        let sCounter = getSubstringCounter(by: length, source: sChars)
        let tCounter = getSubstringCounter(by: length, source: tChars)
        var ans = 0
        
        for (subStrMaskOfS,sCounter) in sCounter {
            guard let tCounter = tCounter[subStrMaskOfS] else { continue }
            let total = tCounter.reduce(0) { $0 + $1}
            (0...25).forEach { (idx) in
                if sCounter[idx] > 0 { ans += sCounter[idx] * (total - tCounter[idx]) }
            }
        }
        return ans
    }

}