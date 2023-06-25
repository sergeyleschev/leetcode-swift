class Solution {

    // Solution @ Sergey Leschev

    // 762. Prime Number of Set Bits in Binary Representation
    // Given two integers left and right, return the count of numbers in the inclusive range [left, right] having a prime number of set bits in their binary representation.
    // Recall that the number of set bits an integer has is the number of 1's present when written in binary.
    // For example, 21 written in binary is 10101 which has 3 set bits.

    // Example 1:
    // Input: left = 6, right = 10
    // Output: 4
    // Explanation:
    // 6 -> 110 (2 set bits, 2 is prime)
    // 7 -> 111 (3 set bits, 3 is prime)
    // 9 -> 1001 (2 set bits , 2 is prime)
    // 10->1010 (2 set bits , 2 is prime)

    // Example 2:
    // Input: left = 10, right = 15
    // Output: 5
    // Explanation:
    // 10 -> 1010 (2 set bits, 2 is prime)
    // 11 -> 1011 (3 set bits, 3 is prime)
    // 12 -> 1100 (2 set bits, 2 is prime)
    // 13 -> 1101 (3 set bits, 3 is prime)
    // 14 -> 1110 (3 set bits, 3 is prime)
    // 15 -> 1111 (4 set bits, 4 is not prime)

    // Constraints:
    // 1 <= left <= right <= 10^6
    // 0 <= right - left <= 10^4

    func countPrimeSetBits(_ L: Int, _ R: Int) -> Int {
        let primes = Set([2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
        var cnt = 0
        
        for i in L...R {
            var bits = 0
            var n = i
            
            while (n > 0) {
                bits += (n & 1)
                n >>= 1
            }
            cnt += (primes.contains(bits) ? 1 : 0)
        }
        
        return cnt
    }
    
}