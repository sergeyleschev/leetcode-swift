class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 472. Concatenated Words
    // Given an array of strings words (without duplicates), return all the concatenated words in the given list of words.
    // A concatenated word is defined as a string that is comprised entirely of at least two shorter words in the given array.

    // Example 1:
    // Input: words = ["cat","cats","catsdogcats","dog","dogcatsdog","hippopotamuses","rat","ratcatdogcat"]
    // Output: ["catsdogcats","dogcatsdog","ratcatdogcat"]
    // Explanation: "catsdogcats" can be concatenated by "cats", "dog" and "cats"; 
    // "dogcatsdog" can be concatenated by "dog", "cats" and "dog"; 
    // "ratcatdogcat" can be concatenated by "rat", "cat", "dog" and "cat".

    // Example 2:
    // Input: words = ["cat","dog","catdog"]
    // Output: ["catdog"]

    // Constraints:
    // 1 <= words.length <= 10^4
    // 0 <= words[i].length <= 1000
    // words[i] consists of only lowercase English letters.
    // 0 <= sum(words[i].length) <= 10^5

    func findAllConcatenatedWordsInADict(_ words: [String]) -> [String] {
        guard words.count > 2 else { return [] }
        var ans = [String]()
        var map = [Int: Set<String>]()
        
        for word in words {
            if !word.isEmpty {
                if nil == map[word.count] { map[word.count] = [] }
                map[word.count]?.insert(word)
            }
        }
        
        let minWordLength = map.keys.min()!
        let maxWordLength = map.keys.max()!
        let targetLength = minWordLength << 1
        

        func dfs(_ totalCount: Int, word: [Character]) -> Bool {
            guard word.count >= minWordLength else { return false }

            if word.count >= minWordLength && word.count <= maxWordLength {
                if let strs = map[word.count] {
                    if strs.contains(String(word)) && totalCount != 0 { return true }
                }
            }
            guard word.count >= targetLength else { return false }
            
            var length = minWordLength
            while length <= min(maxWordLength, word.count) {
                if  word.count - length < minWordLength { break }
                let left = String(word[0..<length])
                if let strs = map[length], strs.contains(left) {
                    var temp = word
                    temp.removeFirst(length)
                    if dfs(totalCount + 1, word: temp) { return true }
                }
                length += 1
            }
            return false
        }
        
        
        for index in 0..<words.count {
            if words[index].count >= targetLength && dfs(0, word: [Character](words[index])) {
                ans.append(words[index])
            }
        }
        
        return ans
    }

}