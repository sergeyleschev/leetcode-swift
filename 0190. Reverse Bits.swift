class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 190. Reverse Bits
    // Reverse bits of a given 32 bits unsigned integer.

    // Note:
    // Note that in some languages such as Java, there is no unsigned integer type. In this case, both input and output will be given as a signed integer type. They should not affect your implementation, as the integer's internal binary representation is the same, whether it is signed or unsigned.
    // In Java, the compiler represents the signed integers using 2's complement notation. Therefore, in Example 2 above, the input represents the signed integer -3 and the output represents the signed integer -1073741825.
    // Follow up:
    // If this function is called many times, how would you optimize it?

    // Example 1:
    // Input: n = 00000010100101000001111010011100
    // Output:    964176192 (00111001011110000010100101000000)
    // Explanation: The input binary string 00000010100101000001111010011100 represents the unsigned integer 43261596, so return 964176192 which its binary representation is 00111001011110000010100101000000.

    // Example 2:
    // Input: n = 11111111111111111111111111111101
    // Output:   3221225471 (10111111111111111111111111111111)
    // Explanation: The input binary string 11111111111111111111111111111101 represents the unsigned integer 4294967293, so return 3221225471 which its binary representation is 10111111111111111111111111111111. 

    // Constraints:
    // The input must be a binary string of length 32

    func reverseBits(_ n: Int) -> Int {
        var res = n
        
        for i in 0..<16 {
            let mask0 = 1 << i
            let mask1 = 1 << (31 - i)
            let bit0 = mask0 & n
            let bit1 = mask1 & n
            if bit0 > 0 && bit1 == 0 {
                res ^= bit0
                res ^= mask1
            } else if bit1 > 0 && bit0 == 0 {
                res ^= bit1
                res ^= mask0
            }
        }
        
        return res
    }

    /*
    func reverseBits(_ n: Int) -> Int {
        var res = 0
        
        for i in 0..<32 {
            let mask = 1 << i
            if i < 16 {
                res |= (mask & n) << (31 - 2 * i)
            } else {
                res |= (mask & n) >> (2 * i - 31)
            }
        }
        
        return res
    }
    */
}