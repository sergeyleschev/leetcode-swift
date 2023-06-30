class Solution {

    // Solution by Sergey Leschev

    // 1234. Replace the Substring for Balanced String
    // You are given a string containing only 4 kinds of characters 'Q', 'W', 'E' and 'R'.
    // A string is said to be balanced if each of its characters appears n/4 times where n is the length of the string.
    // Return the minimum length of the substring that can be replaced with any other string of the same length to make the original string s balanced.
    // Return 0 if the string is already balanced.

    // Example 1:
    // Input: s = "QWER"
    // Output: 0
    // Explanation: s is already balanced.
    
    // Example 2:
    // Input: s = "QQWE"
    // Output: 1
    // Explanation: We need to replace a 'Q' to 'R', so that "RQWE" (or "QRWE") is balanced.
    
    // Example 3:
    // Input: s = "QQQW"
    // Output: 2
    // Explanation: We can replace the first "QQ" to "ER". 
    
    // Example 4:
    // Input: s = "QQQQ"
    // Output: 3
    // Explanation: We can replace the last 3 'Q' to make s = "QWER".

    // Constraints:
    // 1 <= s.length <= 10^5
    // s.length is a multiple of 4
    // s contains only 'Q', 'W', 'E' and 'R'.

    func balancedString(_ s: String) -> Int {
        let target = s.count / 4
        var arr: [Character: Int] = [:]
        var element: [Character: Int] = [:]
        let s = [Character](s)
        var l = 0, r = 0
        var count = s.count
        
        for c in s { if arr[c] == nil { arr[c] = 1 } else { arr[c]! += 1 } }

        for key in arr.keys {
            let num = arr[key]! - target
            if num > 0 { element[key] = num }
        }

        if element.isEmpty { return 0 }

        while l <= r, r < s.count {
            if element[s[r]] != nil { element[s[r]]! -= 1 }
            let res = element.values.reduce(0) { (res, val) -> Int in res + max(val, 0) }
            
            if res == 0 {
                count = min(count, r - l + 1)
                if element[s[l]] != nil { element[s[l]]! += 1 }
                if element[s[r]] != nil { element[s[r]]! += 1 }
                l += 1
            } else { r += 1 }
        }
        
        return count
    }

}