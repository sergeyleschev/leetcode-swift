class Solution {

    // Solution by Sergey Leschev

    // 1227. Airplane Seat Assignment Probability
    // n passengers board an airplane with exactly n seats. The first passenger has lost the ticket and picks a seat randomly. But after that, the rest of passengers will:
    // Take their own seat if it is still available,
    // Pick other seats randomly when they find their seat occupied
    // What is the probability that the n-th person can get his own seat?

    // Example 1:
    // Input: n = 1
    // Output: 1.00000
    // Explanation: The first person can only get the first seat.

    // Example 2:
    // Input: n = 2
    // Output: 0.50000
    // Explanation: The second person has a probability of 0.5 to get the second seat (when first person gets the first seat).

    // Constraints:
    // 1 <= n <= 10^5

    //  Description:
    //  n passengers board an airplane with exactly n seats. The first passenger has lost the ticket and picks a seat randomly. But after that, the rest of passengers will:
    //  Take their own seat if it is still available,
    //  Pick other seats randomly when they find their seat occupied
    //  What is the probability that the n-th person can get his own seat?
    //  func nthPersonGetsNthSeat(_ n: Int) -> Double {
    //     guard n > 1 else { return 1 }
    //     guard n > 2 else { return 0.5 }
    //     var dp = Array(repeating: Double(0), count: n + 1)
    //     dp[1] = 1
    //     dp[2] = 0.5
    //     for i in 3 ... n {
    //         dp[i] = 1.0 / Double(i) // 1-st passanger took the 1-st place
    //                 + (1.0 - (1.0 + 1.0) / Double(i)) // the 1-st passanger didn't take the 1-st place or the 1-st passanger didn't take the i-th place, the 1-st passanger took any place except the 1-st and i-th
    //                 * dp[i-1]
    //     }
    //     return dp[n]
    // }

    func nthPersonGetsNthSeat(_ n: Int) -> Double { n == 1 ? 1.0 : 0.5 }

}
