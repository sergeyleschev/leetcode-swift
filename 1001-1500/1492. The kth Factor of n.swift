class Solution {

    // Solution by Sergey Leschev

    // 1492. The kth Factor of n
    // Given two positive integers n and k.
    // A factor of an integer n is defined as an integer i where n % i == 0.
    // Consider a list of all factors of n sorted in ascending order, return the kth factor in this list or return -1 if n has less than k factors.

    // Finds the kth factor or returns -1 if n has less than k factors.

    // - Parameters:
    //   - n: Positive integer.
    //   - k: Positive integer.
    // - Returns: The kth factor if exist, otherwise returns -1.

    // Example 1:
    // Input: n = 12, k = 3
    // Output: 3
    // Explanation: Factors list is [1, 2, 3, 4, 6, 12], the 3rd factor is 3.

    // Example 2:
    // Input: n = 7, k = 2
    // Output: 7
    // Explanation: Factors list is [1, 7], the 2nd factor is 7.

    // Example 3:
    // Input: n = 4, k = 4
    // Output: -1
    // Explanation: Factors list is [1, 2, 4], there is only 3 factors. We should return -1.

    // Example 4:
    // Input: n = 1, k = 1
    // Output: 1
    // Explanation: Factors list is [1], the 1st factor is 1.

    // Example 5:
    // Input: n = 1000, k = 3
    // Output: 4
    // Explanation: Factors list is [1, 2, 4, 5, 8, 10, 20, 25, 40, 50, 100, 125, 200, 250, 500, 1000].

    // Constraints:
    // 1 <= k <= n <= 1000

    // - Complexity:
    //   - time: O(n), where n is given n.
    //   - space: O(1), only constant space is used.
    
    func kthFactor(_ n: Int, _ k: Int) -> Int {
        var k = k
        
        for i in 1...(n / 2 + 1) {
            guard n % i == 0 else { continue }
            k -= 1
            guard k == 0 else { continue }
            return i
        }
        
        return k == 1 ? n : -1
    }

}