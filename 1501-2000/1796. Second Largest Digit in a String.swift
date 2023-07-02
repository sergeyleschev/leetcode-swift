class Solution {

    // Solution by Sergey Leschev

    // 1796. Second Largest Digit in a String
    // Given an alphanumeric string s, return the second largest numerical digit that appears in s, or -1 if it does not exist.
    // An alphanumeric string is a string consisting of lowercase English letters and digits.

    // Example 1:
    // Input: s = "dfa12321afd"
    // Output: 2
    // Explanation: The digits that appear in s are [1, 2, 3]. The second largest digit is 2.

    // Example 2:
    // Input: s = "abc1111"
    // Output: -1
    // Explanation: The digits that appear in s are [1]. There is no second largest digit.

    // Constraints:
    // 1 <= s.length <= 500
    // s consists of only lowercase English letters and/or digits.

    func secondHighest(_ s: String) -> Int {
        var numbers = Set<Int>()
        for ch in s where ch.isNumber { numbers.insert(Int(ch.asciiValue! - 48)) }
        guard numbers.count >= 2 else { return -1 }
        let sortedNumbers = numbers.sorted { $0 > $1 }
        return sortedNumbers[1]
    }

}
