class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1653. Minimum Deletions to Make String Balanced
    // You are given a string s consisting only of characters 'a' and 'b'.
    // You can delete any number of characters in s to make s balanced. s is balanced if there is no pair of indices (i,j) such that i < j and s[i] = 'b' and s[j]= 'a'.

    // Return the minimum number of deletions needed to make s balanced.

    // Example 1:
    // Input: s = "aababbab"
    // Output: 2
    // Explanation: You can either:
    // Delete the characters at 0-indexed positions 2 and 6 ("aababbab" -> "aaabbb"), or
    // Delete the characters at 0-indexed positions 3 and 6 ("aababbab" -> "aabbbb").

    // Example 2:
    // Input: s = "bbaaaaabb"
    // Output: 2
    // Explanation: The only solution is to delete the first two characters.
     

    // Constraints:
    // 1 <= s.length <= 10^5
    // s[i] is 'a' or 'b'.

    private typealias CharCounter = (a: Int, b: Int)


    func minimumDeletions(_ s: String) -> Int {
        var ans = Int.max
        var total: CharCounter = (0, 0)
        var currentCnt: CharCounter = (0, 0)
        
        for ch in s {
            if ch == "a" {
                total.a += 1
            } else {
                total.b += 1
            }
        }
        
        for ch in  s {
            if ch == "a" {
                currentCnt.a += 1
            } else {
                currentCnt.b += 1
            }
            ans = min(ans, currentCnt.b + total.a - currentCnt.a)
        }
        return min(ans,total.a,total.b)
    }

}