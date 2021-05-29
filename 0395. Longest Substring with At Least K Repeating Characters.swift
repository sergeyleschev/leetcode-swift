class Solution {

    // 395. Longest Substring with At Least K Repeating Characters
    // Given a string s and an integer k, return the length of the longest substring of s such that the frequency of each character in this substring is greater than or equal to k.

    // Finds the length of the longest substring of `s` such that the frequency of
    // each character in this substring is less than or equal to `k`.

    // - Parameters:
    //   - s: A string.
    //   - k: An integer.
    // - Returns: The length of the longest substring.

    // Example 1:
    // Input: s = "aaabb", k = 3
    // Output: 3
    // Explanation: The longest substring is "aaa", as 'a' is repeated 3 times.

    // Example 2:
    // Input: s = "ababbc", k = 2
    // Output: 5
    // Explanation: The longest substring is "ababb", as 'a' is repeated 2 times and 'b' is repeated 3 times.

    // Constraints:
    // 1 <= s.length <= 10^4
    // s consists of only lowercase English letters.
    // 1 <= k <= 10^5

    // - Complexity:
    //   - time: O(maxUnique * n), where `maxUnique` is the number of unique letters in `s`, and n is the length of `s`.
    //   - space: O(1), only constant space is used.

    func longestSubstring(_ s: String, _ k: Int) -> Int {
        let aValue = Character("a").asciiValue ?? 0
        let str = s.map { Int(($0.asciiValue ?? 0) - aValue) }
        let maxUnique = getMaxUniqueLetters(from: s)
        var ans = 0

        let n = s.count
        for i in 1...maxUnique {
            var countMap = [Int](repeating: 0, count: 26)
            var windowStart = 0
            var windowEnd = 0
            var idx = 0
            var unique = 0
            var countAtLeastK = 0

            while windowEnd < n {
                if unique <= i {
                    idx = str[windowEnd]
                    if countMap[idx] == 0 { unique += 1 }
                    countMap[idx] += 1
                    if countMap[idx] == k { countAtLeastK += 1 }
                    windowEnd += 1
                    
                } else {
                    idx = str[windowStart]
                    if countMap[idx] == k { countAtLeastK -= 1 }
                    countMap[idx] -= 1
                    if countMap[idx] == 0 { unique -= 1 }
                    windowStart += 1
                }

                guard unique == i, unique == countAtLeastK else { continue }
                ans = max(ans, windowEnd - windowStart)
            }
        }

        return ans
    }


    private func getMaxUniqueLetters(from str: String) -> Int {
        var set = Set<Character>()
        var ans = 0

        for ch in str {
            guard !set.contains(ch) else { continue }
            ans += 1
            set.insert(ch)
        }

        return ans
    }

}