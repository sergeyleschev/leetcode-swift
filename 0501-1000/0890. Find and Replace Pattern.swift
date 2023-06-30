class Solution {

    // Solution by Sergey Leschev

    // 890. Find and Replace Pattern
    // Given a list of strings words and a string pattern, return a list of words[i] that match pattern. You may return the answer in any order.
    // A word matches the pattern if there exists a permutation of letters p so that after replacing every letter x in the pattern with p(x), we get the desired word.
    // Recall that a permutation of letters is a bijection from letters to letters: every letter maps to another letter, and no two letters map to the same letter.

    // Example 1:
    // Input: words = ["abc","deq","mee","aqq","dkd","ccc"], pattern = "abb"
    // Output: ["mee","aqq"]
    // Explanation: "mee" matches the pattern because there is a permutation {a -> m, b -> e, ...}. 
    // "ccc" does not match the pattern because {a -> c, b -> c, ...} is not a permutation, since a and b map to the same letter.

    // Example 2:
    // Input: words = ["a","b","c"], pattern = "a"
    // Output: ["a","b","c"]

    // Constraints:
    // 1 <= pattern.length <= 20
    // 1 <= words.length <= 50
    // words[i].length == pattern.length
    // pattern and words[i] are lowercase English letters.

    func findAndReplacePattern(_ words: [String], _ pattern: String) -> [String] {
        var rules = [Int: [Int]]()
        var chars = [Int]()
        var ans = [String]()

        for (i, c) in pattern.unicodeScalars.enumerated() {
            let v = Int(c.value) - 97
            if var indexs = rules[v] {
                indexs.append(i)
                rules[v] = indexs
            } else {
                chars.append(v)
                rules[v] = [i]
            }
        }

        for word in words {
            var table = Array(repeating: -1, count: 26)
            var index = -1
            var flag = true
            
            for (i, c) in word.unicodeScalars.enumerated() {
                let v = Int(c.value) - 97
                if table[v] == -1 {
                    index += 1
                    if index >= chars.count { flag = false; break }
                    table[v] = chars[index]

                }
                guard let indexs = rules[table[v]],
                    indexs.contains(i),
                    index < chars.count else { flag = false; break }
            }
            if flag { ans.append(word) }
        }

        return ans
    }

}