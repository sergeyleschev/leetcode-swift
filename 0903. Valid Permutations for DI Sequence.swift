class Solution {

    // 903. Valid Permutations for DI Sequence
    // We are given s, a length n string of characters from the set {'D', 'I'}. (These letters stand for "decreasing" and "increasing".)
    // A valid permutation is a permutation p[0], p[1], ..., p[n] of integers {0, 1, ..., n}, such that for all i:
    // If s[i] == 'D', then p[i] > p[i+1], and;
    // If s[i] == 'I', then p[i] < p[i+1].
    // How many valid permutations are there?  Since the answer may be large, return your answer modulo 10^9 + 7.

    // Example 1:
    // Input: s = "DID"
    // Output: 5
    // Explanation: 
    // The 5 valid permutations of (0, 1, 2, 3) are:
    // (1, 0, 3, 2)
    // (2, 0, 3, 1)
    // (2, 1, 3, 0)
    // (3, 0, 2, 1)
    // (3, 1, 2, 0)

    // Note:
    // 1 <= s.length <= 200
    // s consists only of characters from the set {'D', 'I'}.

    func numPermsDISequence(_ s: String) -> Int {
        let n = s.count,mod = 1_000_000_007
        let oeders = [Character](s)
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: n + 1)
        
        for j in 0...n { dp[0][j] = 1 }
        
        for i in 0..<n {
            if oeders[i] == "I" {
                var j = 0
                var cur = 0
                while j < n - i {
                    cur = (cur + dp[i][j]) % mod
                    dp[i + 1][j] = cur
                    j += 1
                }
            } else {
                var j = n - i - 1
                var cur = 0
                while j >= 0 {
                    cur = (cur + dp[i][j + 1]) % mod
                    dp[i + 1][j] = cur
                    j -= 1
                }
            }
        }
        
        return dp[n][0]
    }

}