class Solution {

	// Solution @ Sergey Leschev

	// 132. Palindrome Partitioning II
	// Given a string s, partition s such that every substring of the partition is a palindrome.
	// Return the minimum cuts needed for a palindrome partitioning of s.

	// Example 1:
	// Input: s = "aab"
	// Output: 1
	// Explanation: The palindrome partitioning ["aa","b"] could be produced using 1 cut.

	// Example 2:
	// Input: s = "a"
	// Output: 0

	// Example 3:
	// Input: s = "ab"
	// Output: 1
	 
	// Constraints:
	// 1 <= s.length <= 2000
	// s consists of lower-case English letters only.

    func minCut(_ s: String) -> Int {
        let chars = Array(s)
        var dp0: [[Bool]] = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
		
        for i in (0..<s.count).reversed() {
			for j in (i..<s.count).reversed() {
				if i == j {
					dp0[i][j] = true
				
                } else if chars[i] == chars[j] {
					dp0[i][j] = i + 1 == j || dp0[i+1][j-1]
				}
			}
		}

		var dp1: [Int] = Array(repeating: Int.max, count: s.count + 1)
		
        dp1[0] = -1
		for i in 1...s.count {
			for j in 0..<i {
				if dp0[j][i-1] == true {
					dp1[i] = min(dp1[j] + 1, dp1[i])
				}
			}
		}
        return dp1[s.count]
    }
    
}