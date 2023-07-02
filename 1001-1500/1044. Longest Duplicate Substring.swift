class Solution {

    // Solution by Sergey Leschev

    // 1044. Longest Duplicate Substring
    // Given a string s, consider all duplicated substrings: (contiguous) substrings of s that occur 2 or more times. The occurrences may overlap.
    // Return any duplicated substring that has the longest possible length. If s does not have a duplicated substring, the answer is "".

    // Example 1:
    // Input: s = "banana"
    // Output: "ana"

    // Example 2:
    // Input: s = "abcd"
    // Output: ""

    // Constraints:
    // 2 <= s.length <= 3 * 10^4
    // s consists of lowercase English letters.

    private let base = 26
    private let modulus = 19_260_817
    private let asciiValueOfa = 97
    private var power: [Int]
    private let maxLength = 30_000

    init() {
        power = [Int](repeating: 1, count: maxLength)
        for idx in 1..<maxLength { power[idx] = (power[idx - 1] * base) % modulus }
    }

    func longestDupSubstring(_ s: String) -> String {
        var result: (index: Int, length: Int) = (-1, -1)
        var left = 0
        let nums = s.map({ Int($0.asciiValue!) - asciiValueOfa })

        func initialHash(_ length: Int) -> Int {
            var hash = 0
            for i in 0..<length { hash = ((hash * base) % modulus + nums[i]) % modulus }
            return hash
        }

        func nextHash(_ prevHash: Int, _ dropped: Int, _ added: Int, _ hashMultiplier: Int) -> Int {
            let hash = ((prevHash - hashMultiplier * dropped) % modulus + modulus) % modulus
            return (hash * base + added) % modulus
        }

        func check(_ s1: Int, s2: Int, _ length: Int) -> Bool {
            for offset in 0..<length {
                guard nums[s1 + offset] == nums[s2 + offset] else { return false }
            }
            return true
        }

        func search(_ length: Int) -> Int {
            guard length > 0 && length < s.count else { return -1 }
            var seen = [Int: [Int]]()
            var hash = initialHash(length)
            seen[hash, default: []].append(0)

            for i in 1...(nums.count - length) {
                let endIdx = i + length - 1
                hash = nextHash(hash, nums[i - 1], nums[endIdx], power[length - 1])
                guard let rel = seen[hash] else {
                    seen[hash, default: []].append(i)
                    continue
                }
                for startIdx in rel {
                    guard !check(startIdx, s2: i, length) else { return startIdx }
                }
                seen[hash, default: []].append(i)
            }

            return -1
        }

        var right = nums.count
        while left <= right {
            let length = left + (right - left) >> 1
            let index = search(length)
            if index < 0 {
                right = length - 1
            } else {
                if length > result.length { result = (index, length) }
                left = length + 1
            }
        }

        guard result.length > 0 else { return "" }
        let startIndex = s.index(s.startIndex, offsetBy: result.index)
        let endIndex = s.index(startIndex, offsetBy: result.length)
        return String(s[startIndex..<endIndex])
    }

}
