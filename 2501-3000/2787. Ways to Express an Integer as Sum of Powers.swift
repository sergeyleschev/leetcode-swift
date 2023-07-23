class Solution {

    // Solution by Sergey Leschev
    // 2787. Ways to Express an Integer as Sum of Powers

    let mod = 1_000_000_007
    var dp: [[Int]] = Array(repeating: Array(repeating: -1, count: 302), count: 302)

    func f(_ n: Int, _ num: Int, _ x: Int) -> Int {
        if n < 0 {
            return 0
        }
        if n == 0 {
            return 1
        }
        if Int(pow(Double(num), Double(x))) > n {
            return 0
        }
        if dp[n][num] != -1 {
            return dp[n][num]
        }

        let temp = Int(pow(Double(num), Double(x)))

        let pick = f(n - temp, num + 1, x) % mod
        let skip = f(n, num + 1, x) % mod

        dp[n][num] = (skip + pick) % mod
        return dp[n][num]
    }

    func numberOfWays(_ n: Int, _ x: Int) -> Int {
        return f(n, 1, x)
    }
}
