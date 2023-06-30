class Solution {

    // Solution by Sergey Leschev

    // 76. Minimum Window Substring
    // Given two strings s and t of lengths m and n respectively, return the minimum window in s which will contain all the characters in t. If there is no such window in s that covers all characters in t, return the empty string "".
    // Note that If there is such a window, it is guaranteed that there will always be only one unique minimum window in s.

    // Example 1:
    // Input: s = "ADOBECODEBANC", t = "ABC"
    // Output: "BANC"

    // Example 2:
    // Input: s = "a", t = "a"
    // Output: "a"
     
    // Constraints:
    // m == s.length
    // n == t.length
    // 1 <= m, n <= 10^5
    // s and t consist of English letters.
     
    // Follow up: Could you find an algorithm that runs in O(m + n) time?

    func minWindow(_ s: String, _ t: String) -> String {
        guard s.count >= t.count else { return "" }
        
        let sChars = Array(s)
        let tChars = Array(t)
        
        let indexs = validIndexs(sChars, tChars)
        guard s.count >= t.count else { return "" }
        
        let target = targetChars(tChars)
        let firstMatchIndex = firstMatch(sChars, indexs, target) 
        var start = firstMatchIndex.0
        var end = firstMatchIndex.1
        
        if end == -1 {
            return ""
        }
        
        var tmp: [Character: Int] = [:]
        for i in indexs {
            if i < indexs[start] {
                continue
            }
            
            if i > indexs[end] {
                break
            }
            
            let c = sChars[i]
            if let _ = tmp[c] {
                tmp[c]! += 1 
            
            } else {
                tmp[c] = 1
            }
        }
        
        var minLength = indexs[end] - indexs[start]
        var minStart = start
        
        while end < indexs.count {
            //  start +1
            let c = sChars[indexs[start]]
            
            if tmp[c]! > target[c]! {
                start += 1
                tmp[c]! -= 1
                let currentLength = indexs[end] - indexs[start]
                minLength = minLength < currentLength ? minLength : currentLength
                minStart = minLength < currentLength ? minStart : start
                continue
            
            } else {
                start += 1
                tmp[c]! -= 1
                end += 1
                while end < indexs.count {
                    let e = sChars[indexs[end]]
                    tmp[e]! += 1
                    if e == c {
                        let currentLength = indexs[end] - indexs[start]
                        minLength = minLength < currentLength ? minLength : currentLength
                        minStart = minLength < currentLength ? minStart : start
                        break
                    }
                    end += 1
                }  
            }
        }
        
        return Array(sChars[indexs[minStart]...indexs[minStart] + minLength]).join("")
    }

    
    func firstMatch(_ s: [Character], _ indexs: [Int], _ target: [Character: Int]) -> (Int, Int) {
        var target = target
        var tmp = -1
        
        func reachTarget() -> Bool {
            var res = true
            for (_, value) in target {
                if value > 0 {
                    res = false
                    break
                }
            }
            return res
        }
        
        for (i, index) in indexs.enumerated() {
            target[s[index]]! -= 1
            if reachTarget() {
                tmp = i
                break
            }
        }
        
        return (0, tmp)
    }
    

    func validIndexs(_ s: [Character], _ t: [Character]) -> [Int] {
        var res: [Int] = []
        
        for (i, c) in s.enumerated() {
            if t.contains(c) { res.append(i) }
        }
        
        return res
    }

    
    func targetChars(_ t: [Character]) -> [Character: Int] {
        var map: [Character: Int] = [:]
        
        for c in t {
            if let _ = map[c] { map[c]! += 1 } else { map[c] = 1 }
        }
        
        return map
    }

}


extension Array {
    func join(_ s: String) -> String {
        guard self.count > 0 else { return "" }
        if self.count == 1 { return "\(self[0])" }
        var string = ""

        for i in 0..<self.count - 1 { string += "\(self[i])\(s)" }
        
        string += "\(self[self.count - 1])"
        return string
    }
}