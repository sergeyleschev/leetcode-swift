class Solution {

    // Solution @ Sergey Leschev

    // 1759. Count Number of Homogenous Substrings
    // Given a string s, return the number of homogenous substrings of s. Since the answer may be too large, return it modulo 109 + 7.
    // A string is homogenous if all the characters of the string are the same.
    // A substring is a contiguous sequence of characters within a string.

    // Example 1:
    // Input: s = "abbcccaa"
    // Output: 13
    // Explanation: The homogenous substrings are listed as below:
    // "a"   appears 3 times.
    // "aa"  appears 1 time.
    // "b"   appears 2 times.
    // "bb"  appears 1 time.
    // "c"   appears 3 times.
    // "cc"  appears 2 times.
    // "ccc" appears 1 time.
    // 3 + 1 + 2 + 1 + 3 + 2 + 1 = 13.

    // Example 2:
    // Input: s = "xy"
    // Output: 2
    // Explanation: The homogenous substrings are "x" and "y".

    // Example 3:
    // Input: s = "zzzzz"
    // Output: 15

    // Constraints:
    // 1 <= s.length <= 10^5
    // s consists of lowercase letters.

    private let mod = 1_000_000_007


    func countHomogenous(_ s: String) -> Int {
        var ans = 0
        var cnt = 0
        var idx = s.startIndex
        var last: Character? = nil
        
        while idx < s.endIndex {
            if idx == s.startIndex { cnt += 1 } 
            else {
                if s[idx] == last! { cnt += 1 } 
                else {
                    ans += (cnt + 1) * cnt / 2 
                    if ans >= mod { ans %= mod }
                    cnt = 1
                }
            }
            last = s[idx]
            idx = s.index(after: idx)
        }
        ans += (cnt + 1) * cnt / 2 
        return  ans % mod
    }
    
}