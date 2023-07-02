class Solution {

    // Solution by Sergey Leschev

    // 557. Reverse Words in a String III
    // Given a string s, reverse the order of characters in each word within a sentence while still preserving whitespace and initial word order.

    // Example 1:
    // Input: s = "Let's take LeetCode contest"
    // Output: "s'teL ekat edoCteeL tsetnoc"

    // Example 2:
    // Input: s = "God Ding"
    // Output: "doG gniD"

    // Constraints:
    // 1 <= s.length <= 5 * 10^4
    // s contains printable ASCII characters.
    // s does not contain any leading or trailing spaces.
    // There is at least one word in s.
    // All the words in s are separated by a single space.

    func reverseWords(_ s: String) -> String {
        let stringArray = s.components(separatedBy: " ")

        var resultArray = [String]()
        for str in stringArray { resultArray.append(String(str.reversed())) }

        return resultArray.joined(separator: " ")
    }

}
