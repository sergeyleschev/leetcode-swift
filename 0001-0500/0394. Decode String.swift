class Solution {

    // Solution @ Sergey Leschev

    // 394. Decode String
    // Given an encoded string, return its decoded string.
    // The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is being repeated exactly k times. Note that k is guaranteed to be a positive integer.
    // You may assume that the input string is always valid; No extra white spaces, square brackets are well-formed, etc.
    // Furthermore, you may assume that the original data does not contain any digits and that digits are only for those repeat numbers, k. For example, there won't be input like 3a or 2[4].

    // Example 1:
    // Input: s = "3[a]2[bc]"
    // Output: "aaabcbc"

    // Example 2:
    // Input: s = "3[a2[c]]"
    // Output: "accaccacc"

    // Example 3:
    // Input: s = "2[abc]3[cd]ef"
    // Output: "abcabccdcdcdef"

    // Example 4:
    // Input: s = "abc3[cd]xyz"
    // Output: "abccdcdcdxyz"

    // Constraints:
    // 1 <= s.length <= 30
    // s consists of lowercase English letters, digits, and square brackets '[]'.
    // s is guaranteed to be a valid input.
    // All the integers in s are in the range [1, 300].

    // Decode string. The encoding rule is k[encoded_string].
    // - Parameter s: An encoded string.
    // - Returns: Decoded string.

    // - Complexity:
    //   - time: O(k * n), where k is the maximum value of k, and n is the length of s.
    //   - space: O(n), where n is the length of s.

    func decodeString(_ s: String) -> String {
        var stack = [Int]()
        var prefix = [String]()
        var digits = ""

        for char in s {
            guard !char.isNumber else { digits = "\(digits)\(char)"; continue }

            guard char != "]" else {
                var tmp = ""
                while !prefix.isEmpty {
                    let last = prefix.removeLast()
                    guard last != "[" else { break }
                    tmp = "\(last)\(tmp)"
                }
                let count = stack.removeLast()
                tmp = String(repeating: tmp, count: count)
                prefix.append(tmp)
                continue
            }

            prefix.append(String(char))
            guard let num = Int(digits) else { continue }
            stack.append(num)
            digits = ""
        }

        var ans = ""
        while !prefix.isEmpty { ans = "\(prefix.removeLast())\(ans)" }

        return ans
    }

}