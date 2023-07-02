class Solution {

    // Solution by Sergey Leschev

    // 709. To Lower Case
    // Given a string s, return the string after replacing every uppercase letter with the same lowercase letter.

    // Example 1:
    // Input: s = "Hello"
    // Output: "hello"

    // Example 2:
    // Input: s = "here"
    // Output: "here"

    // Example 3:
    // Input: s = "LOVELY"
    // Output: "lovely"

    // Constraints:
    // 1 <= s.length <= 100
    // s consists of printable ASCII characters.

    func toLowerCase(_ str: String) -> String {
        var result = [Character]()
        let upperCaseChars = CharacterSet.uppercaseLetters

        for c in str {
            let val = c.asciiValue ?? 0
            if upperCaseChars.contains(UnicodeScalar(val)) {
                if val >= 65 && val <= 97 {
                    result.append(Character(UnicodeScalar(val + 32)))
                }
            } else {
                result.append(c)
            }
        }

        return result.map { String($0) }.joined()
    }

}
