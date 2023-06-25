class Solution {

    // Solution @ Sergey Leschev

    // 1178. Number of Valid Words for Each Puzzle
    // With respect to a given puzzle string, a word is valid if both the following conditions are satisfied:
    // word contains the first letter of puzzle.
    // For each letter in word, that letter is in puzzle.
    // For example, if the puzzle is "abcdefg", then valid words are "faced", "cabbage", and "baggage"; while invalid words are "beefed" (doesn't include "a") and "based" (includes "s" which isn't in the puzzle).
    // Return an array answer, where answer[i] is the number of words in the given word list words that are valid with respect to the puzzle puzzles[i].
     
    // Example:
    // Input: 
    // words = ["aaaa","asas","able","ability","actt","actor","access"], 
    // puzzles = ["aboveyz","abrodyz","abslute","absoryz","actresz","gaswxyz"]
    // Output: [1,1,3,2,4,0]
    // Explanation:
    // 1 valid word for "aboveyz" : "aaaa" 
    // 1 valid word for "abrodyz" : "aaaa"
    // 3 valid words for "abslute" : "aaaa", "asas", "able"
    // 2 valid words for "absoryz" : "aaaa", "asas"
    // 4 valid words for "actresz" : "aaaa", "asas", "actt", "access"
    // There're no valid words for "gaswxyz" cause none of the words in the list contains letter 'g'.

    // Constraints:
    // 1 <= words.length <= 10^5
    // 4 <= words[i].length <= 50
    // 1 <= puzzles.length <= 10^4
    // puzzles[i].length == 7
    // words[i][j], puzzles[i][j] are English lowercase letters.
    // Each puzzles[i] doesn't contain repeated characters.

    private var wordMap: [Int32: Int] = [:]
    

    func findNumOfValidWords(_ words: [String], _ puzzles: [String]) -> [Int] {
        var ans: [Int] = []

        for word in words {
            let b = parse(word)
            wordMap[b] = (wordMap[b] ?? 0) + 1
        }

        for puzzle in puzzles {
            let count = sub(puzzle)
            ans.append(count)
        }

        return ans
    }
    

    private func parse(_ str: String) -> Int32 {
        var res: Int32 = 0
        for c in str { res |= map(c) }
        return res
    }
    

    private func sub(_ str: String) -> Int {
        var ans = 0
        let fixed = map(str.first!)
        let mask = parse(str)
        var subset: Int32 = mask
        
        repeat {
            if let count = wordMap[subset], subset | fixed == subset { ans += count }
            subset = (subset - 1) & mask
        } while (subset != mask)
        
        return ans
    }
    
    
    private func map(_ c: Character) -> Int32 {
        let asci = c.asciiValue! - Character("a").asciiValue!
        return 1 << asci
    }
    
}