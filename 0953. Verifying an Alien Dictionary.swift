class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 953. Verifying an Alien Dictionary
    // In an alien language, surprisingly they also use english lowercase letters, but possibly in a different order. The order of the alphabet is some permutation of lowercase letters.
    // Given a sequence of words written in the alien language, and the order of the alphabet, return true if and only if the given words are sorted lexicographicaly in this alien language.

    // Example 1:
    // Input: words = ["hello","leetcode"], order = "hlabcdefgijkmnopqrstuvwxyz"
    // Output: true
    // Explanation: As 'h' comes before 'l' in this language, then the sequence is sorted.

    // Example 2:
    // Input: words = ["word","world","row"], order = "worldabcefghijkmnpqstuvxyz"
    // Output: false
    // Explanation: As 'd' comes after 'l' in this language, then words[0] > words[1], hence the sequence is unsorted.

    // Example 3:
    // Input: words = ["apple","app"], order = "abcdefghijklmnopqrstuvwxyz"
    // Output: false
    // Explanation: The first three characters "app" match, and the second string is shorter (in size.) According to lexicographical rules "apple" > "app", because 'l' > '∅', where '∅' is defined as the blank character which is less than any other character (More info).

    // Constraints:
    // 1 <= words.length <= 100
    // 1 <= words[i].length <= 20
    // order.length == 26
    // All characters in words[i] and order are English lowercase letters.
    
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        let orderArray = Array(order)
        var lastWord = words[0]
        
        for i in 1..<words.count {
            let currentWord = words[i]
            let minCountChar = min(currentWord.count, lastWord.count)
            
            for j in 0..<minCountChar {
                let indexCurrent = Array(currentWord)[j]
                let indexLast = Array(lastWord)[j]
                let costCurrent = orderArray.firstIndex(of: indexCurrent) ?? 0
                let costLast = orderArray.firstIndex(of: indexLast) ?? 0
                
                if costCurrent > costLast { break }
                else if costCurrent < costLast || (j == minCountChar - 1 && currentWord.count < lastWord.count) { return false }
            }
            
            lastWord = currentWord
        }
        
        return true
    }
    
}