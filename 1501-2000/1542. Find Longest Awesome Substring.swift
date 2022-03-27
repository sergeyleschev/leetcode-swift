class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 1542. Find Longest Awesome Substring
    // Given a string s. An awesome substring is a non-empty substring of s such that we can make any number of swaps in order to make it palindrome.

    // Return the length of the maximum length awesome substring of s.

    // Example 1:
    // Input: s = "3242415"
    // Output: 5
    // Explanation: "24241" is the longest awesome substring, we can form the palindrome "24142" with some swaps.

    // Example 2:
    // Input: s = "12345678"
    // Output: 1

    // Example 3:
    // Input: s = "213123"
    // Output: 6
    // Explanation: "213123" is the longest awesome substring, we can form the palindrome "231132" with some swaps.

    // Example 4:
    // Input: s = "00"
    // Output: 2

    // Constraints:
    // 1 <= s.length <= 10^5
    // s consists only of digits.

    func longestAwesome(_ s: String) -> Int {
        var ans = 1
        var state = [[Bool]: Int]()
        let sToIntNumbers = s.map { Int($0.asciiValue! - 48) }
        var curState = [Bool](repeating: false, count: 10)
        let N = s.count

        
        func getMaxLength(_ curState: [Bool], _ curIndex: Int) -> Int {
            var ans = 1
            if let index = state[curState] { ans = max(ans, curIndex - index) }
            var stateCopy = curState
            for i in 0..<10 {
                let t = stateCopy[i]
                stateCopy[i] = !t
                if let index = state[stateCopy] { ans = max(curIndex - index, ans) }
                stateCopy[i] = t
            }
            return ans
        }

        state[curState] = -1
        for i in 0..<N {
            curState[sToIntNumbers[i] ] = !curState[sToIntNumbers[i]]
            ans = max(getMaxLength(curState, i), ans)
            if nil == state[curState] { state[curState] = i }
        }
        return ans
    }

}