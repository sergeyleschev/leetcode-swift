class Solution {

    // 1556. Thousand Separator
    // Given an integer n, add a dot (".") as the thousands separator and return it in string format.

    // Example 1:
    // Input: n = 987
    // Output: "987"

    // Example 2:
    // Input: n = 1234
    // Output: "1.234"

    // Example 3:
    // Input: n = 123456789
    // Output: "123.456.789"

    // Example 4:
    // Input: n = 0
    // Output: "0"

    // Constraints:
    // 0 <= n < 2^31

    func thousandSeparator(_ n: Int) -> String {
        let s = [Character]("\(n)".reversed())
        var ans = ""
        let n = s.count
        
        for i in 0..<n {
            ans.append(s[i])
            if i % 3 == 2 && i != n - 1 { ans.append(".") }
        }
        return String(ans.reversed())
    }

}