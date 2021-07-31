class Solution {

    // 1592. Rearrange Spaces Between Words
    // You are given a string text of words that are placed among some number of spaces. Each word consists of one or more lowercase English letters and are separated by at least one space. It's guaranteed that text contains at least one word.
    // Rearrange the spaces so that there is an equal number of spaces between every pair of adjacent words and that number is maximized. If you cannot redistribute all the spaces equally, place the extra spaces at the end, meaning the returned string should be the same length as text.

    // Return the string after rearranging the spaces.

    // Example 1:
    // Input: text = "  this   is  a sentence "
    // Output: "this   is   a   sentence"
    // Explanation: There are a total of 9 spaces and 4 words. We can evenly divide the 9 spaces between the words: 9 / (4-1) = 3 spaces.

    // Example 2:
    // Input: text = " practice   makes   perfect"
    // Output: "practice   makes   perfect "
    // Explanation: There are a total of 7 spaces and 3 words. 7 / (3-1) = 3 spaces plus 1 extra space. We place this extra space at the end of the string.

    // Example 3:
    // Input: text = "hello   world"
    // Output: "hello   world"

    // Example 4:
    // Input: text = "  walks  udp package   into  bar a"
    // Output: "walks  udp  package  into  bar  a "

    // Example 5:
    // Input: text = "a"
    // Output: "a"

    // Constraints:
    // 1 <= text.length <= 100
    // text consists of lowercase English letters and ' '.
    // text contains at least one word.

    func reorderSpaces(_ text: String) -> String {
        var text = Array(text)
        var spaceCount = 0
        var wordCount = 0
        var isWord = false
        var i = 0
        
        for i in 0..<text.count {
            if text[i].isWhitespace {
                spaceCount += 1
                isWord = false
            } else {
                if !isWord { wordCount += 1 }
                isWord = true
            }
        }
        
        guard wordCount > 0 else { return String(text) }
        isWord = false
        let spacing = wordCount == 1 ? spaceCount :  spaceCount / (wordCount - 1)
        
        while i < text.count {
            if i == 0 && text[i].isWhitespace { text.remove(at: i); continue }
            var count = 0
            while i < text.count && text[i].isWhitespace {
                if count < spacing {
                    spaceCount -= 1
                    count += 1
                    i += 1
                } else { text.remove(at: i) }
            }
            while i < text.count && count != 0 && count < spacing {
                text.insert(Character(" "), at: i)
                spaceCount -= 1
                count += 1
                i += 1
            }
            count = 0
            i += 1
        }
        
        if spaceCount > 0 { text.append(contentsOf: [Character](repeating: Character(" "), count: spaceCount)) }
        if spaceCount < 0 { text.removeLast(-spaceCount) }
        return String(text)
    }
}