class Solution {

    // Solution by Sergey Leschev

    // 763. Partition Labels
    // You are given a string s. We want to partition the string into as many parts as possible so that each letter appears in at most one part.
    // Return a list of integers representing the size of these parts.

    // Partitions a string into as many parts as possible so that each letter appears in at most one part.
    
    // - Parameter S: The string.
    // - Returns: A list of integers representing the size of parts.

    // Example 1:
    // Input: s = "ababcbacadefegdehijhklij"
    // Output: [9,7,8]
    // Explanation:
    // The partition is "ababcbaca", "defegde", "hijhklij".
    // This is a partition so that each letter appears in at most one part.
    // A partition like "ababcbacadefegde", "hijhklij" is incorrect, because it splits s into less parts.

    // Example 2:
    // Input: s = "eccbbbbdec"
    // Output: [10]

    // Constraints:
    // 1 <= s.length <= 500
    // s consists of lowercase English letters.

    // - Complexity:
    //   - time: O(n), where n is the length of the given string.
    //   - space: O(n), where n is the length of the given string.
    
    func partitionLabels(_ S: String) -> [Int] {
        var dict = [Character: Int]()
        var j = 0
        var anchor = 0
        var ans = [Int]()

        for (i, ch) in S.enumerated() { dict[ch] = i }

        for (i, ch) in S.enumerated() {
            j = max(j, dict[ch] ?? -1)
            guard i == j else { continue }
            ans.append(i - anchor + 1)
            anchor = i + 1
        }

        return ans
    }

}