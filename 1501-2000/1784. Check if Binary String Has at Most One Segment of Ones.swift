class Solution {

    // Solution by Sergey Leschev

    // 1784. Check if Binary String Has at Most One Segment of Ones
    // Given a binary string s without leading zeros, return true if s contains at most one contiguous segment of ones. Otherwise, return false.

    // Example 1:
    // Input: s = "1001"
    // Output: false
    // Explanation: The ones do not form a contiguous segment.

    // Example 2:
    // Input: s = "110"
    // Output: true

    // Constraints:
    // 1 <= s.length <= 100
    // s[i] is either '0' or '1'.
    // s[0] is '1'.

    func checkOnesSegment(_ s: String) -> Bool {
        guard let firstIndexOfOne = s.firstIndex(of: "1") else { return true }
        guard let lastIndexOfOne = s.lastIndex(of: "1"), lastIndexOfOne != firstIndexOfOne else { return true }
        var idx = s.index(after: firstIndexOfOne)
        
        while idx < lastIndexOfOne {
            guard s[idx] == "1" else { return false }
            idx = s.index(after: idx)
        }
        return true
    }

}