class Solution {

    // We are given two strings, s and goal.
    // A shift on s consists of taking string s and moving the leftmost character to the rightmost position. For example, if s = 'abcde', then it will be 'bcdea' after one shift on s. Return true if and only if s can become goal after some number of shifts on s.

    // Example 1:
    // Input: s = 'abcde', goal = 'cdeab'
    // Output: true

    // Example 2:
    // Input: s = 'abcde', goal = 'abced'
    // Output: false
    // Note:
    // s and goal will have length at most 100.

    func rotateString(_ A: String, _ B: String) -> Bool { (A.count == B.count && (B + B).contains(A)) || (A.count == 0 && B.count == 0) }
    
}