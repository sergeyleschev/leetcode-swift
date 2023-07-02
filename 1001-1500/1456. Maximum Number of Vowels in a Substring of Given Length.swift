class Solution {

    // Solution by Sergey Leschev

    // 1456. Maximum Number of Vowels in a Substring of Given Length
    // Given a string s and an integer k.
    // Return the maximum number of vowel letters in any substring of s with length k.
    // Vowel letters in English are (a, e, i, o, u).

    // Example 1:
    // Input: s = "abciiidef", k = 3
    // Output: 3
    // Explanation: The substring "iii" contains 3 vowel letters.

    // Example 2:
    // Input: s = "aeiou", k = 2
    // Output: 2
    // Explanation: Any substring of length 2 contains 2 vowels.

    // Example 3:
    // Input: s = "leetcode", k = 3
    // Output: 2
    // Explanation: "lee", "eet" and "ode" contain 2 vowels.

    // Example 4:
    // Input: s = "rhythms", k = 4
    // Output: 0
    // Explanation: We can see that s doesn't have any vowel letters.

    // Example 5:
    // Input: s = "tryhard", k = 4
    // Output: 1

    // Constraints:
    // 1 <= s.length <= 10^5
    // s consists of lowercase English letters.
    // 1 <= k <= s.length

    func maxVowels(_ s: String, _ k: Int) -> Int {
        let vowelLetters = ["a", "e", "i", "o", "u"]
        var tmp = [Int]()
        var max = 0
        var diff = 0

        for char in s {
            let value = vowelLetters.contains(String(char)) ? 1 : 0
            tmp.append(value)
            diff += value

            if tmp.count > k { diff -= tmp.removeFirst() }
            if diff > max { max = diff }
        }

        return max
    }

}
