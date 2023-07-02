class Solution {

    // Solution by Sergey Leschev

    // 451. Sort Characters By Frequency
    // Given a string s, sort it in decreasing order based on the frequency of characters, and return the sorted string.

    // Example 1:
    // Input: s = "tree"
    // Output: "eert"
    // Explanation: 'e' appears twice while 'r' and 't' both appear once.
    // So 'e' must appear before both 'r' and 't'. Therefore "eetr" is also a valid answer.

    // Example 2:
    // Input: s = "cccaaa"
    // Output: "aaaccc"
    // Explanation: Both 'c' and 'a' appear three times, so "aaaccc" is also a valid answer.
    // Note that "cacaca" is incorrect, as the same characters must be together.

    // Example 3:
    // Input: s = "Aabb"
    // Output: "bbAa"
    // Explanation: "bbaA" is also a valid answer, but "Aabb" is incorrect.
    // Note that 'A' and 'a' are treated as two different characters.

    // Constraints:
    // 1 <= s.length <= 5 * 10^5
    // s consists of English letters and digits.

    func frequencySort(_ s: String) -> String {
        var dict = [Character: Int]()
        var result = [Character]()

        s.forEach { (char) in
            if dict[char] == nil {
                dict[char] = 1
            } else {
                dict[char] = dict[char]! + 1
            }
        }

        let sortDict = dict.sorted(by: {
            (dict1: (key1: Character, value1: Int), dict2: (key2: Character, value2: Int)) -> Bool
            in
            return dict1.value1 > dict2.value2
        })

        for dict in sortDict {
            for _ in 0..<dict.value { result.append(dict.key) }
        }

        return String(result)
    }

}
