class Solution {

	// 1930. Unique Length-3 Palindromic Subsequences
	// Given a string s, return the number of unique palindromes of length three that are a subsequence of s.
	// Note that even if there are multiple ways to obtain the same subsequence, it is still only counted once.
	// A palindrome is a string that reads the same forwards and backwards.
	// A subsequence of a string is a new string generated from the original string with some characters (can be none) deleted without changing the relative order of the remaining characters.
	// For example, "ace" is a subsequence of "abcde".

	// Example 1:
	// Input: s = "aabca"
	// Output: 3
	// Explanation: The 3 palindromic subsequences of length 3 are:
	// - "aba" (subsequence of "aabca")
	// - "aaa" (subsequence of "aabca")
	// - "aca" (subsequence of "aabca")

	// Example 2:
	// Input: s = "adc"
	// Output: 0
	// Explanation: There are no palindromic subsequences of length 3 in "adc".

	// Example 3:
	// Input: s = "bbcbaba"
	// Output: 4
	// Explanation: The 4 palindromic subsequences of length 3 are:
	// - "bbb" (subsequence of "bbcbaba")
	// - "bcb" (subsequence of "bbcbaba")
	// - "bab" (subsequence of "bbcbaba")
	// - "aba" (subsequence of "bbcbaba")

	// Constraints:
	// 3 <= s.length <= 10^5
	// s consists of only lowercase English letters.

	func countPalindromicSubsequence(_ S: String) -> Int {
		let s = Array(S)
		var index = [[Int]](repeating: [-1, -1], count: 26)
		var ans = 0

		for i in s.indices {
			let curr = s[i].intValue
			if index[curr][0] == -1 {
				index[curr][0] = i
			} else {
				index[curr][1] = i
			}
		}

		for i in 0 ..< 26 {
			var curr = Set<Character>()
			for j in stride(from: index[i][0] + 1, to: index[i][1], by: 1) { curr.insert(s[j]) }
			ans += curr.count
		}
		return ans
	}
}


extension Character {
	var asciiValueNormalized: Int { Int(self.asciiValue ?? 0) }
	var intValue: Int { self.asciiValueNormalized - Character("a").asciiValueNormalized }
}