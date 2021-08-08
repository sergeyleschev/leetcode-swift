class Solution {

    // 1869. Longer Contiguous Segments of Ones than Zeros
    // Given a binary string s, return true if the longest contiguous segment of 1s is strictly longer than the longest contiguous segment of 0s in s. Return false otherwise.
    // For example, in s = "110100010" the longest contiguous segment of 1s has length 2, and the longest contiguous segment of 0s has length 3.
    // Note that if there are no 0s, then the longest contiguous segment of 0s is considered to have length 0. The same applies if there are no 1s.

    // Example 1:
    // Input: s = "1101"
    // Output: true
    // Explanation:
    // The longest contiguous segment of 1s has length 2: "1101"
    // The longest contiguous segment of 0s has length 1: "1101"
    // The segment of 1s is longer, so return true.

    // Example 2:
    // Input: s = "111000"
    // Output: false
    // Explanation:
    // The longest contiguous segment of 1s has length 3: "111000"
    // The longest contiguous segment of 0s has length 3: "111000"
    // The segment of 1s is not longer, so return false.

    // Example 3:
    // Input: s = "110100010"
    // Output: false
    // Explanation:
    // The longest contiguous segment of 1s has length 2: "110100010"
    // The longest contiguous segment of 0s has length 3: "110100010"
    // The segment of 1s is not longer, so return false.

    // Constraints:
    // 1 <= s.length <= 100
    // s[i] is either '0' or '1'.

    func checkZeroOnes(_ s: String) -> Bool {
        var ones = 0
        var zeros = 0
        var idx = s.startIndex

        while idx < s.endIndex {
            var idx2 = idx
            while idx2 < s.endIndex && s[idx2] == s[idx] { idx2 = s.index(after: idx2) }
            
            let cnt = s.distance(from: idx, to: idx2)
            
            if s[idx] == "1" {
                if ones < cnt { ones = cnt }
            } else {
                if zeros < cnt { zeros = cnt }
            }
            idx = idx2
        }
        
        return ones > zeros
    }

}