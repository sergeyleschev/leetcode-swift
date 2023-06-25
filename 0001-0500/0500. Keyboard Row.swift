class Solution {

    // Solution @ Sergey Leschev

    // 500. Keyboard Row
    // Given an array of strings words, return the words that can be typed using letters of the alphabet on only one row of American keyboard like the image below.
    // In the American keyboard:
    // the first row consists of the characters "qwertyuiop",
    // the second row consists of the characters "asdfghjkl", and
    // the third row consists of the characters "zxcvbnm".

    // Example 1:
    // Input: words = ["Hello","Alaska","Dad","Peace"]
    // Output: ["Alaska","Dad"]

    // Example 2:
    // Input: words = ["omk"]
    // Output: []

    // Example 3:
    // Input: words = ["adsdf","sfd"]
    // Output: ["adsdf","sfd"]

    // Constraints:
    // 1 <= words.length <= 20
    // 1 <= words[i].length <= 100
    // words[i] consists of English letters (both lowercase and uppercase). 

    func findWords(_ words: [String]) -> [String] {
        let rules =  ["QWERTYUIOP", "ASDFGHJKL", "ZXCVBNM"]
        var result = words

        
        func checkWords(word: String) -> Bool {
            let rule = rules.filter { $0.range(of: String(word.first!)) != nil }
            for c in word where (rule.first!.range(of: String(c))) == nil { return true }
            return false
        }
        
        words.forEach { word in
            if (checkWords(word: word.uppercased())) { result = result.filter { $0 != word } }
        }
        
        return result
    }

}