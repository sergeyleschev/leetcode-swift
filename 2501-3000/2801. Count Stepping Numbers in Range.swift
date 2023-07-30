class Solution {

    // Solution by Sergey Leschev
    // 2801. Count Stepping Numbers in Range
    // DP

    // # Intuition
    // The problem requires finding the count of stepping numbers in a given range [low, high], where a stepping number is an integer such that all its adjacent digits have an absolute difference of exactly 1. To efficiently count these stepping numbers, we can use a dynamic programming approach.

    // # Approach
    // The Swift solution uses dynamic programming to solve the problem. The rec function recursively calculates the count of stepping numbers based on certain conditions. The dp array is used to store previously computed results, which helps avoid redundant calculations and improves efficiency.
    // The check function checks if a number is a stepping number by comparing the absolute difference between each pair of adjacent digits.
    // In the countSteppingNumbers function, we call rec twice for the input range [low, high] and then subtract the count for low from the count for high. Additionally, if low itself is a stepping number, we add 1 to the result.

    // The solution efficiently handles large inputs and returns the count of stepping numbers modulo 10^9 + 7, as required by the problem statement.

    let mod = 1_000_000_007

    var dp: [[[[Int]]]] = Array(
        repeating: Array(
            repeating: Array(repeating: Array(repeating: -1, count: 2), count: 10), count: 2),
        count: 101)

    func rec(_ s1: [Character], _ ind: Int, _ smaller: Bool, _ last: Int, _ start: Bool) -> Int {
        if ind == s1.count {
            return 1
        }

        if dp[ind][smaller ? 1 : 0][last][start ? 1 : 0] != -1 {
            return dp[ind][smaller ? 1 : 0][last][start ? 1 : 0]
        }

        var ans = 0

        if start || abs(last - 0) == 1 {
            ans = (ans + rec(s1, ind + 1, smaller || (s1[ind] != "0"), 0, start)) % mod
        }

        if smaller {
            for i in 1...9 {
                if abs(last - i) == 1 || start {
                    ans = (ans + rec(s1, ind + 1, smaller, i, false)) % mod
                }
            }
        } else {
            let diff = Int(String(s1[ind]))!
            if diff > 0 {
                for i in 1..<diff {
                    if abs(last - i) == 1 || start {
                        ans = (ans + rec(s1, ind + 1, true, i, false)) % mod
                    }
                }
            }
            if s1[ind] != "0" {
                if abs(last - diff) == 1 || start {
                    ans = (ans + rec(s1, ind + 1, false, diff, false)) % mod
                }
            }
        }
        dp[ind][smaller ? 1 : 0][last][start ? 1 : 0] = ans
        return ans
    }

    func check(_ s: String) -> Bool {
        let sChars = Array(s)
        for i in 0..<(sChars.count - 1) {
            if abs(Int(String(sChars[i]))! - Int(String(sChars[i + 1]))!) != 1 {
                return false
            }
        }
        return true
    }

    func countSteppingNumbers(_ low: String, _ high: String) -> Int {
        let x = rec(Array(high), 0, false, 0, true)
        dp = Array(
            repeating: Array(
                repeating: Array(repeating: Array(repeating: -1, count: 2), count: 10), count: 2),
            count: 101)
        let y = rec(Array(low), 0, false, 0, true)

        let z = check(low)

        return (x - y + (z ? 1 : 0) + mod) % mod
    }
}
