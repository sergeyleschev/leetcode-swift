class Solution {

    // Solution by Sergey Leschev

    // 1961. Check If String Is a Prefix of Array
    // Given a string s and an array of strings words, determine whether s is a prefix string of words.
    // A string s is a prefix string of words if s can be made by concatenating the first k strings in words for some positive k no larger than words.length.

    // Return true if s is a prefix string of words, or false otherwise.

    // Example 1:
    // Input: s = "iloveleetcode", words = ["i","love","leetcode","apples"]
    // Output: true
    // Explanation:
    // s can be made by concatenating "i", "love", and "leetcode" together.

    // Example 2:
    // Input: s = "iloveleetcode", words = ["apples","i","love","leetcode"]
    // Output: false
    // Explanation:
    // It is impossible to make s using a prefix of arr.

    // Constraints:
    // 1 <= words.length <= 100
    // 1 <= words[i].length <= 20
    // 1 <= s.length <= 1000
    // words[i] and s consist of only lowercase English letters.

    // Solution: iterate by s and checking if it ends with one specific word in words

    // - Complexity:
    //   - time: O(s.count)
    //   - space: O(s.count + words.count)

    func isPrefixString(_ s: String, _ words: [String]) -> Bool {
        var s = Array(s)
        var words = words.map { Array($0) }
        var iw = 0
        var iw2 = 0

        for i in 0..<s.count {
            let c = s[i]
            if c == words[iw][iw2] {
                iw2 += 1
                if iw2 == words[iw].count {
                    iw += 1
                    iw2 = 0
                    if iw == words.count { return i == s.count - 1 }
                }
            } else {
                return false
            }
            if i == s.count - 1 { return iw2 == 0 }
        }
        return true
    }

}
