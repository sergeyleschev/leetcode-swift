class Solution {

    // 44. Wildcard Matching
    // Given an input string (s) and a pattern (p), implement wildcard pattern matching with support for '?' and '*' where:
    // '?' Matches any single character.
    // '*' Matches any sequence of characters (including the empty sequence).
    // The matching should cover the entire input string (not partial).

    // Example 1:
    // Input: s = "aa", p = "a"
    // Output: false
    // Explanation: "a" does not match the entire string "aa".

    // Example 2:
    // Input: s = "aa", p = "*"
    // Output: true
    // Explanation: '*' matches any sequence.

    // Example 3:
    // Input: s = "cb", p = "?a"
    // Output: false
    // Explanation: '?' matches 'c', but the second letter is 'a', which does not match 'b'.

    // Example 4:
    // Input: s = "adceb", p = "*a*b"
    // Output: true
    // Explanation: The first '*' matches the empty sequence, while the second '*' matches the substring "dce".

    // Example 5:
    // Input: s = "acdcb", p = "a*c?b"
    // Output: false
     
    // Constraints:
    // 0 <= s.length, p.length <= 2000
    // s contains only lowercase English letters.
    // p contains only lowercase English letters, '?' or '*'.

    func isMatch(_ s: String, _ p: String) -> Bool {
        var regular = ""
        var last: Character = " "
        
        for c in p {
            if c == "?" {
                regular += "."
            } else if c == "*" && last != "*" {
                regular += ".*"
            } else {
                regular += String(c)
            }
            last = c
        }
        return regularExpressionMatching(s, regular)
    }


    func regularExpressionMatching(_ s: String, _ p: String) -> Bool {
        //  1.
        var string = Array(s)
        var chars: [Character] = []
        var marks : [Bool] = []
        var is_mark: Bool = false
        var list = [[-1, -1, 1]] // [start, end, is need to add next start]

        for (_, c) in p.enumerated().reversed() {
            if c == "*" {
                is_mark = true
            } else {
                chars.insert(c, at: 0)
                marks.insert(is_mark, at: 0)
                is_mark = false
            }
        }
        

        //  2.
        func nextRange(_ list: [[Int]], _ char: Character, _ mark: Bool) -> [[Int]] {
            var res = Set<[Int]>()
            for range in list {
                let lower = range[0] + range[2]
                let upper = range[1] + 1
                for i in lower...upper {
                    if mark {
                        var j = i
                        var count = 0
                        while j < string.count {
                            if char == string[j] || char == "." {
                                j += 1
                                count += 1
                            } else {
                                break
                            }
                        }
                        j = i + (count > 0 ? count - 1 : 0) 
                        if count > 0 {
                            res.insert([i, j, 0])
                        } else {
                            res.insert(range)
                        }
                    } else {
                        if i < string.count && (char == string[i] || char == ".") {
                            res.insert([i, i, 1])
                        }
                    }
                }
            }

            return Array(res)
        }

        for (index, c) in chars.enumerated() {
            let mark = marks[index]
            list = nextRange(list, c, mark)
        }
        
        //  3.
        var max = Int.min
        for rang in list {
            max = max > rang[1] ? max : rang[1]
        }
        
        return max == string.count - 1
    }

}