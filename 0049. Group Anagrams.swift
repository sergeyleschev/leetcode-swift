class Solution {

    // Solution @ Sergey Leschev, Belarusian State University

    // 49. Group Anagrams
    // Given an array of strings strs, group the anagrams together. You can return the answer in any order.
    // An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

    // Example 1:
    // Input: strs = ["eat","tea","tan","ate","nat","bat"]
    // Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

    // Example 2:
    // Input: strs = [""]
    // Output: [[""]]

    // Example 3:
    // Input: strs = ["a"]
    // Output: [["a"]]
     
    // Constraints:
    // 1 <= strs.length <= 10^4
    // 0 <= strs[i].length <= 100
    // strs[i] consists of lower-case English letters.

    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map: [String: [String]] = [:]
        var res: [[String]] = []

        
        func sort(_ str: String) -> String {
            var chars = Array(str)
            let sorted = chars.sorted()
            var string = ""
            for c in sorted { string += String(c) }
            return string
        }

        for str in strs {
            let sorted_str = sort(str)
            if let _ = map[sorted_str] {
                map[sorted_str]?.append(str)
            } else {
                map[sorted_str] = [str]
            }
        }
        for (_, value) in map { res.append(value) }        
        return res
    }

}