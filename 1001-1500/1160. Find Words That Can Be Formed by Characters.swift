class Solution {

    // Solution @ Sergey Leschev

    // 1160. Find Words That Can Be Formed by Characters
    // You are given an array of strings words and a string chars.
    // A string is good if it can be formed by characters from chars (each character can only be used once).
    // Return the sum of lengths of all good strings in words.

    // Example 1:
    // Input: words = ["cat","bt","hat","tree"], chars = "atach"
    // Output: 6
    // Explanation: 
    // The strings that can be formed are "cat" and "hat" so the answer is 3 + 3 = 6.

    // Example 2:
    // Input: words = ["hello","world","leetcode"], chars = "welldonehoneyr"
    // Output: 10
    // Explanation: 
    // The strings that can be formed are "hello" and "world" so the answer is 5 + 5 = 10.

    // Note:
    // 1 <= words.length <= 1000
    // 1 <= words[i].length, chars.length <= 100
    // All strings contain lowercase English letters only.

    func countCharacters(_ words: [String], _ chars: String) -> Int {
        var charDict: [Character: Int] = [:], ans = 0
        for c in chars { charDict[c] = (charDict[c] ?? 0) + 1 }
        
        outer: for word in words {
            var copyDict = charDict
            for c in word {
                if copyDict[c] == nil || copyDict[c]! == 0 { continue outer }
                copyDict[c]! -= 1
            }
            ans += word.count
        }
        
        return ans
    }
    
}