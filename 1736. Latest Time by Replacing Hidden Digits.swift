class Solution {

    // 1736. Latest Time by Replacing Hidden Digits
    // You are given a string time in the form of hh:mm, where some of the digits in the string are hidden (represented by ?).
    // The valid times are those inclusively between 00:00 and 23:59.

    // Return the latest valid time you can get from time by replacing the hidden digits.

    // Example 1:
    // Input: time = "2?:?0"
    // Output: "23:50"
    // Explanation: The latest hour beginning with the digit '2' is 23 and the latest minute ending with the digit '0' is 50.

    // Example 2:
    // Input: time = "0?:3?"
    // Output: "09:39"

    // Example 3:
    // Input: time = "1?:22"
    // Output: "19:22"

    // Constraints:
    // time is in the format hh:mm.
    // It is guaranteed that you can produce a valid time from the given string.

    func maximumTime(_ time: String) -> String {
        var chars = [Character](time)
        if chars[0] == "?" { chars[0] = (chars[1] == "?" || chars[1] == "1" || chars[1] == "2" || chars[1] == "3" || chars[1] == "0") ? "2" : "1" }
        if chars[1] == "?" { chars[1] = chars[0] == "2" ? "3" : "9" }
        if chars[3] == "?" { chars[3] = "5" }
        if chars[4] == "?" { chars[4] = "9" }
        return String(chars)
    }

}