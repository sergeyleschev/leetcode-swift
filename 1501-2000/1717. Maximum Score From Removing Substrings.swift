class Solution {

    // Solution by Sergey Leschev

    // 1717. Maximum Score From Removing Substrings
    // You are given a string s and two integers x and y. You can perform two types of operations any number of times.
    // Remove substring "ab" and gain x points.
    // For example, when removing "ab" from "cabxbae" it becomes "cxbae".
    // Remove substring "ba" and gain y points.
    // For example, when removing "ba" from "cabxbae" it becomes "cabxe".
    // Return the maximum points you can gain after applying the above operations on s.

    // Example 1:
    // Input: s = "cdbcbbaaabab", x = 4, y = 5
    // Output: 19
    // Explanation:
    // - Remove the "ba" underlined in "cdbcbbaaabab". Now, s = "cdbcbbaaab" and 5 points are added to the score.
    // - Remove the "ab" underlined in "cdbcbbaaab". Now, s = "cdbcbbaa" and 4 points are added to the score.
    // - Remove the "ba" underlined in "cdbcbbaa". Now, s = "cdbcba" and 5 points are added to the score.
    // - Remove the "ba" underlined in "cdbcba". Now, s = "cdbc" and 5 points are added to the score.
    // Total score = 5 + 4 + 5 + 5 = 19.

    // Example 2:
    // Input: s = "aabbaaxybbaabb", x = 5, y = 4
    // Output: 20

    // Constraints:
    // 1 <= s.length <= 10^5
    // 1 <= x, y <= 10^4
    // s consists of lowercase English letters.

    private typealias SubstrAndStore = (str: String, score: Int)


    func maximumGain(_ s: String, _ x: Int, _ y: Int) -> Int {
        let sortedSubstrAndScores: [SubstrAndStore] = [("ab", x), ("ba", y)].sorted { $0.score > $1.score }
        var ans = 0
        var str = s

        for i in 0..<2 {
            let rel = delete(sortedSubstrAndScores[i].str, from: str, sortedSubstrAndScores[i].score)
            ans += rel.score
            str = rel.remainStr
        }
        return ans
    }
    

    private func delete(_ substr: String, from sourceStr: String, _ score: Int) -> (score:Int,remainStr: String){
        var remainStr = ""
        let secondChar = substr.last!
        let firstChar = substr.first!
        
        for ch in sourceStr {
            if ch == secondChar && !remainStr.isEmpty && remainStr.last! == firstChar {
                remainStr.removeLast()
            } else {
                remainStr.append(ch)
            }
        }
        return (((sourceStr.count - remainStr.count) >> 1 ) * score, remainStr)
    }

}