class Solution {

    // Solution @ Sergey Leschev

    // 920. Number of Music Playlists
    // Your music player contains n different songs and she wants to listen to goal (not necessarily different) songs during your trip.  You create a playlist so that:
    // Every song is played at least once
    // A song can only be played again only if k other songs have been played
    // Return the number of possible playlists.  As the answer can be very large, return it modulo 10^9 + 7.

    // Example 1:
    // Input: n = 3, goal = 3, k = 1
    // Output: 6
    // Explanation: There are 6 possible playlists. [1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1].

    // Example 2:
    // Input: n = 2, goal = 3, k = 0
    // Output: 6
    // Explanation: There are 6 possible playlists. [1, 1, 2], [1, 2, 1], [2, 1, 1], [2, 2, 1], [2, 1, 2], [1, 2, 2]

    // Example 3:
    // Input: n = 2, goal = 3, k = 1
    // Output: 2
    // Explanation: There are 2 possible playlists. [1, 2, 1], [2, 1, 2]

    // Note:
    // 0 <= k < n <= goal <= 100

    func numMusicPlaylists(_ n: Int, _ goal: Int, _ k: Int) -> Int {
        let mod = Int(1e9 + 7)
        var dp = [[Int]](repeating: .init(repeating: 0, count: goal + 1), count: n + 1) // songs "n" to form the goal playlist
        
        dp[0][0] = 1
        
        for l in 1...goal {
            for s in 1...min(n, l) {
                dp[s][l] = dp[s - 1][l - 1] * (n - (s - 1)) // new song
                dp[s][l] += dp[s][l - 1] * max(s - k, 0) % mod // adding old songs, even though "k" should not be selected
                dp[s][l] %= mod
            }
        }
        
        return dp[n][goal]
    }
    
}