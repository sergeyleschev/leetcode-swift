class Solution {

    // Solution by Sergey Leschev

    // 438. Find All Anagrams in a String
    // Given two strings s and p, return an array of all the start indices of p's anagrams in s. You may return the answer in any order.

    // Example 1:
    // Input: s = "cbaebabacd", p = "abc"
    // Output: [0,6]
    // Explanation:
    // The substring with start index = 0 is "cba", which is an anagram of "abc".
    // The substring with start index = 6 is "bac", which is an anagram of "abc".

    // Example 2:
    // Input: s = "abab", p = "ab"
    // Output: [0,1,2]
    // Explanation:
    // The substring with start index = 0 is "ab", which is an anagram of "ab".
    // The substring with start index = 1 is "ba", which is an anagram of "ab".
    // The substring with start index = 2 is "ab", which is an anagram of "ab".

    // Constraints:
    // 1 <= s.length, p.length <= 3 * 10^4
    // s and p consist of lowercase English letters.

    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        let s = s.map { $0.asciiValue ?? 0 }
        let p = p.map { $0.asciiValue ?? 0 }

        var ref = Array(repeating: 0, count: 256)
        for char in p { ref[Int(char)] += 1 }

        var result = [Int]()
        var map = ref.map { _ in 0 }

        for i in 0..<s.count {
            map[Int(s[i])] += 1

            if i - p.count >= 0 {
                map[Int(s[i - p.count])] -= 1
            }

            if map == ref {
                result.append(i - p.count + 1)
            }
        }

        return result
    }

}
