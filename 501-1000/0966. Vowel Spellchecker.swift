class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 966. Vowel Spellchecker
    // Given a wordlist, we want to implement a spellchecker that converts a query word into a correct word.
    // For a given query word, the spell checker handles two categories of spelling mistakes:
    // Capitalization: If the query matches a word in the wordlist (case-insensitive), then the query word is returned with the same case as the case in the wordlist.
    // Example: wordlist = ["yellow"], query = "YellOw": correct = "yellow"
    // Example: wordlist = ["Yellow"], query = "yellow": correct = "Yellow"
    // Example: wordlist = ["yellow"], query = "yellow": correct = "yellow"
    // Vowel Errors: If after replacing the vowels ('a', 'e', 'i', 'o', 'u') of the query word with any vowel individually, it matches a word in the wordlist (case-insensitive), then the query word is returned with the same case as the match in the wordlist.
    // Example: wordlist = ["YellOw"], query = "yollow": correct = "YellOw"
    // Example: wordlist = ["YellOw"], query = "yeellow": correct = "" (no match)
    // Example: wordlist = ["YellOw"], query = "yllw": correct = "" (no match)
    // In addition, the spell checker operates under the following precedence rules:
    // When the query exactly matches a word in the wordlist (case-sensitive), you should return the same word back.
    // When the query matches a word up to capitlization, you should return the first such match in the wordlist.
    // When the query matches a word up to vowel errors, you should return the first such match in the wordlist.
    // If the query has no matches in the wordlist, you should return the empty string.
    // Given some queries, return a list of words answer, where answer[i] is the correct word for query = queries[i].

    // Converts a query word into a correct word.

    // - Parameters:
    //   - wordlist: A list of words.
    //   - queries: A query word.
    // - Returns: The correct words.

    // Example 1:
    // Input: wordlist = ["KiTe","kite","hare","Hare"], queries = ["kite","Kite","KiTe","Hare","HARE","Hear","hear","keti","keet","keto"]
    // Output: ["kite","KiTe","KiTe","Hare","hare","","","KiTe","","KiTe"]

    // Example 2:
    // Input: wordlist = ["yellow"], queries = ["YellOw"]
    // Output: ["yellow"]

    // Constraints:
    // 1 <= wordlist.length, queries.length <= 5000
    // 1 <= wordlist[i].length, queries[i].length <= 7
    // wordlist[i] and queries[i] consist only of only English letters.

    // - Complexity:
    //     - time: O(max(n, m)), where n is the length of wordlist, and m is the length of queries.
    //     - space: O(max(n, m)), where n is the length of wordlist, and m is the length of queries.

    private var wordsPerfect = Set<String>()
    private var wordsCap = [String: String]()
    private var wordsVow = [String: String]()
    
    
    func spellchecker(_ wordlist: [String], _ queries: [String]) -> [String] {
        var ans = [String]()

        for word in wordlist {
            wordsPerfect.insert(word)
            
            let wordlow = word.lowercased()
            if !wordsCap.keys.contains(wordlow) { wordsCap[wordlow] = word }
            
            let wordlowDV = devowel(wordlow)
            if !wordsVow.keys.contains(wordlowDV) { wordsVow[wordlowDV] = word }
        }
        
        for query in queries { ans.append(solve(query)) }
        return ans
    }
    
    
    private func solve(_ query: String) -> String {
        guard !wordsPerfect.contains(query) else { return query }
        let wordlow = query.lowercased()
        if let val = wordsCap[wordlow] { return val }
        if let val = wordsVow[devowel(wordlow)] { return val }
        return ""
    }
    
    
    private func devowel(_ word: String) -> String {
        var ans = [Character]()
        for ch in word { ans.append(isVowel(ch) ? "*" : ch) }
        return String(ans)
    }
    
    
    private func isVowel(_ ch: Character) -> Bool { ch == "a" || ch == "e" || ch == "i" || ch == "o" || ch == "u" }

}