class Solution {

    // Solution @ Sergey Leschev

    // 1531. String Compression II
    // Run-length encoding is a string compression method that works by replacing consecutive identical characters (repeated 2 or more times) with the concatenation of the character and the number marking the count of the characters (length of the run). For example, to compress the string "aabccc" we replace "aa" by "a2" and replace "ccc" by "c3". Thus the compressed string becomes "a2bc3".
    // Notice that in this problem, we are not adding '1' after single characters.
    // Given a string s and an integer k. You need to delete at most k characters from s such that the run-length encoded version of s has minimum length.

    // Find the minimum length of the run-length encoded version of s after deleting at most k characters.

    // Example 1:
    // Input: s = "aaabcccd", k = 2
    // Output: 4
    // Explanation: Compressing s without deleting anything will give us "a3bc3d" of length 6. Deleting any of the characters 'a' or 'c' would at most decrease the length of the compressed string to 5, for instance delete 2 'a' then we will have s = "abcccd" which compressed is abc3d. Therefore, the optimal way is to delete 'b' and 'd', then the compressed version of s will be "a3c3" of length 4.

    // Example 2:
    // Input: s = "aabbaa", k = 2
    // Output: 2
    // Explanation: If we delete both 'b' characters, the resulting compressed string would be "a4" of length 2.

    // Example 3:
    // Input: s = "aaaaaaaaaaa", k = 0
    // Output: 3
    // Explanation: Since k is zero, we cannot delete anything. The compressed string is "a11" of length 3.

    // Constraints:
    // 1 <= s.length <= 100
    // 0 <= k <= s.length
    // s contains only lowercase English letters.

    private let N = 127
    private var dp = [[Int]]() //dp[left][k]:the minimal coding size for substring s[left:] and remove at most at k
    private var chars: [Int] = []
    private var n = -1

    
    func getLengthOfOptimalCompression(_ s: String, _ k: Int) -> Int {
        guard k < s.count else { return 0 }
        guard s.count > 1 else { return s.count }
        self.dp = [[Int]](repeating: [Int](repeating: -1, count: 127), count: 127)
        self.n = s.count
        self.chars = s.map({ Int($0.asciiValue!) - 97 })
        return solve(0, k)
    }
    

    private func getLengthOfDigit(_ x : Int) -> Int {
        x == 1 ? 0 : (x < 10 ? 1 : (x < 100 ? 2 : 3))
    }
    

    private func solve(_ left: Int, _ k: Int) -> Int {
        guard k >= 0 else { return N }
        if left >= N || n - left <= k { return 0 }
        var ans = dp[left][k]
        guard ans == -1 else { return ans }
        ans = N
        var cnt = [Int](repeating: 0, count: 26)
        var j = left
        var most = 0

        while j < n {
            cnt[chars[j]] += 1
            most = max(most, cnt[chars[j]])
            ans = min(ans, 1 + getLengthOfDigit(most) + solve(j + 1, k - (j - left + 1 - most)))
            j += 1
        }
        
        dp[left][k] = ans
        return ans
    }

}