class Solution {

    // Solution @ Sergey Leschev

    // 878. Nth Magical Number
    // A positive integer is magical if it is divisible by either a or b.
    // Given the three integers n, a, and b, return the nth magical number. Since the answer may be very large, return it modulo 10^9 + 7.

    // Example 1:
    // Input: n = 1, a = 2, b = 3
    // Output: 2

    // Example 2:
    // Input: n = 4, a = 2, b = 3
    // Output: 6

    // Example 3:
    // Input: n = 5, a = 2, b = 4
    // Output: 10

    // Example 4:
    // Input: n = 3, a = 6, b = 4
    // Output: 8 

    // Constraints:
    // 1 <= n <= 10^9
    // 2 <= a, b <= 4 * 10^4

    private let MOD = 1_000_000_007


    private func gcd(_ a: Int, _ b: Int) -> Int { b == 0 ? a : gcd(b, a % b) }


    func nthMagicalNumber(_ N: Int, _ A: Int, _ B: Int) -> Int {
        let lcm = A * B / gcd(A, B)
        var left = 1
        var right = min(A, B) * N

        while left < right {
            let mid = left + (right - left) >> 1
            let cnt = mid / A + mid / B - mid / lcm
            if cnt > N {
                right = mid
            } else if cnt < N {
                left = mid + 1
            } else {
                let subOne = mid - 1
                if subOne / A + subOne / B - subOne / lcm < N {
                    return mid % MOD
                } else {
                    right = mid
                }
                
            }
        }

        return left % MOD
    }

}