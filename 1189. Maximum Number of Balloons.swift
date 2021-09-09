class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1189. Maximum Number of Balloons
    // Given a string text, you want to use the characters of text to form as many instances of the word "balloon" as possible.
    // You can use each character in text at most once. Return the maximum number of instances that can be formed.

    // Example 1:
    // Input: text = "nlaebolko"
    // Output: 1

    // Example 2:
    // Input: text = "loonbalxballpoon"
    // Output: 2

    // Example 3:
    // Input: text = "leetcode"
    // Output: 0

    // Constraints:
    // 1 <= text.length <= 10^4
    // text consists of lower case English letters only.

    func maxNumberOfBalloons(_ text: String) -> Int {
        var countChars = ["b" : 0, "a" : 0, "l" : 0, "o" : 0, "n" : 0]
        var l = 0
        var o = 0

        for char in text {
            if char == "b" || char == "a" || char == "n" {
                let currentVal = countChars[String(char)]!
                countChars.updateValue(currentVal + 1, forKey: String(char))
            } else if char == "l"  {
                l += 1
                if l == 2 {
                    let currentVal = countChars[String(char)]!
                    countChars.updateValue(currentVal + 1, forKey: String(char))
                    l = 0
                }
            } else if char == "o" {
                o += 1
                if o == 2 {
                    let currentVal = countChars[String(char)]!
                    countChars.updateValue(currentVal + 1, forKey: String(char))
                    o = 0
                }
            }
        }

        return countChars.values.min()!
    }

}