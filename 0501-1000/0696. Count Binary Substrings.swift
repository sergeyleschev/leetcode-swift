class Solution {

    // Solution @ Sergey Leschev

    // 696. Count Binary Substrings
    // Give a binary string s, return the number of non-empty substrings that have the same number of 0's and 1's, and all the 0's and all the 1's in these substrings are grouped consecutively.
    // Substrings that occur multiple times are counted the number of times they occur.

    // Example 1:
    // Input: s = "00110011"
    // Output: 6
    // Explanation: There are 6 substrings that have equal number of consecutive 1's and 0's: "0011", "01", "1100", "10", "0011", and "01".
    // Notice that some of these substrings repeat and are counted the number of times they occur.
    // Also, "00110011" is not a valid substring because all the 0's (and 1's) are not grouped together.

    // Example 2:
    // Input: s = "10101"
    // Output: 4
    // Explanation: There are 4 substrings: "10", "01", "10", "01" that have equal number of consecutive 1's and 0's.

    // Constraints:
    // 1 <= s.length <= 10^5
    // s[i] is either '0' or '1'.

    func countBinarySubstrings(_ s: String) -> Int {
        let chars = Array(s)
        var count = [0, 0]
        var ans = 0
        var last = -1
        
        for char in chars {
            let c = Int(String(char))!
            if c != last { count[c] = 0 }
            count[c] += 1
            if count[c] <= count[1 - c] { ans += 1 }
            last = c
        }
        
        return ans
    }

}