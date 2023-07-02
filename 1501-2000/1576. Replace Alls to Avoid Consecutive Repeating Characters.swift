class Solution {

    // Solution by Sergey Leschev

    // 1576. Replace All ?'s to Avoid Consecutive Repeating Characters
    // Given a string s containing only lower case English letters and the '?' character, convert all the '?' characters into lower case letters such that the final string does not contain any consecutive repeating characters. You cannot modify the non '?' characters.
    // It is guaranteed that there are no consecutive repeating characters in the given string except for '?'.

    // Return the final string after all the conversions (possibly zero) have been made. If there is more than one solution, return any of them. It can be shown that an answer is always possible with the given constraints.

    // Example 1:
    // Input: s = "?zs"
    // Output: "azs"
    // Explanation: There are 25 solutions for this problem. From "azs" to "yzs", all are valid. Only "z" is an invalid modification as the string will consist of consecutive repeating characters in "zzs".

    // Example 2:
    // Input: s = "ubv?w"
    // Output: "ubvaw"
    // Explanation: There are 24 solutions for this problem. Only "v" and "w" are invalid modifications as the strings will consist of consecutive repeating characters in "ubvvw" and "ubvww".

    // Example 3:
    // Input: s = "j?qg??b"
    // Output: "jaqgacb"

    // Example 4:
    // Input: s = "??yw?ipkj?"
    // Output: "acywaipkja"

    // Constraints:
    // 1 <= s.length <= 100
    // s contains only lower case English letters and '?'.

    func modifyString(_ s: String) -> String {
        var chars = [Character](s)
        let n = chars.count
        let letters = [Character]("abcdefghijklmnopqrstuvwxyz")

        func change(_ index: Int) {
            let left: Character? = index == 0 ? nil : chars[index - 1]
            let right: Character? =
                index == n - 1 ? nil : (chars[index + 1] == "?" ? nil : chars[index + 1])
            for letter in letters {
                var flag = true
                if let l = left, l == letter { flag = false }
                if let r = right, r == letter { flag = false }
                if flag {
                    chars[index] = letter
                    return
                }
            }
        }

        for i in 0..<n where chars[i] == "?" { change(i) }
        return String(chars)
    }

}
