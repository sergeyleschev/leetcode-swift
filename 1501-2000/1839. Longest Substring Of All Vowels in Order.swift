class Solution {

    // Solution by Sergey Leschev

    // 1839. Longest Substring Of All Vowels in Order
    // A string is considered beautiful if it satisfies the following conditions:
    // Each of the 5 English vowels ('a', 'e', 'i', 'o', 'u') must appear at least once in it.
    // The letters must be sorted in alphabetical order (i.e. all 'a's before 'e's, all 'e's before 'i's, etc.).
    // For example, strings "aeiou" and "aaaaaaeiiiioou" are considered beautiful, but "uaeio", "aeoiu", and "aaaeeeooo" are not beautiful.
    // Given a string word consisting of English vowels, return the length of the longest beautiful substring of word. If no such substring exists, return 0.
    // A substring is a contiguous sequence of characters in a string.

    // Example 1:
    // Input: word = "aeiaaioaaaaeiiiiouuuooaauuaeiu"
    // Output: 13
    // Explanation: The longest beautiful substring in word is "aaaaeiiiiouuu" of length 13.

    // Example 2:
    // Input: word = "aeeeiiiioooauuuaeiou"
    // Output: 5
    // Explanation: The longest beautiful substring in word is "aeiou" of length 5.

    // Example 3:
    // Input: word = "a"
    // Output: 0
    // Explanation: There is no beautiful substring, so return 0.

    // Constraints:
    // 1 <= word.length <= 5 * 10^5
    // word consists of characters 'a', 'e', 'i', 'o', and 'u'.

    func longestBeautifulSubstring(_ word: String) -> Int {
        var ans = Int.min
        var l = word.startIndex
        var visited = Set<Character>()

        while l < word.endIndex {
            visited.insert(word[l])
            var r = word.index(after: l)
            var last = l
            while r < word.endIndex && word[r].asciiValue! >= word[last].asciiValue! {
                if !visited.contains(word[r]) { visited.insert(word[r]) }
                last = r
                r = word.index(after: r)
            }
            if visited.count == 5 { ans = max(ans, word.distance(from: l, to: r)) }
            l = r
            visited = []
        }
        return max(ans, 0)
    }

}
