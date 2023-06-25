class Solution {

    // Solution @ Sergey Leschev

    // 524. Longest Word in Dictionary through Deleting
    // Given a string s and a string array dictionary, return the longest string in the dictionary that can be formed by deleting some of the given string characters. If there is more than one possible result, return the longest word with the smallest lexicographical order. If there is no possible result, return the empty string.

    // Example 1:
    // Input: s = "abpcplea", dictionary = ["ale","apple","monkey","plea"]
    // Output: "apple"

    // Example 2:
    // Input: s = "abpcplea", dictionary = ["a","b","c"]
    // Output: "a"
     
    // Constraints:
    // 1 <= s.length <= 1000
    // 1 <= dictionary.length <= 1000
    // 1 <= dictionary[i].length <= 1000
    // s and dictionary[i] consist of lowercase English letters.

    func findLongestWord(_ s: String, _ d: [String]) -> String {
        let chars = Array(s)
        var res = ""
        
        for str in d {
            var strArr = Array(str)
            var i = 0
            
            for char in chars where i < strArr.count && char == strArr[i] { i += 1 }
            
            if i == strArr.count && i >= res.count {
                if i > res.count || res.compare(str) == .orderedDescending { res = str }
            }
        }

        return res
    }

}