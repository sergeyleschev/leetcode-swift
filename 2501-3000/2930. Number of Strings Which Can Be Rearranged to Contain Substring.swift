class Solution {

    // Solution by Sergey Leschev
    // 2930. Number of Strings Which Can Be Rearranged to Contain Substring

    // Time complexity: O(log⁡n)
    // Space complexity: O(1)

    private func pow(_ x: Int, _ n: Int, _ mod: Int) -> Int {
        var result = 1
        var p = x % mod

        var n = n
        while n > 0 {
            if n & 1 == 1 {
                result = (result * p) % mod
            }
            p = (p * p) % mod
            n >>= 1
        }

        return result
    }

    func stringCount(_ n: Int) -> Int {
        let mod = 1_000_000_007
        return
            ((pow(26, n, mod)
            - (n + 75) * pow(25, n - 1, mod)
            + (2 * n + 72) * pow(24, n - 1, mod)
            - (n + 23) * pow(23, n - 1, mod)) % mod + mod) % mod
    }
}
