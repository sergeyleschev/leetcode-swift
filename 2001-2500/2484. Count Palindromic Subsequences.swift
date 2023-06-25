class Solution {

    // Solution @ Sergey Leschev
    // 2484. Count Palindromic Subsequences

    var dp: [[[[Int]]]] = Array(repeating: Array(repeating: Array(repeating: Array(repeating: -1, count: 6), count: 11), count: 11), count: 10001)
    let mod: Int = 1000000007
    
    func dfs(_ ind: Int, _ first: Int, _ second: Int, _ i: Int, _ s: [Character]) -> Int {
        if i == 5 {
            return 1 // Found a subsequence
        }
        
        if ind == s.count {
            return 0
        }
        
        if dp[ind][first][second][i] != -1 {
            return dp[ind][first][second][i]
        }
        
        var res: Int = dfs(ind + 1, first, second, i, s) % mod // Option of not choosing current digit
        
        if i == 0 {
            // Option of choosing the first digit of the subsequence
            res += dfs(ind + 1, Int(String(s[ind]))!, second, i + 1, s)
            res %= mod
        } else if i == 1 {
            // Option of choosing the second digit of the subsequence
            res += dfs(ind + 1, first, Int(String(s[ind]))!, i + 1, s)
            res %= mod
        } else if i == 2 {
            // Option of choosing the third digit of the subsequence
            res += dfs(ind + 1, first, second, i + 1, s)
            res %= mod
        } else if i == 3 {
            // Option of choosing the fourth digit of the subsequence if it matches with the second digit
            if Int(String(s[ind]))! == second {
                res += dfs(ind + 1, first, second, i + 1, s)
                res %= mod
            }
        } else if i == 4 {
            // Option of choosing the fifth digit of the subsequence if it matches with the first digit
            if Int(String(s[ind]))! == first {
                res += dfs(ind + 1, first, second, i + 1, s)
                res %= mod
            }
        }
        
        dp[ind][first][second][i] = res
        return res
    }
    
    func countPalindromes(_ s: String) -> Int {
        let sChars: [Character] = Array(s)
        return dfs(0, 10, 10, 0, sChars)
    }
}
