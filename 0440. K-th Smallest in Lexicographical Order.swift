class Solution {

    // 440. K-th Smallest in Lexicographical Order
    // Given two integers n and k, return the kth lexicographically smallest integer in the range [1, n].

    // Example 1:
    // Input: n = 13, k = 2
    // Output: 10
    // Explanation: The lexicographical order is [1, 10, 11, 12, 13, 2, 3, 4, 5, 6, 7, 8, 9], so the second smallest number is 10.

    // Example 2:
    // Input: n = 1, k = 1
    // Output: 1

    // Constraints:
    // 1 <= k <= n <= 10^9

    func findKthNumber(_ n: Int, _ k: Int) -> Int {
        if k == 1 { return 1 }
        if n < 10 { return k }
        
        var cur = 1
        /* First Level is not 10-Tree, only 1-9 */
        var k = k - 1
        while (k > 0) {
            var step = 0
            var first = cur
            var last = cur + 1
            
            while first <= n {
                step += min(n + 1, last) - first
                first *= 10
                last *= 10
            }
            
            if step <= k {
                cur += 1
                k -= step
            } else {
                cur *= 10
                k -= 1
            }
        }
        
        return cur
    }
    
}