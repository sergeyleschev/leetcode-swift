class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 854. K-Similar Strings
    // Strings s1 and s2 are k-similar (for some non-negative integer k) if we can swap the positions of two letters in s1 exactly k times so that the resulting string equals s2.
    // Given two anagrams s1 and s2, return the smallest k for which s1 and s2 are k-similar.

    // Example 1:
    // Input: s1 = "ab", s2 = "ba"
    // Output: 1

    // Example 2:
    // Input: s1 = "abc", s2 = "bca"
    // Output: 2

    // Example 3:
    // Input: s1 = "abac", s2 = "baca"
    // Output: 2

    // Example 4:
    // Input: s1 = "aabc", s2 = "abca"
    // Output: 2

    // Constraints:
    // 1 <= s1.length <= 20
    // s2.length == s1.length
    // s1 and s2 contain only lowercase letters from the set {'a', 'b', 'c', 'd', 'e', 'f'}.
    // s2 is an anagram of s1.

    func kSimilarity(_ A: String, _ B: String) -> Int {
        guard A != B else { return 0 }
        let targetChars = [Character](B)
        let AChars = [Character](A)
        let ALength = AChars.count
        var visited = Set<String>()
        var queue = [A]
        var depth = 0

        visited.insert(A)

        while !queue.isEmpty {
            depth += 1
            var nextLevel = [String]()
            for str in queue {
                let chars = [Character](str)
                var index = 0
                while chars[index] == targetChars[index] { index += 1 }
                var j = index + 1
                while j < ALength {
                    if chars[j] == targetChars[index] && chars[j] != targetChars[j]{
                        var temp = chars
                        temp.swapAt(index, j)
                        let newStr = String(temp)
                        guard newStr != B else { return depth }
                        if !visited.contains(newStr) {
                            nextLevel.append(newStr)
                            visited.insert(newStr)
                        }
                    }
                    j += 1
                }
            }
            queue = nextLevel
        }
        
        return Int.max
    }

 }