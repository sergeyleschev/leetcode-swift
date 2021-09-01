class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 809. Expressive Words
    // Sometimes people repeat letters to represent extra feeling, such as "hello" -> "heeellooo", "hi" -> "hiiii".  In these strings like "heeellooo", we have groups of adjacent letters that are all the same:  "h", "eee", "ll", "ooo".
    // For some given string s, a query word is stretchy if it can be made to be equal to s by any number of applications of the following extension operation: choose a group consisting of characters c, and add some number of characters c to the group so that the size of the group is 3 or more.
    // For example, starting with "hello", we could do an extension on the group "o" to get "hellooo", but we cannot get "helloo" since the group "oo" has size less than 3.  Also, we could do another extension like "ll" -> "lllll" to get "helllllooo".  If s = "helllllooo", then the query word "hello" would be stretchy because of these two extension operations: query = "hello" -> "hellooo" -> "helllllooo" = s.
    // Given a list of query words, return the number of words that are stretchy. 

    // Example:
    // Input: 
    // s = "heeellooo"
    // words = ["hello", "hi", "helo"]
    // Output: 1
    // Explanation: 
    // We can extend "e" and "o" in the word "hello" to get "heeellooo".
    // We can't extend "helo" to get "heeellooo" because the group "ll" is not size 3 or more.

    // Constraints:
    // 0 <= len(s) <= 100.
    // 0 <= len(words) <= 100.
    // 0 <= len(words[i]) <= 100.
    // s and all words in words consist only of lowercase letters

    func expressiveWords(_ S: String, _ words: [String]) -> Int {
        func charCount(str: String) -> [(Character, Int)] {
            var ans = [(Character, Int)]()
            var lastChar: Character = Character("1")
            var count = 0
            for char in str {
                if lastChar == char {
                    count += 1
                } else {
                    if count > 0 { ans.append((char, count)) }
                    lastChar = char
                    count = 1
                }
            }
            if count > 0 { ans.append((lastChar, count)) }
            return ans
        }

        
        func checkWord(st: [(Character, Int)], wt: [(Character, Int)]) -> Int {
            guard st.count == wt.count else { return 0 }
            for (v1, v2) in zip(st, wt) {
                if v1.0 != v2.0 { return 0 }
                if v1.1 < v2.1 { return 0 }
                if v1.1 != v2.1 && v1.1 < 3 { return 0 }
            }
            return 1
        }

        
        let st = charCount(str: S)
        return words.reduce(0) { (res, word) -> Int in  res + checkWord(st: st, wt: charCount(str: word)) }
    }
    
}