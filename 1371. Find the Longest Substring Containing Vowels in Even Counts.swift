class Solution {

    // 1371. Find the Longest Substring Containing Vowels in Even Counts
    // Given the string s, return the size of the longest substring containing each vowel an even number of times. That is, 'a', 'e', 'i', 'o', and 'u' must appear an even number of times.

    // Example 1:
    // Input: s = "eleetminicoworoep"
    // Output: 13
    // Explanation: The longest substring is "leetminicowor" which contains two each of the vowels: e, i and o and zero of the vowels: a and u.

    // Example 2:
    // Input: s = "leetcodeisgreat"
    // Output: 5
    // Explanation: The longest substring is "leetc" which contains two e's.

    // Example 3:
    // Input: s = "bcbcbc"
    // Output: 6
    // Explanation: In this case, the given string "bcbcbc" is the longest because all vowels: a, e, i, o and u appear zero times.

    // Constraints:
    // 1 <= s.length <= 5 x 10^5
    // s contains only lowercase English letters.

    func findTheLongestSubstring(_ s: String) -> Int {
        let chars = Array(s)
        var status = 0
        var maps = [Int: Int]()
        var res = 0
        maps[0] = 0

        for i in 0..<chars.count {
            switch chars[i] {
            case "a": status = status ^ (1 << 0); break
            case "e": status = status ^ (1 << 1); break
            case "i": status = status ^ (1 << 2); break
            case "o": status = status ^ (1 << 3); break
            case "u": status = status ^ (1 << 4); break
            default: break
            }

            if let v = maps[status] {
                res = max(res, i - v + 1)
            } else {
                maps[status] =  i + 1
            }
        }
        
        return res
    }

}