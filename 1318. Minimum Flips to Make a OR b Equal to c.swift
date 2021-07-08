class Solution {

    // 1318. Minimum Flips to Make a OR b Equal to c
    // Given 3 positives numbers a, b and c. Return the minimum flips required in some bits of a and b to make ( a OR b == c ). (bitwise OR operation).
    // Flip operation consists of change any single bit 1 to 0 or change the bit 0 to 1 in their binary representation.

    // Example 1:
    // Input: a = 2, b = 6, c = 5
    // Output: 3
    // Explanation: After flips a = 1 , b = 4 , c = 5 such that (a OR b == c)

    // Example 2:
    // Input: a = 4, b = 2, c = 7
    // Output: 1

    // Example 3:
    // Input: a = 1, b = 2, c = 3
    // Output: 0

    // Constraints:
    // 1 <= a <= 10^9
    // 1 <= b <= 10^9
    // 1 <= c <= 10^9

    func minFlips(_ a: Int, _ b: Int, _ c: Int) -> Int {
        var count = 0
        var a = a
        var b = b
        var c = c

        while a > 0 || b > 0 || c > 0 {
            if c % 2 == 1 {
                count += 1 - ((a % 2) | (b % 2))
            } else {
                count += (a % 2) + (b % 2)
            }
            c /= 2
            b /= 2
            a /= 2
        }

        return count
    }
    
}