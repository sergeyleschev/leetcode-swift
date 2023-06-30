class Solution {

    // Solution by Sergey Leschev

    // 1017. Convert to Base -2
    // Given a number n, return a string consisting of "0"s and "1"s that represents its value in base -2 (negative two).
    // The returned string must have no leading zeroes, unless the string is "0".

    // Example 1:
    // Input: n = 2
    // Output: "110"
    // Explantion: (-2) ^ 2 + (-2) ^ 1 = 2

    // Example 2:
    // Input: n = 3
    // Output: "111"
    // Explantion: (-2) ^ 2 + (-2) ^ 1 + (-2) ^ 0 = 3

    // Example 3:
    // Input: n = 4
    // Output: "100"
    // Explantion: (-2) ^ 2 = 4

    // Note:
    // 0 <= n <= 10^9

    func baseNeg2(_ N: Int) -> String {
        if (N == 0) { return "0" }
        var N = N
        var ans = String()
        
        while (N != 0) {
            ans = String(N&1) + ans
            N = -(N >> 1)
        }
        
        return ans
    }
    
}