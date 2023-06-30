class Solution {

    // Solution by Sergey Leschev

    // 1864. Minimum Number of Swaps to Make the Binary String Alternating
    // Given a binary string s, return the minimum number of character swaps to make it alternating, or -1 if it is impossible.
    // The string is called alternating if no two adjacent characters are equal. For example, the strings "010" and "1010" are alternating, while the string "0100" is not.
    // Any two characters may be swapped, even if they are not adjacent.

    // Example 1:
    // Input: s = "111000"
    // Output: 1
    // Explanation: Swap positions 1 and 4: "111000" -> "101010"
    // The string is now alternating.

    // Example 2:
    // Input: s = "010"
    // Output: 0
    // Explanation: The string is already alternating, no swaps are needed.

    // Example 3:
    // Input: s = "1110"
    // Output: -1

    // Constraints:
    // 1 <= s.length <= 1000
    // s[i] is either '0' or '1'.

    func minSwaps(_ s: String) -> Int {
        var oneCnt = 0
        var zeroCnt = 0
        
        for ch in s {
            if ch == "1" {
                oneCnt += 1
            } else {
                zeroCnt += 1
            }
        }

        guard abs(oneCnt - zeroCnt) <= 1 else { return -1 }

        if zeroCnt > oneCnt {
            return helper(s, "0")
        } else if oneCnt > zeroCnt {
            return helper(s, "1")
        } else {
            return min(helper(s, "1"), helper(s, "0"))
        }
    }


    private func helper(_ s: String, _ char: Character) -> Int {
        var swaps = 0
        var targetChar = char
        
        for ch in s {
            if ch != targetChar { swaps += 1 }
            targetChar =  targetChar == "0" ? "1" : "0"
        }
        return swaps >> 1
    }

}