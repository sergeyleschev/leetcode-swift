class Solution {

    // 859. Buddy Strings
    // Given two strings s and goal, return true if you can swap two letters in s so the result is equal to goal, otherwise, return false.
    // Swapping letters is defined as taking two indices i and j (0-indexed) such that i != j and swapping the characters at s[i] and s[j].
    // For example, swapping at indices 0 and 2 in "abcd" results in "cbad".

    // Finds if two letters in A can be swapped so the result is equal to B.
    
    // - Parameters:
    //   - A: A string of lowercase letters.
    //   - B: A string of lowercase letters.
    // - Returns: True if A after swapping can be equal to B, otherwise returns false.

    // Example 1:
    // Input: s = "ab", goal = "ba"
    // Output: true
    // Explanation: You can swap s[0] = 'a' and s[1] = 'b' to get "ba", which is equal to goal.

    // Example 2:
    // Input: s = "ab", goal = "ab"
    // Output: false
    // Explanation: The only letters you can swap are s[0] = 'a' and s[1] = 'b', which results in "ba" != goal.

    // Example 3:
    // Input: s = "aa", goal = "aa"
    // Output: true
    // Explanation: You can swap s[0] = 'a' and s[1] = 'a' to get "aa", which is equal to goal.

    // Example 4:
    // Input: s = "aaaaaaabc", goal = "aaaaaaacb"
    // Output: true

    // Constraints:
    // 1 <= s.length, goal.length <= 2 * 10^4
    // s and goal consist of lowercase letters.

    // - Complexity:
    //   - time: O(n), where n is the length of A and B.
    //   - space: O(n), where n is the length of A and B.
    
    func buddyStrings(_ A: String, _ B: String) -> Bool {
        guard A.count == B.count else { return false }
        var dif = [Int]()

        if A == B {
            var tmp = Set<Character>()
            for a in A { tmp.insert(a) }
            return tmp.count < A.count
        }

        var A = Array(A)
        var B = Array(B)

        for (i, a) in A.enumerated() {
            guard a != B[i] else { continue }
            dif.append(i)
        }

        return dif.count == 2 && A[dif[0]] == B[dif[1]] && A[dif[1]] == B[dif[0]]
    }

}