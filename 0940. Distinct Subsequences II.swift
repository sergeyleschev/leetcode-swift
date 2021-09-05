class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 940. Distinct Subsequences II
    // Given a string s, count the number of distinct, non-empty subsequences of s .
    // Since the result may be large, return the answer modulo 10^9 + 7.

    // Example 1:
    // Input: s = "abc"
    // Output: 7
    // Explanation: The 7 distinct subsequences are "a", "b", "c", "ab", "ac", "bc", and "abc".

    // Example 2:
    // Input: s = "aba"
    // Output: 6
    // Explanation: The 6 distinct subsequences are "a", "b", "ab", "ba", "aa" and "aba".

    // Example 3:
    // Input: s = "aaa"
    // Output: 3
    // Explanation: The 3 distinct subsequences are "a", "aa" and "aaa".
     
    // Note:
    // s contains only lowercase letters.
    // 1 <= s.length <= 2000

    // - Complexity:
    //   - time: O(26n) which can optimized to O(n)

    func distinctSubseqII(_ S: String) -> Int {
        guard !S.isEmpty else { return 0 }
        let S = Array(S)
        let mod = Int(1e9 + 7)
        var end = Array(repeating: 0, count: 26)
        let a = Int(Character("a").asciiValue!)
        var added = 0
        var res = 0
        
        for c in S {
            let index = Int(c.asciiValue!) - a
            added = (res - end[index] + 1) % mod
            res = (res + added) % mod
            end[index] = (end[index] + added) % mod
        }
        
        return (res + mod) % mod
    }
    
}