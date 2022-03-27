class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 664. Strange Printer
    // There is a strange printer with the following two special properties:
    // The printer can only print a sequence of the same character each time.
    // At each turn, the printer can print new characters starting from and ending at any place and will cover the original existing characters.
    // Given a string s, return the minimum number of turns the printer needed to print it.

    // Example 1:
    // Input: s = "aaabbb"
    // Output: 2
    // Explanation: Print "aaa" first and then print "bbb".

    // Example 2:
    // Input: s = "aba"
    // Output: 2
    // Explanation: Print "aaa" first and then print "b" from the second place of the string, which will cover the existing character 'a'.

    // Constraints:
    // 1 <= s.length <= 100
    // s consists of lowercase English letters.

    private var memo: [[Int]] = []
    private var chars: [Character] = []


    func strangePrinter(_ s: String) -> Int {
        guard s.count > 1 else { return s.count }
        chars = [Character](s)
        let N = s.count
        memo = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
        return dp(0, N - 1)
    }
    

    private func dp(_ i: Int, _ j: Int) -> Int {
        guard i <= j else { return 0 }
        guard memo[i][j] == 0 else { return memo[i][j] }
        var ans = dp(i + 1, j) + 1
        var k = i + 1

        while k <= j {
            if chars[k] == chars[i] { ans = min(ans, dp(i, k - 1) + dp(k + 1,j)) }
            k += 1
        }

        memo[i][j] = ans
        return ans
    }

}