class Solution {

    // Solution @ Sergey Leschev

    // 1223. Dice Roll Simulation
    // A die simulator generates a random number from 1 to 6 for each roll. You introduced a constraint to the generator such that it cannot roll the number i more than rollMax[i] (1-indexed) consecutive times. 
    // Given an array of integers rollMax and an integer n, return the number of distinct sequences that can be obtained with exact n rolls.
    // Two sequences are considered different if at least one element differs from each other. Since the answer may be too large, return it modulo 10^9 + 7.

    // Example 1:
    // Input: n = 2, rollMax = [1,1,2,2,2,3]
    // Output: 34
    // Explanation: There will be 2 rolls of die, if there are no constraints on the die, there are 6 * 6 = 36 possible combinations. In this case, looking at rollMax array, the numbers 1 and 2 appear at most once consecutively, therefore sequences (1,1) and (2,2) cannot occur, so the final answer is 36-2 = 34.

    // Example 2:
    // Input: n = 2, rollMax = [1,1,1,1,1,1]
    // Output: 30

    // Example 3:
    // Input: n = 3, rollMax = [1,1,1,2,2,3]
    // Output: 181

    // Constraints:
    // 1 <= n <= 5000
    // rollMax.length == 6
    // 1 <= rollMax[i] <= 15

    // Solution: DP
    // dp[i][j]
    // - j in [0...m-1] at i th rolling, how many combination with last dice is j
    // - j == m, at i th rolling, total combinations
    // the question is how to calculate the combinations of ...xy. Actually if you take a deeper look, what ...xy means is essentially: give me all the combinations as long as the last face is not 5. We don't care what x should be here because it is not restricted and could choose any value (it could be even same as y, or same as 5). As long as y is not equal to 5, we are good to go. And that is the definition dp[i][j]!

    // - Complexity:
    //   - time: O(n*m*m)
    //   - space: O(mn)

    func dieSimulator(_ n: Int, _ rollMax: [Int]) -> Int {
        let mod = Int(1e9 + 7)
        let m = rollMax.count // 6
        // dp[i][j]
        // - j in [0...m-1] at i th rolling, how many combination with last dice is j
        // - j == m, at i th rolling, total combinations
        var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)

        dp[0][m] = 1 // roll 0 times, total combination is 1
        for j in 0..<m { dp[1][j] = 1 } // roll 1 times, combination end at j is 1
        dp[1][m] = m // roll 1 times, total combination is 6

        for i in 2...n {
            for j in 0..<m {
                // at each [i, j], trying to go up (decrease i) and collect all the sum of previous state
                for k in 1...min(i, rollMax[j]) { dp[i][j] += dp[i - k][m] - dp[i - k][j] }
            }
            dp[i][m] = dp[i].reduce(into: 0) { res, next in res += next } % mod
        }

        return dp[n][m] < 0 ? mod + dp[n][m] : dp[n][m]
    }
    
}