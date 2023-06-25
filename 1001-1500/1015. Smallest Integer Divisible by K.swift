class Solution {

    // Solution @ Sergey Leschev

    // 1015. Smallest Integer Divisible by K
    // Given a positive integer k, you need to find the length of the smallest positive integer n such that n is divisible by k, and n only contains the digit 1.
    // Return the length of n. If there is no such n, return -1.
    // Note: n may not fit in a 64-bit signed integer.

    // Finds the length of the smallest positive integer N such that N is divisible by K, and N only contains the digit 1.

    // - Parameter K: A positive integer.
    // - Returns: The length of N if such exists, otherwise returns -1.

    // Example 1:
    // Input: k = 1
    // Output: 1
    // Explanation: The smallest answer is n = 1, which has length 1.

    // Example 2:
    // Input: k = 2
    // Output: -1
    // Explanation: There is no such positive integer n divisible by 2.

    // Example 3:
    // Input: k = 3
    // Output: 3
    // Explanation: The smallest answer is n = 111, which has length 3.

    // Constraints:
    // 1 <= k <= 10^5

    // - Complexity:
    //   - time: O(K), where K is the given number K.
    //   - space: O(1), only constant space is used.
    
    func smallestRepunitDivByK(_ K: Int) -> Int {
        var ans = 0

        for i in 1...K {
            ans = (ans * 10 + 1) % K
            guard ans == 0 else { continue }
            return i
        }

        return -1
    }

}