class Solution {

    // 1016. Binary String With Substrings Representing 1 To N
    // Given a binary string s (a string consisting only of '0' and '1's) and a positive integer n, return true if and only if for every integer x from 1 to n, the binary representation of x is a substring of s.

    // Example 1:
    // Input: s = "0110", n = 3
    // Output: true

    // Example 2:
    // Input: s = "0110", n = 4
    // Output: false

    // Note:
    // 1 <= s.length <= 1000
    // 1 <= n <= 10^9

    func queryString(_ S: String, _ N: Int) -> Bool {
        let length = min(65, S.count + 1, intToString(N).count + 1)
        var intToStrings = [Set<String>](repeating: Set<String>(), count: length)
        let chars = [Character](S)

        for i in 1..<length {
            let maxCount = Int(pow(2.0, Double(i)))
            var j = i
            var k = 0
            while j <= S.count && intToStrings[i].count < maxCount {
                intToStrings[i].insert(String(chars[k..<j]))
                j += 1
                k += 1
            }
        }

        for i in 1...N {
            let str = intToString(i)
            if str.count >= length { return false }
            if !intToStrings[str.count].contains(str) { return false }
        }
        
        return true
    }


    func intToString(_ number: Int) -> String  {
        var ans = ""
        var i = number
        
        while i > 0 {
            let ch: Character = i & 1 == 0 ? "0" : "1"
            ans.insert(ch, at: ans.startIndex)
            i >>= 1
        }
        
        return ans
    }

}