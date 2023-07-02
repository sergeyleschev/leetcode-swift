class Solution {

    // Solution by Sergey Leschev

    // 345. Reverse Vowels of a String
    // Given a string s, reverse only all the vowels in the string and return it.
    // The vowels are 'a', 'e', 'i', 'o', and 'u', and they can appear in both cases.

    // Example 1:
    // Input: s = "hello"
    // Output: "holle"

    // Example 2:
    // Input: s = "leetcode"
    // Output: "leotcede"

    // Constraints:
    // 1 <= s.length <= 3 * 10^5
    // s consist of printable ASCII characters.

    func reverseVowels(_ s: String) -> String {
        guard !s.isEmpty else { return s }
        var str = s
        let vowels = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        var end = str.index(before: s.endIndex)
        var start = str.startIndex
        var left = ""
        var right = ""

        while start < end {
            while start < end {
                if vowels.contains(String(str[start])) {
                    left = String(str[start])
                    break
                }
                start = str.index(after: start)
            }

            while start < end {
                if vowels.contains(String(str[end])) {
                    right = String(str[end])
                    break
                }
                end = str.index(before: end)
            }

            if start != end {
                str.replaceSubrange(start...start, with: right)
                str.replaceSubrange(end...end, with: left)
                start = str.index(after: start)
                end = str.index(before: end)
            }
        }

        return str
    }

}
