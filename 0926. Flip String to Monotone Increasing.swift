class Solution {

    // 926. Flip String to Monotone Increasing
    // A string of '0's and '1's is monotone increasing if it consists of some number of '0's (possibly 0), followed by some number of '1's (also possibly 0.)
    // We are given a string s of '0's and '1's, and we may flip any '0' to a '1' or a '1' to a '0'.
    // Return the minimum number of flips to make s monotone increasing.

    // Example 1:
    // Input: s = "00110"
    // Output: 1
    // Explanation: We flip the last digit to get 00111.

    // Example 2:
    // Input: s = "010110"
    // Output: 2
    // Explanation: We flip to get 011111, or alternatively 000111.

    // Example 3:
    // Input: s = "00011000"
    // Output: 2
    // Explanation: We flip to get 00000000.

    // Note:
    // 1 <= s.length <= 20000
    // s only consists of '0' and '1' characters.

    func minFlipsMonoIncr(_ S: String) -> Int {
        let N = S.count
        var index = S.startIndex
        var onesCount = [Int](repeating: 0, count: N + 1)
        var ans = Int.max

        for i in 0..<S.count {
            onesCount[i + 1] = onesCount[i] + (S[index] == "1" ? 1 : 0)
            index = S.index(after: index)
        }

        for i in 0...S.count { ans =  min(ans, onesCount[i] + N - i - (onesCount[N] - onesCount[i])) }
        return ans
    }

}