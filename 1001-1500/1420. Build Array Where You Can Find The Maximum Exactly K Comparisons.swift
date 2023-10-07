class Solution {

    // Solution by Sergey Leschev
    // 1420. Build Array Where You Can Find The Maximum Exactly K Comparisons

    // The runtime of this solution is O(NKM^2)
    // but you can achieve O(NKM * log(M)) with a Fenwick tree
    // or O(NKM) by using prefix sums and eliminating the innermost for-loop

    func numOfArrays(_ n: Int, _ m: Int, _ k: Int) -> Int {
        let MOD = 1_000_000_007

        var ways = Array(
            repeating: Array(repeating: Array(repeating: 0, count: k + 1), count: m + 1),
            count: n + 1)

        // Base cases: ways[1][j][1] = 1 for all j from 1 to m.
        for j in 1...m {
            ways[1][j][1] = 1
        }

        for a in 1...n {
            for b in 1...m {
                for c in 1...k {
                    var s: Int = 0

                    // First case: Append any element from [1, b] to the end of the array.
                    s = (s + b * ways[a - 1][b][c]) % MOD

                    // Second case: Append the element "b" to the end of the array.
                    for x in 1..<b {
                        s = (s + ways[a - 1][x][c - 1]) % MOD
                    }

                    ways[a][b][c] = (ways[a][b][c] + s) % MOD
                }
            }
        }

        var ans: Int = 0

        for j in 1...m {
            ans = (ans + ways[n][j][k]) % MOD
        }

        return ans
    }
}
