class Solution {

    // Solution @ Sergey Leschev

    // 984. String Without AAA or BBB
    // Given two integers a and b, return any string s such that:
    // s has length a + b and contains exactly a 'a' letters, and exactly b 'b' letters,
    // The substring 'aaa' does not occur in s, and
    // The substring 'bbb' does not occur in s.

    // Example 1:
    // Input: a = 1, b = 2
    // Output: "abb"
    // Explanation: "abb", "bab" and "bba" are all correct answers.

    // Example 2:
    // Input: a = 4, b = 1
    // Output: "aabaa"

    // Constraints:
    // 0 <= a, b <= 100
    // It is guaranteed such an s exists for the given a and b.

    // Iterative greedy solution

    func strWithout3a3b(_ A: Int, _ B: Int) -> String {
        var result = [String]()
        var (a, b) = (A, B)

        while a > 0 || b > 0 {
            if a == 0 {
                return (result + Array(repeating: "b", count: b)).reduce("") { $0 + $1 }
            } else if b == 0 {
                return (result + Array(repeating: "a", count: a)).reduce("") { $0 + $1 }
            } else if a == b {
                return (result + Array(repeating: "ab", count: a)).reduce("") { $0 + $1 }
            } else if a > b {
                result += ["aab"]
                a -= 2
                b -= 1
            } else {
                result += ["bba"]
                a -= 1
                b -= 2
            }
        }
        return result.reduce("") { $0 + $1 }
    }
    
}