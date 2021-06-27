class Solution {

    // 1137. N-th Tribonacci Number
    // The Tribonacci sequence Tn is defined as follows: 
    // T0 = 0, T1 = 1, T2 = 1, and Tn+3 = Tn + Tn+1 + Tn+2 for n >= 0.
    // Given n, return the value of Tn.

    // Example 1:
    // Input: n = 4
    // Output: 4
    // Explanation:
    // T_3 = 0 + 1 + 1 = 2
    // T_4 = 1 + 1 + 2 = 4

    // Example 2:
    // Input: n = 25
    // Output: 1389537

    // Constraints:
    // 0 <= n <= 37
    // The answer is guaranteed to fit within a 32-bit integer, ie. answer <= 2^31 - 1.

    // Approach: DP

    // - Complexity:
    //   - time: O(n)
    //   - space: O(1), only constant space is used.

    func tribonacci(_ n: Int) -> Int {
        var arr = [0, 1, 1]
        if n < 3 { return arr[n] }
        
        for i in 1..<n - 1 {
            var next = arr[0] + arr[1] + arr[2]
            arr[0] = arr[1]
            arr[1] = arr[2]
            arr[2] = next
        }

        return arr[2]
    }
    
}