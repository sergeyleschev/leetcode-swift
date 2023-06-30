class Solution {

    // Solution by Sergey Leschev

    // 1312. Minimum Insertion Steps to Make a String Palindrome
    // Given a string s. In one step you can insert any character at any index of the string.
    // Return the minimum number of steps to make s palindrome.
    // A Palindrome String is one that reads the same backward as well as forward.

    // Example 1:
    // Input: s = "zzazz"
    // Output: 0
    // Explanation: The string "zzazz" is already palindrome we don't need any insertions.

    // Example 2:
    // Input: s = "mbadm"
    // Output: 2
    // Explanation: String can be "mbdadbm" or "mdbabdm".

    // Example 3:
    // Input: s = "leetcode"
    // Output: 5
    // Explanation: Inserting 5 characters the string becomes "leetcodocteel".

    // Example 4:
    // Input: s = "g"
    // Output: 0

    // Example 5:
    // Input: s = "no"
    // Output: 1

    // Constraints:
    // 1 <= s.length <= 500
    // All characters of s are lower case English letters.

    func minInsertions(_ s: String) -> Int {
        var chars = [Character](s)
        var i = 0
        var j = s.count - 1
        
        while i < j {
            if chars[i] != chars[j] { break }
            i += 1
            j -= 1
        }
        
        guard i < j else { return 0 }
        guard s.count != 2 else { return 1 }
        chars.removeFirst(i)
        chars.removeLast(s.count - j - 1)
        let n = chars.count
        
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: n + 1)
        
         i = n - 1
        while i >= 0 {
            j = i + 1
            while j < n {
                if chars[i] == chars[j] {
                    dp[i][j] = dp[i + 1][j - 1]
                } else {
                    dp[i][j] = min(dp[i][j - 1], dp[i + 1][j]) + 1
                }
                j += 1
            }
            i -= 1
        }
        
        return dp[0][n - 1]
    }

 }