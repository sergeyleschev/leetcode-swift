class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1737. Change Minimum Characters to Satisfy One of Three Conditions
    // You are given two strings a and b that consist of lowercase letters. In one operation, you can change any character in a or b to any lowercase letter.
    // Your goal is to satisfy one of the following three conditions:
    // Every letter in a is strictly less than every letter in b in the alphabet.
    // Every letter in b is strictly less than every letter in a in the alphabet.
    // Both a and b consist of only one distinct letter.
    // Return the minimum number of operations needed to achieve your goal.

    // Example 1:
    // Input: a = "aba", b = "caa"
    // Output: 2
    // Explanation: Consider the best way to make each condition true:
    // 1) Change b to "ccc" in 2 operations, then every letter in a is less than every letter in b.
    // 2) Change a to "bbb" and b to "aaa" in 3 operations, then every letter in b is less than every letter in a.
    // 3) Change a to "aaa" and b to "aaa" in 2 operations, then a and b consist of one distinct letter.
    // The best way was done in 2 operations (either condition 1 or condition 3).

    // Example 2:
    // Input: a = "dabadd", b = "cda"
    // Output: 3
    // Explanation: The best way is to make condition 1 true by changing b to "eee".

    // Constraints:
    // 1 <= a.length, b.length <= 10^5
    // a and b consist only of lowercase letters.

    func minCharacters(_ a: String, _ b: String) -> Int {
        var aCounter = [Int](repeating: 0, count: 26)
        var bCounter = [Int](repeating: 0, count: 26)
        let M = a.count
        let N = b.count
        var ans = Int.max
        var preffixA = 0
        var preffixB = 0

        for ch in a { aCounter[Int(ch.asciiValue! - 97)] += 1 }
        for ch in b { bCounter[Int(ch.asciiValue! - 97)] += 1 }

        for i in 0..<26 {
            preffixA += aCounter[i]
            preffixB += bCounter[i]
            
            ans = min(ans, M + N - (aCounter[i] + bCounter[i]))
            if i != 25 { ans = min(ans, M - preffixA + preffixB,N - preffixB + preffixA) }
        }
        return ans
    }

}