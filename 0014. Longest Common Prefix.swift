class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 14. Longest Common Prefix
    // Write a function to find the longest common prefix string amongst an array of strings.
    // If there is no common prefix, return an empty string "".

    // Example 1:
    // Input: strs = ["flower","flow","flight"]
    // Output: "fl"

    // Example 2:
    // Input: strs = ["dog","racecar","car"]
    // Output: ""
    // Explanation: There is no common prefix among the input strings.
     
    // Constraints:
    // 1 <= strs.length <= 200
    // 0 <= strs[i].length <= 200
    // strs[i] consists of only lower-case English letters.

    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else { return "" }
        
        let chars_array = strs.map({ Array($0) })
        var string = ""
        var i = 0
        
        while true {
            var c: Character? = nil
            for chars in chars_array {
                if i >= chars.count {
                    return string
                } else {
                    if c == nil {
                        c = chars[i]
                    } else if chars[i] != c! {
                        return string
                    }
                }  
            }
            string += String(c!)
            i += 1
        }
        
        return string
    }
    
}