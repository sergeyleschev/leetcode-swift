class Solution {

    // Solution by Sergey Leschev
    // 2800. Shortest String That Contains Three Strings
    // Time complexity: O(n^2)
    // Space complexity: O(n)

    // Intuition
    // The problem requires finding the minimum length string that contains three given strings, a, b, and c, as substrings. To make it lexicographically smallest, we want to combine the strings in the order that preserves the smallest characters.

    // Approach
    // The Solution class has two functions: merge and minimumString.
    // merge: This function takes two strings, s1 and s2, and returns the merged string by appending s2 to s1 if s2 is a substring of s1. Otherwise, it finds the smallest suffix of s1 that matches the prefix of s2 and concatenates them.
    // minimumString: This function takes three strings, a, b, and c, as input. It tries to merge the three strings in different orders using the merge function to get all possible combinations. Then, it keeps track of the smallest merged string found and returns it as the final result.

    // Complexity
    // Time complexity: O(n^2)
    // The merge function involves iterating through the characters of s1 to find the smallest suffix that matches the prefix of s2. Since the length of s1 and s2 can each be up to 100, the worst-case time complexity for merge is O(n^2), where n is the maximum length of s1 or s2. The minimumString function performs six different combinations of merge operations, so the overall time complexity is still O(n^2).

    // Space complexity: O(n)
    // The space complexity is O(n) because we use a variable res to store the merged string, and a variable l to store the length of the merged string. Both of these variables are linearly related to the length of the strings involved in the merge operations.

    private func merge(_ s1: String, _ s2: String) -> String {
        if s1.contains(s2) {
            return s1
        }

        for i in s1.indices {
            if s2.starts(with: s1[i...]) {
                return String(s1[..<i]) + s2
            }
        }

        return s1 + s2
    }

    func minimumString(_ a: String, _ b: String, _ c: String) -> String {
        var res = ""
        var l = Int.max

        for s in [
            merge(merge(a, b), c),
            merge(merge(b, a), c),
            merge(merge(c, b), a),
            merge(merge(b, c), a),
            merge(merge(a, c), b),
            merge(merge(c, a), b),
        ] {
            if s.count < l {
                res = s
                l = s.count
            } else if s.count == l {
                res = min(res, s)
            }
        }

        return res
    }
}
