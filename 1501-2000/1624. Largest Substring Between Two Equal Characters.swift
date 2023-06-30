class Solution {

    // Solution by Sergey Leschev

    // 1624. Largest Substring Between Two Equal Characters
    // Given a string s, return the length of the longest substring between two equal characters, excluding the two characters. If there is no such substring return -1.

    // A substring is a contiguous sequence of characters within a string.

    // Example 1:
    // Input: s = "aa"
    // Output: 0
    // Explanation: The optimal substring here is an empty substring between the two 'a's.

    // Example 2:
    // Input: s = "abca"
    // Output: 2
    // Explanation: The optimal substring here is "bc".

    // Example 3:
    // Input: s = "cbzxy"
    // Output: -1
    // Explanation: There are no characters that appear twice in s.

    // Example 4:
    // Input: s = "cabbac"
    // Output: 4
    // Explanation: The optimal substring here is "abba". Other non-optimal substrings include "bb" and "".

    // Constraints:
    // 1 <= s.length <= 300
    // s contains only lowercase English letters.

    func maxLengthBetweenEqualCharacters(_ s: String) -> Int {
        var temp: [String: [Int]] = [:]
        var length = 0
        var start = -1
        
        for (i, c) in s.enumerated() {
            let c = String(c)
            if temp[c] == nil {
                temp[c] = [i, -1]
            } else {
                temp[c]![0] = min(temp[c]![0], i)
                temp[c]![1] = max(temp[c]![1], i)
            }
            let l = temp[c]![1] - temp[c]![0]
            if l > length {
                length = l
                start = temp[c]![0]
            }
        }
        
        if start < 0 { return -1 }
        return length - 1
    }
    
}