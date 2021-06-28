class Solution {

    // 1156. Swap For Longest Repeated Character Substring
    // Given a string text, we are allowed to swap two of the characters in the string. Find the length of the longest substring with repeated characters.

    // Example 1:
    // Input: text = "ababa"
    // Output: 3
    // Explanation: We can swap the first 'b' with the last 'a', or the last 'b' with the first 'a'. Then, the longest repeated character substring is "aaa", which its length is 3.

    // Example 2:
    // Input: text = "aaabaaa"
    // Output: 6
    // Explanation: Swap 'b' with the last 'a' (or the first 'a'), and we get longest repeated character substring "aaaaaa", which its length is 6.

    // Example 3:
    // Input: text = "aaabbaaa"
    // Output: 4

    // Example 4:
    // Input: text = "aaaaa"
    // Output: 5
    // Explanation: No need to swap, longest repeated character substring is "aaaaa", length is 5.

    // Example 5:
    // Input: text = "abcdef"
    // Output: 1

    // Constraints:
    // 1 <= text.length <= 20000
    // text consist of lowercase English characters only.

    typealias CharState = (length: Int, start: Int, end: Int)


    func maxRepOpt1(_ text: String) -> Int {
        let differentCharsLength = Set<Character>(text).count
        guard  differentCharsLength > 1 else { return text.count }
        guard differentCharsLength != text.count else { return 1 }
        var ans =  0
        var counter = [Character: [CharState]]()
        let chars = [Character](text)
        var state: CharState  = (-1, 0, -1)
        var i = 1

        while i < chars.count {
            if chars[i] != chars[i - 1] {
                state.end = i - 1
                state.length = state.end - state.start + 1
                if state.length > ans { ans  = state.length }
                if nil == counter[chars[i  - 1]] { counter[chars[i  - 1]] = [CharState]() }
                counter[chars[i  - 1]]?.append(state)
                state = (-1, i, -1)
            }
            i += 1
        }

        state.end = text.count - 1
        state.length = state.end - state.start + 1
        if nil == counter[chars.last!] {
            counter[chars.last!] = [state]
        } else {
            counter[chars.last!]?.append(state)
        }
        
        
        for (_, val) in counter {
            if val.count == 2 {
                ans = val[1].start - val[0].end  == 2 ? max(ans, val[1].length + val[0].length) : max(ans, val[0].length + 1, val[1].length + 1)
            }  else if val.count > 2 {
                for i in 0..<(val.count  - 1) {
                    ans = val[i + 1].start - 2 == val[i].end ? max(ans, val[i].length + 1 +  val[i + 1].length) : max(ans, val[i].length + 1)
                }
                ans = max(val.last!.length  + 1,ans)
            }
        }
        
        return ans
    }

}