class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 552. Student Attendance Record II
    // An attendance record for a student can be represented as a string where each character signifies whether the student was absent, late, or present on that day. The record only contains the following three characters:
    // 'A': Absent.
    // 'L': Late.
    // 'P': Present.
    // Any student is eligible for an attendance award if they meet both of the following criteria:
    // The student was absent ('A') for strictly fewer than 2 days total.
    // The student was never late ('L') for 3 or more consecutive days.
    // Given an integer n, return the number of possible attendance records of length n that make a student eligible for an attendance award. The answer may be very large, so return it modulo 109 + 7.

    // Example 1:
    // Input: n = 2
    // Output: 8
    // Explanation: There are 8 records with length 2 that are eligible for an award:
    // "PP", "AP", "PA", "LP", "PL", "AL", "LA", "LL"
    // Only "AA" is not eligible because there are 2 absences (there need to be fewer than 2).

    // Example 2:
    // Input: n = 1
    // Output: 3

    // Example 3:
    // Input: n = 10101
    // Output: 183236316

    // Constraints:
    // 1 <= n <= 10^5

    func checkRecord(_ n: Int) -> Int {
        guard n > 1 else { return 1 == n ? 3 : 0 }
        let M = 1000000007
        var f = [Int]()

        if n <= 5 {
            for _ in 0 ..< 6 { f.append(0) }
        } else {
            for _ in 0 ..< n + 1 { f.append(0) }
        }

        f[0] = 1
        f[1] = 2
        f[2] = 4
        f[3] = 7
        if n >= 4 {
            for i in 4 ... n {
                f[i] = ((2 * f[i - 1]) % M + (M - f[i - 4])) % M
            }
        }

        var res = f[n]
        for i in 1 ... n { res += (f[i - 1] * f[n - i])%M }
        
        return res % M
    }
    
}