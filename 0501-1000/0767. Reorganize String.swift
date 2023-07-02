class Solution {

    // Solution by Sergey Leschev

    // 767. Reorganize String
    // Given a string s, rearrange the characters of s so that any two adjacent characters are not the same.
    // Return any possible rearrangement of s or return "" if not possible.

    // Example 1:
    // Input: s = "aab"
    // Output: "aba"

    // Example 2:
    // Input: s = "aaab"
    // Output: ""

    // Constraints:
    // 1 <= s.length <= 500
    // s consists of lowercase English letters.

    func reorganizeString(_ S: String) -> String {
        var ans: [Character] = []
        var cache: [Character: Int] = [:]

        for c in S { cache[c] = cache[c].map { $0 + 1 } ?? 1 }

        for count in cache.values {
            if count > S.count / 2 + S.count % 2 { return "" }
        }

        var sorted = cache.sorted(by: { $0.1 > $1.1 })
        guard sorted.count > 1 else { return String(sorted[0].key) }

        while !sorted.isEmpty {
            if sorted[0].value > 0 {
                ans.append(sorted[0].key)
                sorted[0].value -= 1
            } else {
                break
            }

            if sorted[1].value > 0 {
                ans.append(sorted[1].key)
                sorted[1].value -= 1
            }

            sorted.sort(by: { $0.1 > $1.1 })
        }

        return String(ans)
    }

}
