class Solution {

    // Solution by Sergey Leschev

    // 1639. Number of Ways to Form a Target String Given a Dictionary
    // You are given a list of strings of the same length words and a string target.
    // Your task is to form target using the given words under the following rules:
    // target should be formed from left to right.
    // To form the ith character (0-indexed) of target, you can choose the kth character of the jth string in words if target[i] = words[j][k].
    // Once you use the kth character of the jth string of words, you can no longer use the xth character of any string in words where x <= k. In other words, all characters to the left of or at index k become unusuable for every string.
    // Repeat the process until you form the string target.
    // Notice that you can use multiple characters from the same string in words provided the conditions above are met.

    // Return the number of ways to form target from words. Since the answer may be too large, return it modulo 10^9 + 7.

    // Example 1:
    // Input: words = ["acca","bbbb","caca"], target = "aba"
    // Output: 6
    // Explanation: There are 6 ways to form target.
    // "aba" -> index 0 ("acca"), index 1 ("bbbb"), index 3 ("caca")
    // "aba" -> index 0 ("acca"), index 2 ("bbbb"), index 3 ("caca")
    // "aba" -> index 0 ("acca"), index 1 ("bbbb"), index 3 ("acca")
    // "aba" -> index 0 ("acca"), index 2 ("bbbb"), index 3 ("acca")
    // "aba" -> index 1 ("caca"), index 2 ("bbbb"), index 3 ("acca")
    // "aba" -> index 1 ("caca"), index 2 ("bbbb"), index 3 ("caca")

    // Example 2:
    // Input: words = ["abba","baab"], target = "bab"
    // Output: 4
    // Explanation: There are 4 ways to form target.
    // "bab" -> index 0 ("baab"), index 1 ("baab"), index 2 ("abba")
    // "bab" -> index 0 ("baab"), index 1 ("baab"), index 3 ("baab")
    // "bab" -> index 0 ("baab"), index 2 ("baab"), index 3 ("baab")
    // "bab" -> index 1 ("abba"), index 2 ("baab"), index 3 ("baab")

    // Example 3:
    // Input: words = ["abcd"], target = "abcd"
    // Output: 1

    // Example 4:
    // Input: words = ["abab","baba","abba","baab"], target = "abba"
    // Output: 16

    // Constraints:
    // 1 <= words.length <= 1000
    // 1 <= words[i].length <= 1000
    // All strings in words have the same length.
    // 1 <= target.length <= 1000
    // words[i] and target contain only lowercase English letters.

    // Solution: DP
    // improve time by pre-process words before
    // - use charArr[i][j] to record how many char i at word[j] in words
    // then use dp[i][j] to record number of ways use 0...i index to form target[0...k]
    // - can use an extra index to memorize pre found index ( this is for quick step to find next index)

    // - Complexity:
    //   - time: O(nk)
    //   - space: O(nk)

    func numWays(_ words: [String], _ target: String) -> Int {
        let mod = Int(1e9 + 7)
        var target = Array(target)
        let n = words[0].count
        let k = target.count
        var charArr = Array(repeating: Array(repeating: 0, count: n), count: 26) // charArr[i][j] means, how many char i at word[j] in words
        let charA = Character("a").asciiValue!
        var dp = Array(repeating: Array(repeating: 0, count: k), count: n)  // dp[i][j], number of ways use 0...i index to form target[0...k]
        var index = 0

        for word in words {
            var wordArr = Array(word)
            for i in 0..<n {
                let index = Int(wordArr[i].asciiValue! - charA)
                charArr[index][i] += 1
            }
        }

        for j in 0..<k {
            var temp = -1
            for i in index..<n {
                let c = Int(target[j].asciiValue! - charA)
                let val = charArr[c][i]
                if val > 0, temp == -1 { temp = i }
                dp[i][j] = (dp[i][j] + (i > 0 ? dp[i - 1][j] : 0) + val * (i > 0 && j > 0 ? dp[i - 1][j - 1] : 1)) % mod
            }

            if temp == -1 { return 0 } // temp == -1 means cannot find next proper index
            index = temp + 1
        }

        return dp[n - 1][k - 1]
    }

}