class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 712. Minimum ASCII Delete Sum for Two Strings
    // Given two strings s1 and s2, return the lowest ASCII sum of deleted characters to make two strings equal.

    // Example 1:
    // Input: s1 = "sea", s2 = "eat"
    // Output: 231
    // Explanation: Deleting "s" from "sea" adds the ASCII value of "s" (115) to the sum.
    // Deleting "t" from "eat" adds 116 to the sum.
    // At the end, both strings are equal, and 115 + 116 = 231 is the minimum sum possible to achieve this.

    // Example 2:
    // Input: s1 = "delete", s2 = "leet"
    // Output: 403
    // Explanation: Deleting "dee" from "delete" to turn the string into "let",
    // adds 100[d] + 101[e] + 101[e] to the sum.
    // Deleting "e" from "leet" adds 101[e] to the sum.
    // At the end, both strings are equal to "let", and the answer is 100+101+101+101 = 403.
    // If instead we turned both strings into "lee" or "eet", we would get answers of 433 or 417, which are higher.

    // Constraints:
    // 1 <= s1.length, s2.length <= 1000
    // s1 and s2 consist of lowercase English letters.

    func minimumDeleteSum(_ s1: String, _ s2: String) -> Int {
        var dp = [0]
        var arr1 = Array(s1.unicodeScalars)
        var arr2 = Array(s2.unicodeScalars)
        
        for char in s1.unicodeScalars { dp.append(dp.last! + Int(char.value)) }
        
        for i in 1...arr2.count {
            var tmp = [dp[0] + Int(arr2[i - 1].value)]
            for j in 1...arr1.count {
                if arr2[i - 1] == arr1[j - 1] {
                    tmp.append(dp[j - 1])
                } else {
                    tmp.append(min(dp[j] + Int(arr2[i - 1].value), tmp[j - 1] + Int(arr1[j - 1].value)))
                }
            }
            dp = tmp
        }
        
        return dp.last!
    }
    
}