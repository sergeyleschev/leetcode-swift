class Solution {

    // Solution @ Sergey Leschev

    // 790. Domino and Tromino Tiling
    // We have two types of tiles: a 2x1 domino shape, and an "L" tromino shape. These shapes may be rotated.
    // XX  <- domino
    // XX  <- "L" tromino
    // X
    // Given n, how many ways are there to tile a 2 x n board? Return your answer modulo 109 + 7.
    // (In a tiling, every square must be covered by a tile. Two tilings are different if and only if there are two 4-directionally adjacent cells on the board such that exactly one of the tilings has both squares occupied by a tile.)

    // Example:
    // Input: n = 3
    // Output: 5
    // Explanation: 
    // The five different ways are listed below, different letters indicates different tiles:
    // XYZ XXZ XYY XXY XYY
    // XYZ YYZ XZZ XYY XXY
    // Note:
    // n will be in range [1, 1000].

    func numTilings(_ N: Int) -> Int {
        guard N > 2 else { return N }
        
        var dp = Array(repeating: [0,0,0] , count: N + 1)
        let kMod = 1000000007;
        
        dp[0][0] = 1
        dp[1][0] = 1
        
        for i in 2...N  {
            dp[i][0] = (dp[i - 1][0] + dp[i - 2][0] + dp[i - 1][1] + dp[i - 1][2]) % kMod
            dp[i][1] = (dp[i - 2][0] + dp[i - 1][2]) % kMod
            dp[i][2] = (dp[i - 2][0] + dp[i - 1][1]) % kMod
        }
        
        return dp.last![0]
    }
    
}