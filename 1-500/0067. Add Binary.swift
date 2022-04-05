class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 67. Add Binary
    // Given two binary strings a and b, return their sum as a binary string.
    
    // - Parameters:
    //   - a: Binary string.
    //   - b: Binary string.
    // - Returns: Binary string sum.

    // Example 1:
    // Input: a = "11", b = "1"
    // Output: "100"

    // Example 2:
    // Input: a = "1010", b = "1011"
    // Output: "10101"

    // Constraints:
    // 1 <= a.length, b.length <= 10^4
    // a and b consist only of '0' or '1' characters.
    // Each string does not contain leading zeros except for the zero itself.

    // - Complexity:
    //   - time: O(n + m), where n is the length of the a and m is the length of the b.
    //   - space: O(n + m), where n is the length of the a and m is the length of the b.

    func addBinary(_ a: String, _ b: String) -> String {
        guard !a.isEmpty else { return b }
        guard !b.isEmpty else { return a }

        var carry = 0
        let a = Array(a)
        let b = Array(b)
        var i = a.count - 1
        var j = b.count - 1
        var ans = [Int]()

        while i >= 0 || j >= 0 || carry != 0 {
            var sum = carry
            if i >= 0, a[i] == "1" { sum += 1 }
            if j >= 0, b[j] == "1" { sum += 1 }

            let digit = sum % 2
            carry = sum / 2
            ans.append(digit)

            i -= 1
            j -= 1
        }

        return ans.map { String($0) }.reversed().joined()
    }

}