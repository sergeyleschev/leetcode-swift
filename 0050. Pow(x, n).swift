class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 50. Pow(x, n)
    // Implement pow(x, n), which calculates x raised to the power n (i.e., xn).

    // Calculates x raised to the power n (x^n).
    //
    // - Parameters:
    //   - x: The base value.
    //   - n: The power value.
    // - Returns: A decimal number raised to a given power.

    // Example 1:
    // Input: x = 2.00000, n = 10
    // Output: 1024.00000

    // Example 2:
    // Input: x = 2.10000, n = 3
    // Output: 9.26100

    // Example 3:
    // Input: x = 2.00000, n = -2
    // Output: 0.25000
    // Explanation: 2-2 = 1/22 = 1/4 = 0.25
     
    // Constraints:
    // -100.0 < x < 100.0
    // -2^31 <= n <= 2^31-1
    // -10^4 <= xn <= 10^4

    // - Complexity:
    //   - time: O(log n), where n is the power value.
    //   - space: O(log n), where n is the power value.
    
    func myPow(_ x: Double, _ n: Int) -> Double {
        guard n != 0 else { return 1 }

        var x = x
        var n = n

        if n < 0 {
            n = -n
            x = 1 / x
        }
        return n % 2 == 0 ? myPow(x * x, n / 2) : x * myPow(x * x, n / 2)
    }

}