class Solution {

    // Solution @ Sergey Leschev

    // 541. Reverse String II
    // Given a string s and an integer k, reverse the first k characters for every 2k characters counting from the start of the string.
    // If there are fewer than k characters left, reverse all of them. If there are less than 2k but greater than or equal to k characters, then reverse the first k characters and left the other as original.

    // Example 1:
    // Input: s = "abcdefg", k = 2
    // Output: "bacdfeg"

    // Example 2:
    // Input: s = "abcd", k = 2
    // Output: "bacd"

    // Constraints:
    // 1 <= s.length <= 10^4
    // s consists of only lowercase English letters.
    // 1 <= k <= 10^4

    func reverseStr(_ s: String, _ k: Int) -> String {
        if k == 0{
            return s
        } else if k > s.count {
            return String(s.reversed())
        }
        
        var index = 1
        var temp = ""
        var result = ""
        
        for char in s {
            temp += String(char)
            if index == k {
                result += String(temp.reversed())
                temp = ""
            } else if index == 2 * k {
                index = 0
                result += temp
                temp = ""
            }
            index += 1
        }

        if index < k {
            result += String(temp.reversed())
        } else {
            result += temp
        }
        
        return result
    }
    
}