class Solution {

	// Solution @ Sergey Leschev, Belarusian State University

	// 28. Implement strStr()
	// Implement strStr().
	// Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

	// Clarification:
	// What should we return when needle is an empty string? This is a great question to ask during an interview.
	// For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().

	// Example 1:
	// Input: haystack = "hello", needle = "ll"
	// Output: 2

	// Example 2:
	// Input: haystack = "aaaaa", needle = "bba"
	// Output: -1

	// Example 3:
	// Input: haystack = "", needle = ""
	// Output: 0
	 
	// Constraints:
	// 0 <= haystack.length, needle.length <= 5 * 10^4
	// haystack and needle consist of only lower-case English characters.

    func strStr(_ haystack: String, _ needle: String) -> Int {
		guard haystack.count >= needle.count else { return -1 }
		let chars1 = Array(haystack)
		let chars2 = Array(needle)
		
        for i in 0..<chars1.count - chars2.count + 1 {
			var count = 0
			for j in 0..<chars2.count {
				if chars1[i + j] != chars2[j] { break }
				count += 1
			}
			if count == chars2.count {
				return i
			} else {
				continue
			}
		}
        return -1
    }

}