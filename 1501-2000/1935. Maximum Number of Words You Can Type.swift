class Solution {

    // Solution by Sergey Leschev

    // 1935. Maximum Number of Words You Can Type
    // There is a malfunctioning keyboard where some letter keys do not work. All other keys on the keyboard work properly.
    // Given a string text of words separated by a single space (no leading or trailing spaces) and a string brokenLetters of all distinct letter keys that are broken, return the number of words in text you can fully type using this keyboard.

    // Example 1:
    // Input: text = "hello world", brokenLetters = "ad"
    // Output: 1
    // Explanation: We cannot type "world" because the 'd' key is broken.

    // Example 2:
    // Input: text = "leet code", brokenLetters = "lt"
    // Output: 1
    // Explanation: We cannot type "leet" because the 'l' and 't' keys are broken.

    // Example 3:
    // Input: text = "leet code", brokenLetters = "e"
    // Output: 0
    // Explanation: We cannot type either word because the 'e' key is broken.

    // Constraints:
    // 1 <= text.length <= 10^4
    // 0 <= brokenLetters.length <= 26
    // text consists of words separated by a single space without any leading or trailing spaces.
    // Each word only consists of lowercase English letters.
    // brokenLetters consists of distinct lowercase English letters.

    func canBeTypedWords(_ text: String, _ brokenLetters: String) -> Int {
        let broken = Set(brokenLetters.map { $0 })
        var index = text.startIndex
        var brokenWordCount = 0
        var wordCount = 0

        while index < text.endIndex {
            let char = text[index]
            if char == " " {
                wordCount += 1
            } else if broken.contains(char) {
                brokenWordCount += 1
                var findSpace = false
                while index < text.endIndex {
                    let char = text[index]
                    if char == " " { findSpace = true; break }
                    index = text.index(index, offsetBy: 1)
                }
                if findSpace { continue }
            }
            if index < text.endIndex { index = text.index(index, offsetBy: 1) }
        }
        if index == text.endIndex && index != text.startIndex { wordCount += 1 }
        let result = wordCount - brokenWordCount
        return result
    }

}