class Solution {

    // Solution by Sergey Leschev

    // 1758. Minimum Changes To Make Alternating Binary String
    // You are given a string s consisting only of the characters '0' and '1'. In one operation, you can change any '0' to '1' or vice versa.
    // The string is called alternating if no two adjacent characters are equal. For example, the string "010" is alternating, while the string "0100" is not.

    // Return the minimum number of operations needed to make s alternating.

    // Example 1:
    // Input: s = "0100"
    // Output: 1
    // Explanation: If you change the last character to '1', s will be "0101", which is alternating.

    // Example 2:
    // Input: s = "10"
    // Output: 0
    // Explanation: s is already alternating.

    // Example 3:
    // Input: s = "1111"
    // Output: 2
    // Explanation: You need two operations to reach "0101" or "1010".

    // Constraints:
    // 1 <= s.length <= 10^4
    // s[i] is either '0' or '1'.

    func minOperations(_ s: String) -> Int {
        guard s.count > 1 else { return 0 }
        return min(getOPerationsCount(s, "0"), getOPerationsCount(s, "1"))
    }

    private func getOPerationsCount(_ s: String, _ startWith: Character) -> Int {
        var cnt = 0
        var idx = s.startIndex
        var last = startWith.next
        while idx < s.endIndex {
            if s[idx] != last.next { cnt += 1 }
            last = last.next
            idx = s.index(after: idx)
        }
        return cnt
    }

}

extension Character {
    var next: Character { self == "0" ? "1" : "0" }
}
