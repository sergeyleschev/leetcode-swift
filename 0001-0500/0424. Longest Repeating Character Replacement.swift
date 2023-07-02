class Solution {

    // Solution by Sergey Leschev

    // 424. Longest Repeating Character Replacement
    // You are given a string s and an integer k. You can choose any character of the string and change it to any other uppercase English character. You can perform this operation at most k times.
    // Return the length of the longest substring containing the same letter you can get after performing the above operations.

    // Example 1:
    // Input: s = "ABAB", k = 2
    // Output: 4
    // Explanation: Replace the two 'A's with two 'B's or vice versa.

    // Example 2:
    // Input: s = "AABABBA", k = 1
    // Output: 4
    // Explanation: Replace the one 'A' in the middle with 'B' and form "AABBBBA".
    // The substring "BBBB" has the longest repeating letters, which is 4.

    // Constraints:
    // 1 <= s.length <= 10^5
    // s consists of only uppercase English letters.
    // 0 <= k <= s.length

    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var dict = Array(repeating: 0, count: 26)
        var ans = 0
        var l = 0
        var chars = Array(s.unicodeScalars)
        var maxCount = 0

        for (r, char) in chars.enumerated() {
            let ascii = Int(char.value) - 65
            dict[ascii] += 1
            maxCount = max(maxCount, dict[ascii])

            while r - l + 1 - dict[Int(chars[l].value) - 65] > k {
                dict[Int(chars[l].value) - 65] -= 1
                l += 1
            }
        }

        return min(chars.count, maxCount + k)
    }

}
