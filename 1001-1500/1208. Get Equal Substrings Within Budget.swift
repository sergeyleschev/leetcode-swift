class Solution {

    // Solution by Sergey Leschev

    // 1208. Get Equal Substrings Within Budget
    // You are given two strings s and t of the same length. You want to change s to t. Changing the i-th character of s to i-th character of t costs |s[i] - t[i]| that is, the absolute difference between the ASCII values of the characters.
    // You are also given an integer maxCost.
    // Return the maximum length of a substring of s that can be changed to be the same as the corresponding substring of t with a cost less than or equal to maxCost.
    // If there is no substring from s that can be changed to its corresponding substring from t, return 0.

    // Example 1:
    // Input: s = "abcd", t = "bcdf", maxCost = 3
    // Output: 3
    // Explanation: "abc" of s can change to "bcd". That costs 3, so the maximum length is 3.

    // Example 2:
    // Input: s = "abcd", t = "cdef", maxCost = 3
    // Output: 1
    // Explanation: Each character in s costs 2 to change to character in t, so the maximum length is 1.

    // Example 3:
    // Input: s = "abcd", t = "acde", maxCost = 0
    // Output: 1
    // Explanation: You can't make any change, so the maximum length is 1.

    // Constraints:
    // 1 <= s.length, t.length <= 10^5
    // 0 <= maxCost <= 10^6
    // s and t only contain lower case English letters.

    func equalSubstring(_ s: String, _ t: String, _ maxCost: Int) -> Int {
        var s = Array(s)
        var t = Array(t)
        var left = 0
        var right = 0
        var cost = 0
        var ans = 0

        while right < t.count && cost <= maxCost {
            let dif = abs(Int(s[right].asciiValue!) - Int(t[right].asciiValue!))
            cost += dif
            while cost > maxCost {
                cost -= abs(Int(s[left].asciiValue!) - Int(t[left].asciiValue!))
                left += 1
            }
            right += 1
            ans = max(ans, right - left)
        }

        return ans
    }

}
