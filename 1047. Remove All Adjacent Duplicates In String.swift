class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1047. Remove All Adjacent Duplicates In String
    // You are given a string s consisting of lowercase English letters. A duplicate removal consists of choosing two adjacent and equal letters and removing them.
    // We repeatedly make duplicate removals on s until we no longer can.
    // Return the final string after all such duplicate removals have been made. It can be proven that the answer is unique.

    // Example 1:
    // Input: s = "abbaca"
    // Output: "ca"
    // Explanation: 
    // For example, in "abbaca" we could remove "bb" since the letters are adjacent and equal, and this is the only possible move.  The result of this move is that the string is "aaca", of which only "aa" is possible, so the final string is "ca".

    // Example 2:
    // Input: s = "azxxzy"
    // Output: "ay"

    // Constraints:
    // 1 <= s.length <= 10^5
    // s consists of lowercase English letters.

    func removeDuplicates(_ S: String) -> String {
        guard S.count > 1 else { return S }
        var S = Array(S)
        var i = 0
        
        while i < S.count {
            if i > 0 && S[i] == S[i - 1] {
                S.remove(at: i - 1)
                S.remove(at: i - 1)
                i -= 1
            } else if i < S.count - 1 && S[i] == S[i + 1] {
                S.remove(at: i)
                S.remove(at: i)
            } else {
                i += 1
            }
        }
        
        return String(S)
    }
    
}