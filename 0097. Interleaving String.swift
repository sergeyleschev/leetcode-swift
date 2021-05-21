class Solution {

    // 97. Interleaving String
    // Given strings s1, s2, and s3, find whether s3 is formed by an interleaving of s1 and s2.
    // An interleaving of two strings s and t is a configuration where they are divided into non-empty substrings such that:
    // s = s1 + s2 + ... + sn
    // t = t1 + t2 + ... + tm
    // |n - m| <= 1
    // The interleaving is s1 + t1 + s2 + t2 + s3 + t3 + ... or t1 + s1 + t2 + s2 + t3 + s3 + ...
    // Note: a + b is the concatenation of strings a and b.

    // Example 1:
    // Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbcbcac"
    // Output: true

    // Example 2:
    // Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbbaccc"
    // Output: false

    // Example 3:
    // Input: s1 = "", s2 = "", s3 = ""
    // Output: true
     
    // Constraints:
    // 0 <= s1.length, s2.length <= 100
    // 0 <= s3.length <= 200
    // s1, s2, and s3 consist of lowercase English letters. 

    // Follow up: Could you solve it using only O(s2.length) additional memory space?

    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        var dp: [String: Bool] = [:]
        
        
        func is_interleave(_ chs1: [Character], _ chs2: [Character], _ chs3: [Character], _ i: Int, _ j: Int, _ k: Int) -> Bool {
            if let v = dp["\(i)-\(j)-\(k)"] { return v }
            
            if i >= chs1.count && j >= chs2.count && k >= chs3.count { return true }
            
            var v1 = false
            if i < chs1.count && chs1[i] == chs3[k] {
                v1 = is_interleave(chs1, chs2, chs3, i + 1, j, k + 1)
            }
            
            var v2 = false
            if j < chs2.count && chs2[j] == chs3[k] {
                v2 = v1 || is_interleave(chs1, chs2, chs3, i, j + 1, k + 1)
            }
            
            dp["\(i)-\(j)-\(k)"] = v1 || v2
            return v1 || v2
        }
        
        if s1.count + s2.count != s3.count { return false } 
        else {
            return is_interleave(Array(s1), Array(s2), Array(s3), 0, 0, 0)
        }
    }

}