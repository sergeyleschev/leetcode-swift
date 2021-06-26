class Solution {

    // 1071. Greatest Common Divisor of Strings
    // For two strings s and t, we say "t divides s" if and only if s = t + ... + t  (t concatenated with itself 1 or more times)
    // Given two strings str1 and str2, return the largest string x such that x divides both str1 and str2.

    // Example 1:
    // Input: str1 = "ABCABC", str2 = "ABC"
    // Output: "ABC"

    // Example 2:
    // Input: str1 = "ABABAB", str2 = "ABAB"
    // Output: "AB"

    // Example 3:
    // Input: str1 = "LEET", str2 = "CODE"
    // Output: ""

    // Example 4:
    // Input: str1 = "ABCDEF", str2 = "ABC"
    // Output: ""

    // Constraints:
    // 1 <= str1.length <= 1000
    // 1 <= str2.length <= 1000
    // str1 and str2 consist of English uppercase letters.

    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        let len1 = str1.count
        let len2 = str2.count
        let minLen = min(len1, len2)

        for i in (1...minLen).reversed() {
            if len1 % i == 0 && len2 % i == 0 {
                let subStr = String(str1[str1.index(str1.startIndex, offsetBy: 0)..<str1.index(str1.startIndex, offsetBy: i)])
                if check(str1, subStr) && check(str2, subStr) { return subStr }
            }
        }

        return ""
    }
    

    func check(_ strA: String, _ strB: String) -> Bool {
        let len = strA.count / strB.count

        for i in 0..<len {
            let subA = String(strA[strA.index(strA.startIndex, offsetBy:  strB.count * i)..<strA.index(strA.startIndex, offsetBy: strB.count * (i + 1))])
            if subA != strB { return false }
        }

        return true
    }

}