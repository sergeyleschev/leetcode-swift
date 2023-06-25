class Solution {

    // Solution @ Sergey Leschev

    // 1324. Print Words Vertically
    // Given a string s. Return all the words vertically in the same order in which they appear in s.
    // Words are returned as a list of strings, complete with spaces when is necessary. (Trailing spaces are not allowed).
    // Each word would be put on only one column and that in one column there will be only one word.

    // Example 1:
    // Input: s = "HOW ARE YOU"
    // Output: ["HAY","ORO","WEU"]
    // Explanation: Each word is printed vertically. 
    //  "HAY"
    //  "ORO"
    //  "WEU"

    // Example 2:
    // Input: s = "TO BE OR NOT TO BE"
    // Output: ["TBONTB","OEROOE","   T"]
    // Explanation: Trailing spaces is not allowed. 
    // "TBONTB"
    // "OEROOE"
    // "   T"

    // Example 3:
    // Input: s = "CONTEST IS COMING"
    // Output: ["CIC","OSO","N M","T I","E N","S G","T"]

    // Constraints:
    // 1 <= s.length <= 200
    // s contains only upper case English letters.
    // It's guaranteed that there is only one space between 2 words.

    func printVertically(_ s: String) -> [String] {
        let compoments = s.split(separator: " ").map { [Character]($0) }
        var maxCount = 0
        for arr in compoments { maxCount = max(arr.count, maxCount) }
        var ans = [String](repeating: "", count: maxCount)

        for index in 0..<maxCount {
            for chars in compoments { ans[index].append(index >= chars.count ? " " : chars[index]) }
        }

        for i in 0..<maxCount { while ans[i].last! == " " { ans[i].removeLast() } }
        
        return ans
    }

 }