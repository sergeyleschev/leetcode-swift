class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 887. Super Egg Drop
    // You are given k identical eggs and you have access to a building with n floors labeled from 1 to n.
    // You know that there exists a floor f where 0 <= f <= n such that any egg dropped at a floor higher than f will break, and any egg dropped at or below floor f will not break.
    // Each move, you may take an unbroken egg and drop it from any floor x (where 1 <= x <= n). If the egg breaks, you can no longer use it. However, if the egg does not break, you may reuse it in future moves.
    // Return the minimum number of moves that you need to determine with certainty what the value of f is.

    // Example 1:
    // Input: k = 1, n = 2
    // Output: 2
    // Explanation: 
    // Drop the egg from floor 1. If it breaks, we know that f = 0.
    // Otherwise, drop the egg from floor 2. If it breaks, we know that f = 1.
    // If it does not break, then we know f = 2.
    // Hence, we need at minimum 2 moves to determine with certainty what the value of f is.

    // Example 2:
    // Input: k = 2, n = 6
    // Output: 3

    // Example 3:
    // Input: k = 3, n = 14
    // Output: 4

    // Constraints:
    // 1 <= k <= 100
    // 1 <= n <= 10^4

    func superEggDrop(_ K: Int, _ N: Int) -> Int {
        var memo = Array(repeating: Array(repeating: -1, count: N + 1), count: K + 1)
        

        func dp(_ K: Int, _ N: Int) -> Int {
            if N == 0 { return 0 }
            if K == 1 { return N }
            
            if memo[K][N] != -1 { return memo[K][N] }
            
            var count = Int.max
            var lo = 1
            var hi = N

            while lo <= hi {
                let mid = lo + (hi - lo) / 2
                let broken = dp(K - 1, mid - 1)
                let safe = dp(K, N - mid)
                if broken > safe {
                    hi = mid - 1
                    count = min(count, broken + 1)
                } else {
                    lo = mid + 1
                    count = min(count, safe + 1)
                }
            }
            
            memo[K][N] = count
            return count
        }
        
        return dp(K, N)
    }

}