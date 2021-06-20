class Solution {

    // 821. Shortest Distance to a Character
    // Given a string s and a character c that occurs in s, return an array of integers answer where answer.length == s.length and answer[i] is the distance from index i to the closest occurrence of character c in s.
    // The distance between two indices i and j is abs(i - j), where abs is the absolute value function.

    // Finds an array of integers answer where answer.count == s.count and answer[i] is the shortest distance from s[i] to the character c in s.
    
    // - Parameters:
    //   - s: A string.
    //   - c: A character.
    // - Returns: An array of integers answer.

    // Example 1:
    // Input: s = "loveleetcode", c = "e"
    // Output: [3,2,1,0,1,0,0,1,2,2,1,0]
    // Explanation: The character 'e' appears at indices 3, 5, 6, and 11 (0-indexed).
    // The closest occurrence of 'e' for index 0 is at index 3, so the distance is abs(0 - 3) = 3.
    // The closest occurrence of 'e' for index 1 is at index 3, so the distance is abs(1 - 3) = 3.
    // For index 4, there is a tie between the 'e' at index 3 and the 'e' at index 5, but the distance is still the same: abs(4 - 3) == abs(4 - 5) = 1.
    // The closest occurrence of 'e' for index 8 is at index 6, so the distance is abs(8 - 6) = 2.

    // Example 2:
    // Input: s = "aaab", c = "b"
    // Output: [3,2,1,0]

    // Constraints:
    // 1 <= s.length <= 10^4
    // s[i] and c are lowercase English letters.
    // It is guaranteed that c occurs at least once in s.

    // - Complexity:
    //   - time: O(n), where n is the length of the s.
    //   - space: O(n), where n is the length of the s.
    
    func shortestToChar(_ s: String, _ c: Character) -> [Int] {
        let s = Array(s)
        let n = s.count
        var ans = [Int](repeating: 0, count: n)

        var prev = Int.min / 2
        for i in 0..<n {
            if s[i] == c { prev = i }
            ans[i] = i - prev
        }
        
        prev = Int.max / 2
        for i in (0..<n).reversed() {
            if s[i] == c { prev = i }
            ans[i] = min(ans[i], prev - i)
        }
        
        return ans
    }

}