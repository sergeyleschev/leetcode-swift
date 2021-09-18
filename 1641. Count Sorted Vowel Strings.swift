class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1641. Count Sorted Vowel Strings
    // Given an integer n, return the number of strings of length n that consist only of vowels (a, e, i, o, u) and are lexicographically sorted.
    // A string s is lexicographically sorted if for all valid i, s[i] is the same as or comes before s[i+1] in the alphabet.

    // Finds the number of strings of length n that consist only of vowels (a, e, i, o, u) and are lexicographically sorted.

    // - Parameter n: An integer.
    // - Returns: The number of strings.

    // Example 1:
    // Input: n = 1
    // Output: 5
    // Explanation: The 5 sorted strings that consist of vowels only are ["a","e","i","o","u"].

    // Example 2:
    // Input: n = 2
    // Output: 15
    // Explanation: The 15 sorted strings that consist of vowels only are
    // ["aa","ae","ai","ao","au","ee","ei","eo","eu","ii","io","iu","oo","ou","uu"].
    // Note that "ea" is not a valid string since 'e' comes after 'a' in the alphabet.

    // Example 3:
    // Input: n = 33
    // Output: 66045

    // Constraints:
    // 1 <= n <= 50 

    // - Complexity:
    //   - time: O(n), where n is given n.
    //   - space: O(n), where n is given n.
    
    func countVowelStrings(_ n: Int) -> Int {
        guard n > 1 else { return 5 }
        var dp = [[Int]](repeating: [Int](repeating: 0, count: 6), count: n + 1)
        
        for i in 1...5 { dp[1][i] = i }
        
        for i in 2...n {
            dp[i][1] = 1
            for j in 2...5 { dp[i][j] = dp[i][j - 1] + dp[i - 1][j] }
        }
        return dp[n][5]
    }

}