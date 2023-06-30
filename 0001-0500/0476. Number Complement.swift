class Solution {

    // Solution by Sergey Leschev

    // 476. Number Complement
    // Given a positive integer num, output its complement number. The complement strategy is to flip the bits of its binary representation.

    // Flips the bits of num.

    // - Parameter num: Positive integer.
    // - Returns: Complement of num.

    // Example 1:
    // Input: num = 5
    // Output: 2
    // Explanation: The binary representation of 5 is 101 (no leading zero bits), and its complement is 010. So you need to output 2.

    // Example 2:
    // Input: num = 1
    // Output: 0
    // Explanation: The binary representation of 1 is 1 (no leading zero bits), and its complement is 0. So you need to output 0.

    // Constraints:
    // The given integer num is guaranteed to fit within the range of a 32-bit signed integer.
    // num >= 1
    // You could assume no leading zero bit in the integer’s binary representation.

    // - Complexity:
    //   - time: O(n), where n is the number of digits in num.
    //   - space: O(1), only constant space is used.
    
    func findComplement(_ num: Int) -> Int {
        guard num != 0 else { return 1 }
        var i = 1

        while i <= num { i <<= 1 }

        return (i - 1) ^ num
    }

}