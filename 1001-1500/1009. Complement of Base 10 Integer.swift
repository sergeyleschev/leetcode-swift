class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1009. Complement of Base 10 Integer
    // Every non-negative integer n has a binary representation.  For example, 5 can be represented as "101" in binary, 11 as "1011" in binary, and so on.  Note that except for n = 0, there are no leading zeroes in any binary representation.
    // The complement of a binary representation is the number in binary you get when changing every 1 to a 0 and 0 to a 1.  For example, the complement of "101" in binary is "010" in binary.
    // For a given number n in base-10, return the complement of it's binary representation as a base-10 integer.

    // Flips the bits of num.

    // - Parameter num: Non-negative integer.
    // - Returns: Complement of num.

    // Example 1:
    // Input: n = 5
    // Output: 2
    // Explanation: 5 is "101" in binary, with complement "010" in binary, which is 2 in base-10.

    // Example 2:
    // Input: n = 7
    // Output: 0
    // Explanation: 7 is "111" in binary, with complement "000" in binary, which is 0 in base-10.

    // Example 3:
    // Input: n = 10
    // Output: 5
    // Explanation: 10 is "1010" in binary, with complement "0101" in binary, which is 5 in base-10.

    // Note:
    // 0 <= n < 10^9

    // - Complexity:
    //   - time: O(n), where n is the number of digits in num.
    //   - space: O(1), only constant space is used.
    
    func bitwiseComplement(_ N: Int) -> Int {
        guard N != 0 else { return 1 }
        var i = 1
        while i <= N { i <<= 1 }
        return (i - 1) ^ N
    }

}