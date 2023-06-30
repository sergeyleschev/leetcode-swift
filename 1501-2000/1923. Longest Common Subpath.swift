class Solution {

    // Solution by Sergey Leschev

    // 1923. Longest Common Subpath
    // There is a country of n cities numbered from 0 to n - 1. In this country, there is a road connecting every pair of cities.
    // There are m friends numbered from 0 to m - 1 who are traveling through the country. Each one of them will take a path consisting of some cities. Each path is represented by an integer array that contains the visited cities in order. The path may contain a city more than once, but the same city will not be listed consecutively.
    // Given an integer n and a 2D integer array paths where paths[i] is an integer array representing the path of the ith friend, return the length of the longest common subpath that is shared by every friend's path, or 0 if there is no common subpath at all.
    // A subpath of a path is a contiguous sequence of cities within that path.

    // Example 1:
    // Input: n = 5, paths = [[0,1,2,3,4],
    //                        [2,3,4],
    //                        [4,0,1,2,3]]
    // Output: 2
    // Explanation: The longest common subpath is [2,3].

    // Example 2:
    // Input: n = 3, paths = [[0],[1],[2]]
    // Output: 0
    // Explanation: There is no common subpath shared by the three paths.

    // Example 3:
    // Input: n = 5, paths = [[0,1,2,3,4],
    //                        [4,3,2,1,0]]
    // Output: 1
    // Explanation: The possible longest common subpaths are [0], [1], [2], [3], and [4]. All have a length of 1.

    // Constraints:
    // 1 <= n <= 10^5
    // m == paths.length
    // 2 <= m <= 10^5
    // sum(paths[i].length) <= 10^5
    // 0 <= paths[i][j] < n
    // The same city is not listed multiple times consecutively in paths[i].

    private var paths = [[Int]]()
    private let base1 = 101
    private let base2 = 103
    private let mod1 = 1000000007
    private let mod2 = 1000000009
    private var cnt = [Int:Int]()
    private var hashToPathNumber = [Int:Int]()
    private var pathsCnt = -1


    private func check(_ length: Int) -> Bool {
        cnt = [:]
        hashToPathNumber = [:]
        let RM1 = power(base1, length - 1, mod1)
        let RM2 = power(base2, length - 1, mod2)
        
        for pathIdx  in 0..<pathsCnt {
            let path = paths[pathIdx]
            let n = path.count
            var hash1 = 0
            var hash2 = 0
            
            for idx in 0..<length {
                hash1 = (hash1 * base1 + path[idx]) % mod1
                hash2 = (hash2 * base2 + path[idx]) % mod2
            }
            
            var hash = (hash1 << 32) | hash2
            if nil == cnt[hash] || (hashToPathNumber[hash] ?? -1) != pathIdx {
                cnt[hash, default: 0 ] += 1
                hashToPathNumber[hash] = pathIdx
            }
            
            for idx in 0..<(n - length) {
                hash1 = ((hash1 + mod1 - path[idx] * RM1 % mod1) * base1 + path[idx + length ]) % mod1
                hash2 = ((hash2 + mod2 - path[idx] * RM2 % mod2) * base2 + path[idx + length]) % mod2
                hash = (hash1 << 32) | hash2

                if nil == cnt[hash] || (hashToPathNumber[hash] ?? -1) != pathIdx {
                    cnt[hash, default: 0 ] += 1
                    hashToPathNumber[hash] = pathIdx
                }
            }
        }
        return cnt.values.max() ?? 0 == pathsCnt
    }


    func longestCommonSubpath(_ n: Int, _ paths: [[Int]]) -> Int {
        self.paths = paths
        self.pathsCnt = paths.count
        var l = 0
        var r = Int.max

        for path in paths { r = min(r, path.count) }
       
        while l < r {
            let mid = (r + l + 1) >> 1
            if check(mid) {
                l = mid
            } else {
                r = mid - 1
            }
        }
        return r
    }

    
    private func power(_ base: Int, _ length: Int,_ mod: Int) -> Int {
        var ans = 1
        var i = 0
        while i < length {
            ans = ans * base % mod
            i += 1
        }
        return ans
    }

}