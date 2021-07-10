class Solution {
    
    // 1358. Number of Substrings Containing All Three Characters
    // Given a string s consisting only of characters a, b and c.
    // Return the number of substrings containing at least one occurrence of all these characters a, b and c.

    // Example 1:
    // Input: s = "abcabc"
    // Output: 10
    // Explanation: The substrings containing at least one occurrence of the characters a, b and c are "abc", "abca", "abcab", "abcabc", "bca", "bcab", "bcabc", "cab", "cabc" and "abc" (again). 

    // Example 2:
    // Input: s = "aaacb"
    // Output: 3
    // Explanation: The substrings containing at least one occurrence of the characters a, b and c are "aaacb", "aacb" and "acb". 

    // Example 3:
    // Input: s = "abc"
    // Output: 1

    // Constraints:
    // 3 <= s.length <= 5 x 10^4
    // s only consists of a, b or c characters.

    func numberOfSubstrings(_ s: String) -> Int {
        var ans = 0
        let chars = [Character](s)
        var lastIndexOfA = -1
        var lastIndexOfB = -1
        var lastIndexOfC = -1
        
        for index in 0..<s.count {
            switch chars[index] {
            case "a": lastIndexOfA = index
            case "b": lastIndexOfB = index
            case "c": lastIndexOfC = index
            default: break
            }
            let minIndex = min(lastIndexOfB, lastIndexOfA, lastIndexOfC)
            if minIndex != -1 { ans += minIndex + 1 }
        }

        return ans
    }

}